%global debug_package %{nil}

Name:           rechainonline
Version:        4.1.8
Release:        1%{?dist}
Summary:        REChain - comprehensive platform for Matrix, blockchain, IPFS, AI
Summary(ru):    РЕЧейн - комплексная платформа для Matrix, блокчейн, IPFS, ИИ

License:        Proprietary
URL:            https://rechain.online
Source0:        %{name}-%{version}.tar.gz

BuildArch:      x86_64
Requires:       glibc, gtk3, glib2

%description
REChain is a comprehensive platform that unifies Matrix protocol, blockchain,
IPFS, AI, and external services into a seamless, extensible, and
developer-friendly ecosystem.

Supports Russian Linux systems including:
- РЕД ОС (RED OS)
- ОС «Альт» (ALT Linux)
- ОС РОСА (ROSA)
- «ОСнова» (OSNova)
- AlterOS
- ОС «Атлант» (Atlant OS)
- ОС «Стрелец» (Strelets OS)
- ОС «МСВСфера 9» (MSVSphere 9)
- ОС «Лотос» (Lotos OS)
- ОС «Эльбрус» (Elbrus OS)

%description -l ru
РЕЧейн - это комплексная платформа, которая объединяет протокол Matrix, блокчейн,
IPFS, ИИ и внешние сервисы в единую, расширяемую и удобную для разработчиков экосистему.

%prep
%setup -q

%build
# No build needed, pre-compiled Flutter application

%install
rm -rf $RPM_BUILD_ROOT
mkdir -p $RPM_BUILD_ROOT/usr/bin
mkdir -p $RPM_BUILD_ROOT/usr/share/rechainonline
mkdir -p $RPM_BUILD_ROOT/usr/share/applications
mkdir -p $RPM_BUILD_ROOT/usr/share/pixmaps

# Copy application files
cp -r * $RPM_BUILD_ROOT/usr/share/rechainonline/

# Create launcher script
cat > $RPM_BUILD_ROOT/usr/bin/rechainonline << 'EOF'
#!/bin/bash
cd /usr/share/rechainonline
exec ./rechainonline "$@"
EOF
chmod +x $RPM_BUILD_ROOT/usr/bin/rechainonline

# Create desktop entry
cat > $RPM_BUILD_ROOT/usr/share/applications/rechainonline.desktop << 'EOF'
[Desktop Entry]
Name=REChain
Name[ru]=РЕЧейн
Comment=REChain - comprehensive platform for Matrix, blockchain, IPFS, AI
Comment[ru]=РЕЧейн - комплексная платформа для Matrix, блокчейн, IPFS, ИИ
Exec=rechainonline
Icon=rechainonline
Terminal=false
Type=Application
Categories=Network;InstantMessaging;
StartupWMClass=rechainonline
MimeType=x-scheme-handler/matrix;
EOF

# Copy icon (assuming it exists in source)
cp rechainonline.png $RPM_BUILD_ROOT/usr/share/pixmaps/ || true

%files
%defattr(-,root,root,-)
/usr/bin/rechainonline
/usr/share/rechainonline/
/usr/share/applications/rechainonline.desktop
/usr/share/pixmaps/rechainonline.png

%changelog
* Sat Aug 03 2024 REChain Team <support@rechain.network> - 4.1.8-1
- Initial RPM package for Russian Linux systems
- Support for РЕД ОС, ОС «Альт», ОС РОСА, and other Russian distributions
