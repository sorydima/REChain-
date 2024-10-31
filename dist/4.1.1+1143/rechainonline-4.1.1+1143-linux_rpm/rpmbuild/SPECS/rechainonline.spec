Name: rechainonline
Version: 4.1.1+1143
Release: 1143%{?dist}
Summary: The inclusion of polls enhances decision-making processes by facilitating quick and efficient feedback gathering. Additionally, the platform supports user-friendly interface & goods!
Group: Applications/Development Tools
Vendor: Sorokin Dmitry Olegovich
Packager: Sorokin Dmitry Olegovich <sorydima@gmail.com>
License: AGPL 2.0
URL: https://github.com/sorydima/REChain-
Requires: mpv, libjsoncpp-dev, libsecret-1-dev, libsecret-1-0, librhash0, libwebkit2gtk-4.0-dev, libolm3
BuildArch: x86_64

%description
REChain v4.1.1 brings a sleek redesign with filter chips, OGG audio support on iOS, and improved security through authenticated media endpoints for Matrix SDK v1.11+.

%install
mkdir -p %{buildroot}%{_bindir}
mkdir -p %{buildroot}%{_datadir}/%{name}
mkdir -p %{buildroot}%{_datadir}/applications
mkdir -p %{buildroot}%{_datadir}/metainfo
mkdir -p %{buildroot}%{_datadir}/pixmaps
cp -r %{name}/* %{buildroot}%{_datadir}/%{name}
ln -s %{_datadir}/%{name}/%{name} %{buildroot}%{_bindir}/%{name}
cp -r %{name}.desktop %{buildroot}%{_datadir}/applications
cp -r %{name}.png %{buildroot}%{_datadir}/pixmaps
cp -r %{name}*.xml %{buildroot}%{_datadir}/metainfo || :
update-mime-database %{_datadir}/mime &> /dev/null || :

%postun
update-mime-database %{_datadir}/mime &> /dev/null || :

%files
%{_bindir}/%{name}
%{_datadir}/%{name}
%{_datadir}/applications/%{name}.desktop
%{_datadir}/metainfo


%defattr(-,root,root)

%attr(4755, root, root) %{_datadir}/pixmaps/%{name}.png
