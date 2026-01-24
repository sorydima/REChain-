Name:       com.rechain.pwa
Summary:    REChainPWA
Version:    4.1.10+1160
Release:    2
Group:      Qt/Qt
License:    BSD-3-Clause
URL:        https://chat.codemagic.app
Source0:    %{name}-%{version}.tar.bz2
Requires:   sailfishsilica-qt5 >= 0.10.9
BuildRequires:  pkgconfig(aurorawebview)
BuildRequires:  pkgconfig(auroraapp)
BuildRequires:  pkgconfig(Qt5Core)
BuildRequires:  pkgconfig(Qt5Qml)
BuildRequires:  pkgconfig(Qt5Quick)
BuildRequires:  pkgconfig(Qt5Network)

%description
REChain Messenger is a decentralized messaging app.

%prep
%autosetup

%build
%qmake5
%make_build

%install
%make_install

%files
%defattr(-,root,root,-)
%{_bindir}/%{name}
%defattr(644,root,root,-)
%{_datadir}/%{name}
%{_datadir}/applications/%{name}.desktop
%{_datadir}/icons/hicolor/*/apps/%{name}.png

%changelog
* Fri Jan 23 2026 Dmitry Sorokin <dim15168250@yandex.ru>
- Version 4.1.10
* Sat Aug 03 2024 REChain Team <support@rechain.network> - 4.1.10+1160-1
- Updated to version 4.1.10+1160
- Build 1160 for AuroraOS
* Tue Jul 08 2025 Dmitry Sorokin <dim15168250@yandex.ru>
- Version 1.0.2
- Some new stuff ..
