#include "WindowsSystemIntegration.h"
#include <iostream>
#include <sstream>
#include <filesystem>
#include <comdef.h>
#include <shobjidl.h>

#pragma comment(lib, "shell32.lib")
#pragma comment(lib, "ole32.lib")

WindowsSystemIntegration* WindowsSystemIntegration::s_instance = nullptr;
const UINT WindowsSystemIntegration::WM_SYSTEM_TRAY;
const UINT WindowsSystemIntegration::TRAY_ICON_ID;

WindowsSystemIntegration& WindowsSystemIntegration::GetInstance() {
    static WindowsSystemIntegration instance;
    return instance;
}

bool WindowsSystemIntegration::Initialize() {
    if (m_initialized) {
        return true;
    }
    
    try {
        s_instance = this;
        
        // Create hidden window for system tray messages
        WNDCLASS wc = {};
        wc.lpfnWndProc = SystemTrayWndProc;
        wc.hInstance = GetModuleHandle(nullptr);
        wc.lpszClassName = L"REChainSystemTrayWindow";
        
        if (!RegisterClass(&wc)) {
            DWORD error = GetLastError();
            if (error != ERROR_CLASS_ALREADY_EXISTS) {
                std::wcerr << L"[WindowsSystemIntegration] Failed to register window class: " << error << std::endl;
                return false;
            }
        }
        
        m_hiddenWindow = CreateWindow(
            L"REChainSystemTrayWindow",
            L"REChain System Tray",
            0, 0, 0, 0, 0,
            HWND_MESSAGE,
            nullptr,
            GetModuleHandle(nullptr),
            nullptr
        );
        
        if (!m_hiddenWindow) {
            std::wcerr << L"[WindowsSystemIntegration] Failed to create hidden window: " << GetLastError() << std::endl;
            return false;
        }
        
        // Initialize COM for jump lists and taskbar integration
        HRESULT hr = CoInitializeEx(nullptr, COINIT_APARTMENTTHREADED);
        if (FAILED(hr) && hr != RPC_E_CHANGED_MODE) {
            std::wcerr << L"[WindowsSystemIntegration] Failed to initialize COM: " << hr << std::endl;
            return false;
        }
        
        m_initialized = true;
        
        std::wcout << L"[WindowsSystemIntegration] Initialized successfully" << std::endl;
        return true;
    }
    catch (const std::exception& e) {
        std::wcerr << L"[WindowsSystemIntegration] Failed to initialize: " 
                   << std::wstring(e.what(), e.what() + strlen(e.what())).c_str() << std::endl;
        return false;
    }
}

void WindowsSystemIntegration::Shutdown() {
    if (!m_initialized) {
        return;
    }
    
    try {
        RemoveSystemTrayIcon();
        
        if (m_hiddenWindow) {
            DestroyWindow(m_hiddenWindow);
            m_hiddenWindow = nullptr;
        }
        
        UnregisterClass(L"REChainSystemTrayWindow", GetModuleHandle(nullptr));
        
        m_initialized = false;
        s_instance = nullptr;
        
        std::wcout << L"[WindowsSystemIntegration] Shutdown completed" << std::endl;
    }
    catch (const std::exception& e) {
        std::wcerr << L"[WindowsSystemIntegration] Error during shutdown: " 
                   << std::wstring(e.what(), e.what() + strlen(e.what())).c_str() << std::endl;
    }
}

bool WindowsSystemIntegration::CreateSystemTrayIcon() {
    if (!m_initialized || m_systemTrayCreated) {
        return false;
    }
    
    ZeroMemory(&m_notifyIconData, sizeof(NOTIFYICONDATA));
    m_notifyIconData.cbSize = sizeof(NOTIFYICONDATA);
    m_notifyIconData.hWnd = m_hiddenWindow;
    m_notifyIconData.uID = TRAY_ICON_ID;
    m_notifyIconData.uFlags = NIF_ICON | NIF_MESSAGE | NIF_TIP;
    m_notifyIconData.uCallbackMessage = WM_SYSTEM_TRAY;
    
    // Load application icon
    m_notifyIconData.hIcon = LoadIcon(GetModuleHandle(nullptr), MAKEINTRESOURCE(101));
    if (!m_notifyIconData.hIcon) {
        m_notifyIconData.hIcon = LoadIcon(nullptr, IDI_APPLICATION);
    }
    
    wcscpy_s(m_notifyIconData.szTip, L"REChain - Decentralized Communication");
    
    if (Shell_NotifyIcon(NIM_ADD, &m_notifyIconData)) {
        m_systemTrayCreated = true;
        std::wcout << L"[WindowsSystemIntegration] System tray icon created" << std::endl;
        return true;
    } else {
        std::wcerr << L"[WindowsSystemIntegration] Failed to create system tray icon: " << GetLastError() << std::endl;
        return false;
    }
}

