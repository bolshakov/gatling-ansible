This project aimed to run gatling simulation on multiple workers, gather results and generate report.
 Thus, you are able to generate significant load.

## Dependencies 

1. Ansible:

    brew install ansible 
    
If you're on osx:

    export PYTHONPATH=/usr/local/lib/python2.7/site-packages/:$PYTHONPATH
    
see https://github.com/ansible/ansible-modules-core/issues/4246#issuecomment-246841624

## Build docker container

    make build_image

This action generates `ansible/files/docker-image-gatling.tar`, so we can securely transfer container to worker 
via ssh (instead of repository).

TODO: do we really need this?

## Provision workers
 
To test how it works you may run it locally using Vagrant. 

1. Install [vagrant](https://www.vagrantup.com) 
2. Provision workers
  
    ansible-playbook -i inventories/vagrant ansible/provision_vagrant.yml


## Run simulation

    ansible-playbook -i inventories/vagrant ansible/simulation.yml
