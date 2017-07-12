# This guide is optimized for Vagrant 1.7 and above.
# Although versions 1.6.x should behave very similarly, it is recommended
# to upgrade instead of disabling the requirement below.
Vagrant.require_version '>= 1.7.0'

N = 2

Vagrant.configure("2") do |config|
  (1..N).each do |machine_id|
    config.vm.define "workers-#{machine_id}" do |machine|
      machine.vm.box = 'minimum/ubuntu-trusty64-docker'
      machine.vm.hostname = "workers-#{machine_id}"
      machine.vm.network 'private_network', ip: "192.168.77.#{20 + machine_id}"

      machine.vm.provider 'virtualbox' do |box|
        box.memory = 1024
        box.cpus = 1
      end
    end
  end
end
