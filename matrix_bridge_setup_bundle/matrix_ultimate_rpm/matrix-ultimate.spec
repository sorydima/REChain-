
Name:           matrix-ultimate
Version:        1.0
Release:        1%{?dist}
Summary:        Matrix Ultimate Bundle
License:        MIT
BuildArch:      noarch
BuildRoot:      %{_tmppath}/%{name}-%{version}-root

%description
Full self-hosted Matrix infrastructure bundle.

%install
mkdir -p %{buildroot}/opt/matrix
cp -a * %{buildroot}/opt/matrix

%files
/opt/matrix
