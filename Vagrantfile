VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = 'box-cutter/ubuntu1410'
  config.vm.synced_folder ".", "/vagrant", type: "nfs"

  config.vm.hostname = 'railstutorial.vagrant'
  config.vm.network :private_network, ip: '192.168.77.7'
  config.vm.network :forwarded_port, guest: 3000, host: 3000

  config.ssh.forward_agent = true

  config.hostmanager.enabled           = true
  config.hostmanager.manage_host       = true
  config.hostmanager.ignore_private_ip = false
  config.hostmanager.include_offline   = true


  config.vm.provider :virtualbox do |vb|
    vb.memory = 2048
    vb.cpus   = 2
  end

  config.vm.provider :vmware_fusion do |vm|
    vm.vmx['memsize']  = 2048
    vm.vmx['numvcpus'] = 2
  end

  config.vm.provider :parallels do |ps|
    ps.optimize_power_consumption = false
    ps.check_guest_tools          = false
    ps.memory                     = 1024
    ps.cpus                       = 2
  end


  config.omnibus.chef_version = :latest

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ['cookbooks', 'site-cookbooks']

    chef.add_recipe 'apt'
    chef.add_recipe 'build-essential'
    chef.add_recipe 'git'
    chef.add_recipe 'libffi-dev'
    chef.add_recipe 'ruby_build'
    chef.add_recipe 'rbenv::user'
    chef.add_recipe 'rbenv::vagrant'
    chef.add_recipe 'nodejs'
    chef.add_recipe 'vim'
    chef.add_recipe 'zsh'
    chef.add_recipe 'prezto'

    chef.json = {
      rbenv:  {
        user_installs: [{
                          user:    'vagrant',
                          rubies:  ['2.0.0-p353'],
                          global:  '2.0.0-p353',
                          plugins: [
                                     { 'name'    => 'rbenv-gem-rehash',
                                       'git_url' => 'https://github.com/sstephenson/rbenv-gem-rehash.git'
                                     }
                                   ]
                        }]
      },
      zsh:    {
        user: 'vagrant'
      },
      prezto: {
        user:  'vagrant',
        group: 'vagrant'
      }
    }
  end

end
