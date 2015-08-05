# vim: set ft=ruby ts=2 sw=2 et:
# -*- mode: ruby -*-

VAGRANT_API_VERSION = '2'
Vagrant.configure(VAGRANT_API_VERSION) do |config|

  config.vm.box = "ubuntu"

  config.vm.define :'ansible-playbook-jenkinsmaster' do |d|

    d.vm.hostname = 'ansible-playbook-jenkinsmaster'
    d.vm.synced_folder '.', '/vagrant', id: 'vagrant-root', disabled: true

    d.vm.provision :ansible do |ansible|
      ansible.playbook = 'playbook.yml'
      ansible.tags = ENV['ANSIBLE_TAGS']
      ansible.groups = {
        'ellucian-jenkins' => ['ansible-playbook-jenkinsmaster']
      }
      ansible.limit = 'ellucian-jenkins'

      ::File.directory?('.vagrant/provisioners/ansible/inventory/') do
        ansible.inventory_path = '.vagrant/provisioners/ansible/inventory/'
      end

    end

    d.vm.provider :virtualbox do |v|
      v.customize 'pre-boot', ['modifyvm', :id, '--nictype1', 'virtio']
      v.customize [ 'modifyvm', :id, '--name', 'ansible-playbook-jenkinsmaster', '--memory', '1024', '--cpus', '1' ]
    end

  end
end
