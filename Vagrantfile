vms = {
  'master' => {'memory' => '6144', 'cpus' => 6, 'ip' => '50'},
  #'worker' => {'memory' => '2048', 'cpus' => 2, 'ip' => '60'},
}

Vagrant.configure("2") do |config|

  config.vm.box = "centos/7"
  config.vm.box_check_update = false

  vms.each do |name, conf|

    config.vm.define "#{name}" do |k|

      k.vm.hostname = "#{name}.lab.io"
      k.vm.network 'public_network', ip: "192.168.100.#{conf['ip']}"

      if name == 'master'
        k.vm.network "forwarded_port", guest: 443, host: 443, host_ip: "127.0.0.1"
        k.vm.network "forwarded_port", guest: 80, host: 80, host_ip: "127.0.0.1"
      end

      k.vm.provider 'virtualbox' do |vb|
        vb.memory = conf['memory']
        vb.cpus = conf['cpus']
        vb.name = "#{name}-rke"
      end
      
    end
  end

  #Primeira Vez
  config.vm.provision 'shell', privileged: true, path: "basics.sh"
end