void WindowsSystemIntegration::RemoveSystemTrayIcon() {
    if (m_systemTrayCreated) {
        Shell_NotifyIcon(NIM_DELETE, &m_notifyIconData);
        m_systemTrayCreated = false;
        std::wcout << L"[WindowsSystemIntegration] System tray icon removed" << std::endl;
    }
}

void WindowsSystemIntegration::UpdateSystemTrayIcon(const std::wstring& tooltip) {
    if (!m_systemTrayCreated) {
        return;
    }
    
    if (!tooltip.empty()) {
        wcscpy_s(m_notifyIconData.szTip, tooltip.c_str());
        Shell_NotifyIcon(NIM_MODIFY, &m_notifyIconData);
    }
}

void WindowsSystemIntegration::ShowSystemTrayMenu(POINT pt) {
    HMENU hMenu = CreatePopupMenu();
    if (!hMenu) {
        return;
    }
    
    AppendMenu(hMenu, MF_STRING, 1001, L"Open REChain");
    AppendMenu(hMenu, MF_SEPARATOR, 0, nullptr);
    AppendMenu(hMenu, MF_STRING, 1002, L"Settings");
    AppendMenu(hMenu, MF_STRING, 1003, L"About");
    AppendMenu(hMenu, MF_SEPARATOR, 0, nullptr);
    AppendMenu(hMenu, MF_STRING, 1004, L"Exit");
    
    SetForegroundWindow(m_hiddenWindow);
    
    UINT cmd = TrackPopupMenu(hMenu, TPM_RETURNCMD | TPM_RIGHTBUTTON, pt.x, pt.y, 0, m_hiddenWindow, nullptr);
    
    if (cmd > 0 && m_systemTrayMenuHandler) {
        m_systemTrayMenuHandler(cmd);
    }
    
    DestroyMenu(hMenu);
}

bool WindowsSystemIntegration::CreateJumpList() {
    try {
        ICustomDestinationList* pcdl = nullptr;
        HRESULT hr = CoCreateInstance(CLSID_DestinationList, nullptr, CLSCTX_INPROC_SERVER, IID_PPV_ARGS(&pcdl));
        
        if (SUCCEEDED(hr)) {
            UINT cMinSlots;
            IObjectArray* poaRemoved = nullptr;
            
            hr = pcdl->BeginList(&cMinSlots, IID_PPV_ARGS(&poaRemoved));
            
            if (SUCCEEDED(hr)) {
                // Add tasks category
                IObjectCollection* poc = nullptr;
                hr = CoCreateInstance(CLSID_EnumerableObjectCollection, nullptr, CLSCTX_INPROC_SERVER, IID_PPV_ARGS(&poc));
                
                if (SUCCEEDED(hr)) {
                    // Create "New Chat" task
                    IShellLink* psl = nullptr;
                    hr = CoCreateInstance(CLSID_ShellLink, nullptr, CLSCTX_INPROC_SERVER, IID_PPV_ARGS(&psl));
                    
                    if (SUCCEEDED(hr)) {
                        std::wstring exePath = GetExecutablePath();
                        psl->SetPath(exePath.c_str());
                        psl->SetArguments(L"--new-chat");
                        psl->SetDescription(L"Start a new chat");
                        
                        IPropertyStore* pps = nullptr;
                        hr = psl->QueryInterface(IID_PPV_ARGS(&pps));
                        
                        if (SUCCEEDED(hr)) {
                            PROPVARIANT pv;
                            InitPropVariantFromString(L"New Chat", &pv);
                            pps->SetValue(PKEY_Title, pv);
                            pps->Commit();
                            PropVariantClear(&pv);
                            pps->Release();
                        }
                        
                        poc->AddObject(psl);
                        psl->Release();
                    }
                    
                    IObjectArray* poa = nullptr;
                    hr = poc->QueryInterface(IID_PPV_ARGS(&poa));
                    
                    if (SUCCEEDED(hr)) {
                        pcdl->AddUserTasks(poa);
                        poa->Release();
                    }
                    
                    poc->Release();
                }
                
                pcdl->CommitList();
                
                if (poaRemoved) {
                    poaRemoved->Release();
                }
            }
            
            pcdl->Release();
            return SUCCEEDED(hr);
        }
        
        return false;
    }
    catch (...) {
        return false;
    }
}

