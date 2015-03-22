Name:           puppet-ipv4_octet
Version:        %{?_version}
Release:        1%{?dist}
Summary:        Puppet function to return a given octet from an IP Address

License:        ASL 2.0
URL:            https://github.com/deanwilson/puppet-ipv4_octet
Source0:        https://github.com/deanwilson/puppet-ipv4_octet/archive/v%{version}.tar.gz

Requires:       puppet >= 3.0.0
Requires:       puppetlabs-stdlib >= 4.1.0

BuildArch:      noarch

%description
Puppet function to return a given octet from an IP Address.

%prep
%setup -q

%build

%install
rm -rf %{buildroot}
install -d -m 0755 %{buildroot}%{_datadir}/puppet/modules/ipv4_octet/
cp -pr * %{buildroot}%{_datadir}/puppet/modules/ipv4_octet/

%files
%defattr(0644,root,root,-)
%{_datadir}/puppet/modules/*
