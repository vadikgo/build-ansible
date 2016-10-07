#!/bin/bash

# install ansible for rhel 6/7 from local network
# curl -Lk https://sbt-qa-jenkins.sigma.sbrf.ru/opir/opir-stuff/raw/master/ansible/ansible-install.sh | sh

set -e

url="http://10.21.25.212:8000/ansible-rpm"

join() { local a=("${@:3}"); printf "%s" "$2${a[@]/#/$1}"; }

if grep 'release 6' /etc/issue; then
  pkg=(rhel6/PyYAML-3.10-3.1.el6.x86_64.rpm \
      ansible-2.2.0.0-100.git201610061930.3c9966d.stable22.el6.noarch.rpm \
      libyaml-0.1.3-4.el6_6.x86_64.rpm \
      python-babel-0.9.4-5.1.el6.noarch.rpm \
      python-crypto-2.0.1-22.el6.x86_64.rpm \
      python-crypto2.6-2.6.1-2.el6.x86_64.rpm \
      python-httplib2-0.7.7-1.el6.noarch.rpm \
      python-jinja2-2.8-5.el6.noarch.rpm \
      python-keyczar-0.71c-1.el6.noarch.rpm \
      python-paramiko-1.7.5-2.1.el6.noarch.rpm \
      python-pyasn1-0.0.12a-1.el6.noarch.rpm \
      python-setuptools-0.6.10-3.el6.noarch.rpm \
      python-simplejson-2.0.9-3.1.el6.x86_64.rpm \
      python-markupsafe-0.9.2-4.el6.x86_64.rpm \
      python-six-1.9.0-2.el6.noarch.rpm \
      sshpass-1.05-1.el6.x86_64.rpm)
  pkg_list=$(join " $url/rhel6/" "${pkg[@]}")
  yum install -y $url/rhel6/$pkg_list
else
  # https://dl.fedoraproject.org/pub/epel/epel-release-latest-{{ansible_distribution_major_version}.noarch.rpm
  pkg=(python-backports-ssl_match_hostname-3.4.0.2-4.el7.noarch.rpm \
      ansible-2.2.0.0-100.git201610061930.3c9966d.stable22.el7.centos.noarch.rpm \
      python-httplib2-0.7.7-3.el7.noarch.rpm \
      libtomcrypt-1.17-23.el7.x86_64.rpm \
      python-jinja2-2.8-5.el7.noarch.rpm \
      libtommath-0.42.0-4.el7.x86_64.rpm \
      python-keyczar-0.71c-2.el7.noarch.rpm \
      libyaml-0.1.4-11.el7_0.x86_64.rpm \
      python-markupsafe-0.11-10.el7.x86_64.rpm \
      python2-crypto-2.6.1-9.el7.x86_64.rpm \
      python-pyasn1-0.1.6-2.el7.noarch.rpm \
      python2-ecdsa-0.13-4.el7.noarch.rpm  \
      python-setuptools-0.9.8-4.el7.noarch.rpm \
      python2-paramiko-1.16.1-1.el7.noarch.rpm \
      python-six-1.9.0-2.el7.noarch.rpm \
      python-babel-0.9.6-8.el7.noarch.rpm \
      PyYAML-3.10-11.el7.x86_64.rpm \
      python-backports-1.0-8.el7.x86_64.rpm \
      sshpass-1.05-5.el7.x86_64.rpm)
  pkg_list=$(join " $url/rhel7/" "${pkg[@]}")
  yum install -y $url/rhel7/$pkg_list
fi

ansible --version