bool WindowsSystemIntegration::SetStartupEnabled(bool enabled) {
    HKEY hKey;
    LONG result = RegOpenKeyEx(HKEY_CURRENT_USER, L"SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Run", 0, KEY_SET_VALUE, &hKey);
    
    if (result != ERROR_SUCCESS) {
        return false;
    }
    
    if (enabled) {
        std::wstring exePath = GetExecutablePath();
        std::wstring startupCommand = L"\"" + exePath + L"\" --startup";
        
        result = RegSetValueEx(hKey, L"REChain", 0, REG_SZ, 
                              reinterpret_cast<const BYTE*>(startupCommand.c_str()), 
                              static_cast<DWORD>((startupCommand.length() + 1) * sizeof(wchar_t)));
    } else {
        result = RegDeleteValue(hKey, L"REChain");
    }
    
    RegCloseKey(hKey);
    return result == ERROR_SUCCESS;
}

bool WindowsSystemIntegration::IsStartupEnabled() const {
    HKEY hKey;
    LONG result = RegOpenKeyEx(HKEY_CURRENT_USER, L"SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Run", 0, KEY_QUERY_VALUE, &hKey);
    
    if (result != ERROR_SUCCESS) {
        return false;
    }
    
    wchar_t buffer[MAX_PATH];
    DWORD bufferSize = sizeof(buffer);
    result = RegQueryValueEx(hKey, L"REChain", nullptr, nullptr, reinterpret_cast<LPBYTE>(buffer), &bufferSize);
    
    RegCloseKey(hKey);
    return result == ERROR_SUCCESS;
}

void WindowsSystemIntegration::ShowBalloonTip(const std::wstring& title, const std::wstring& message, DWORD icon) {
    if (!m_systemTrayCreated) {
        return;
    }
    
    m_notifyIconData.uFlags |= NIF_INFO;
    m_notifyIconData.dwInfoFlags = icon;
    wcscpy_s(m_notifyIconData.szInfoTitle, title.c_str());
    wcscpy_s(m_notifyIconData.szInfo, message.c_str());
    
    Shell_NotifyIcon(NIM_MODIFY, &m_notifyIconData);
    
    // Reset flags
    m_notifyIconData.uFlags &= ~NIF_INFO;
}

std::wstring WindowsSystemIntegration::GetExecutablePath() {
    wchar_t path[MAX_PATH];
    GetModuleFileName(nullptr, path, MAX_PATH);
    return std::wstring(path);
}

std::wstring WindowsSystemIntegration::GetApplicationDataPath() {
    wchar_t* appDataPath = nullptr;
    
    if (SUCCEEDED(SHGetKnownFolderPath(FOLDERID_RoamingAppData, 0, nullptr, &appDataPath))) {
        std::wstring result = std::wstring(appDataPath) + L"\\REChain";
        CoTaskMemFree(appDataPath);
        
        // Create directory if it doesn't exist
        std::filesystem::create_directories(result);
        
        return result;
    }
    
    return L"";
}

bool WindowsSystemIntegration::IsRunningAsAdmin() {
    BOOL isAdmin = FALSE;
    PSID adminGroup = nullptr;
    SID_IDENTIFIER_AUTHORITY ntAuthority = SECURITY_NT_AUTHORITY;
    
    if (AllocateAndInitializeSid(&ntAuthority, 2, SECURITY_BUILTIN_DOMAIN_RID, DOMAIN_ALIAS_RID_ADMINS, 0, 0, 0, 0, 0, 0, &adminGroup)) {
        CheckTokenMembership(nullptr, adminGroup, &isAdmin);
        FreeSid(adminGroup);
    }
    
    return isAdmin == TRUE;
}

void WindowsSystemIntegration::SetSystemTrayClickHandler(std::function<void()> handler) {
    m_systemTrayClickHandler = handler;
}

void WindowsSystemIntegration::SetSystemTrayMenuHandler(std::function<void(UINT)> handler) {
    m_systemTrayMenuHandler = handler;
}

LRESULT CALLBACK WindowsSystemIntegration::SystemTrayWndProc(HWND hwnd, UINT msg, WPARAM wParam, LPARAM lParam) {
    if (s_instance && msg == WM_SYSTEM_TRAY) {
        s_instance->HandleSystemTrayMessage(wParam, lParam);
        return 0;
    }
    
    return DefWindowProc(hwnd, msg, wParam, lParam);
}

void WindowsSystemIntegration::HandleSystemTrayMessage(WPARAM wParam, LPARAM lParam) {
    if (wParam != TRAY_ICON_ID) {
        return;
    }
    
    switch (lParam) {
        case WM_LBUTTONUP:
            if (m_systemTrayClickHandler) {
                m_systemTrayClickHandler();
            }
            break;
            
        case WM_RBUTTONUP:
            POINT pt;
            GetCursorPos(&pt);
            ShowSystemTrayMenu(pt);
            break;
    }
}
