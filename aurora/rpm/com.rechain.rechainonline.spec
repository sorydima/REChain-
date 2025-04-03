%global __provides_exclude_from ^%{_datadir}/%{name}/lib/.*$
%global __requires_exclude ^lib(dconf|flutter-embedder|maliit-glib|.+_platform_plugin)\\.so.*$

Name: com.rechain.rechainonline
Summary: The inclusion of polls enhances decision-making processes by facilitating quick and efficient feedback gathering. Additionally, the platform supports user-friendly interface & goods!
Version: 4.1.4
Release: 1147
License: AGPL-3.0 license
Source0: %{name}-%{version}.tar.zst

BuildRequires: cmake
BuildRequires: ninja

%description
%{summary}.

%prep
%autosetup

%build
%cmake -GNinja -DCMAKE_BUILD_TYPE=%{_flutter_build_type} -DPSDK_VERSION=%{_flutter_psdk_version} -DPSDK_MAJOR=%{_flutter_psdk_major}
%ninja_build

%install
%ninja_install

%files
%{_bindir}/%{name}
%{_datadir}/%{name}/*
%{_datadir}/applications/%{name}.desktop
%{_datadir}/icons/hicolor/*/apps/%{name}.png
%{_datadir}/icons/*
