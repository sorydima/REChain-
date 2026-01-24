Name:           com.rechain.online
Version:        4.1.10+1160
Release:        1160%{?dist}
Summary:        REChain - Secure Matrix Client for Aurora OS
License:        Apache-2.0
URL:            https://online.rechain.network
Source0:        %{name}-%{version}.tar.gz

BuildRequires:  cmake >= 3.16
BuildRequires:  gcc-c++
BuildRequires:  pkg-config
BuildRequires:  qt5-qtbase-devel
BuildRequires:  qt5-qtdeclarative-devel
BuildRequires:  qt5-qtmultimedia-devel
BuildRequires:  qt5-qtsensors-devel
BuildRequires:  flutter-embedder-devel
BuildRequires:  aurora-sdk-devel
BuildRequires:  systemd

Requires:       qt5-qtcore >= 5.15
Requires:       qt5-qtdbus >= 5.15
Requires:       qt5-qtmultimedia >= 5.15
Requires:       qt5-qtnetwork >= 5.15
Requires:       qt5-qtsensors >= 5.15
Requires:       libflutter-embedder >= 1.0
Requires:       aurora-sdk >= 1.0

%description
REChain is a secure, decentralized messaging client for Aurora OS
built on the Matrix protocol with end-to-end encryption support.

Key features:
- End-to-end encrypted messaging
- Matrix protocol with federation support
- Aurora OS native integration
- System notifications and indicators
- Background services
- Crash reporting

%prep
%autosetup -p1

%build
mkdir -p build
cd build

# Configure with CMake
cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=%{_prefix} \
    -DCMAKE_SYSTEM_PROCESSOR=%{_arch}

# Build
make -j%{?jobs}

%install
cd build
%make_install

# Install systemd service files
mkdir -p %{buildroot}%{_unitdir}
cp ../systemd/rechain.service %{buildroot}%{_unitdir}/

# Install icons
mkdir -p %{buildroot}%{_datadir}/icons/hicolor/{86x86,108x108,128x128,172x172,256x256,512x512}/apps
cp icons/*.png %{buildroot}%{_datadir}/icons/hicolor/*/apps/

# Create launcher symlink
mkdir -p %{buildroot}%{_bindir}
ln -sf %{_datadir}/%{name}/%{name} %{buildroot}%{_bindir}/%{name}

%check
# Run tests if available
cd build
if [ -f CTestTestfile.cmake ]; then
    ctest --output-on-failure
fi

%files
%{_bindir}/%{name}
%{_datadir}/%{name}/
%{_datadir}/applications/%{name}.desktop
%{_datadir}/icons/hicolor/*/apps/%{name}.png
%{_datadir}/doc/%{name}/
%{_sysconfdir}/%{name}/
%{_unitdir}/%{name}.service

%changelog
* Sat Dec 06 2025 REChain Team <support@rechain.network> 4.1.10+1160-1
- Updated to version 4.1.10+1160
- Added Aurora OS 4.2 support
- Improved notification service
- Fixed crash reporting
- Added performance optimizations

* Tue Jul 08 2025 REChain Team <support@rechain.network> 4.1.10+1152-1
- Initial Aurora OS release
- Added Matrix protocol support
- Added E2E encryption
- Added system integration
- Added notification service

* Sat Jun 01 2025 REChain Team <support@rechain.network> 4.1.9+1147-1
- Pre-release version
- Initial Aurora OS support

