## Dependencies 

1. Ansible:

    brew install ansible 
    
2. docker-py 

    pip install 'docker-py>=1.7.0'

If you're on osx:

    export PYTHONPATH=/usr/local/lib/python2.7/site-packages/:$PYTHONPATH
    
see https://github.com/ansible/ansible-modules-core/issues/4246#issuecomment-246841624

## Build docker container

    make build_image

## Testing locally 

1. Install [vagrant](https://www.vagrantup.com) 
2. Provision workers
  
    ansible-playbook -i inventories/vagrant ansible/vagrant.yml

3. 
