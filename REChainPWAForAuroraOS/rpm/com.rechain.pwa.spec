Name:       com.rechain.pwa
Summary:    REChainPWA
Version:    1.0.2
Release:    12
Group:      Qt/Qt
License:    BSD-3-Clause
URL:        https://chainapp.codemagic.app
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
* Tue Jul 08 2025 Dmitry Sorokin <dim15168250@yandex.ru>
- Version 1.0.2
- Some new stuff ..
