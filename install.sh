#!/bin/sh
ansible-playbook -i hosts site.yml --extra-vars="eis_archive_url=https://download.elasticsearch.org/kibana/kibana/kibana-3.1.2.tar.gz eis_install_dir=/opt/applications" -vvvv