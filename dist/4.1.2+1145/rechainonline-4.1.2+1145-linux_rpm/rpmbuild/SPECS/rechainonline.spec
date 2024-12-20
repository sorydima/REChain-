Name: rechainonline
Version: 4.1.2+1145
Release: 1145%{?dist}
Summary: The inclusion of polls enhances decision-making processes by facilitating quick and efficient feedback gathering. Additionally, the platform supports user-friendly interface & goods!
Group: Applications/Development Tools
Vendor: REChain Network Solutions
Packager: Sorokin Dmitry Olegovich <dmitry.justdev@gmail.com>
License: AGPL-3.0
URL: https://github.com/sorydima/REChain-.git
Requires: mpv, libjsoncpp-dev, libsecret-1-dev, libsecret-1-0, librhash0, libwebkit2gtk-4.0-dev, libolm3
BuildArch: x86_64

%description
REChain v4.1.2.

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
