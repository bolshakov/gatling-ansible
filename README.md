This project aimed to run gatling simulation on multiple workers, gather results and generate report.
Thus, you are able to generate significant load.

## Dependencies 

Install Ansible:

```
> brew install ansible
```

If ansible-playbook fails with error `Failed to import docker-py - No module named requests.exceptions. Try pip install docker-py`, 
try configuring your `PYTHONPATH` enviroment variable:  
 
``` 
> export PYTHONPATH=/usr/local/lib/python2.7/site-packages/:$PYTHONPATH
```    

## Simulation

Place simulations into `ansible/files/gatling_user_files` directory and change `simulation_name` variable in 
a inventory file.
 
You can either run simulation in vagrant boxes, or on remote serves (only VScale currently supported)

### VirtualBox workers
 

1. Install [vagrant](https://www.vagrantup.com) 
2. Run simulation

```
> ansible-playbook -i inventories/vagrant ansible/vagrant.yml
```

### VScale workers
    
[Generate](https://vscale.io/panel/settings/tokens/) and export your API token to `VS_API_KEY` environment variable:  

```
> export VS_API_KEY=62958c82732254edc648628c827397fa91f53df435e88bf4bd8c29b952e32c9e35fa93
```

And run simulation:

```
> ansible-playbook -i inventories/vscale ansible/vscale.yml
```

If something went wrong and your servers still up:

```
> ansible-playbook -i inventories/vscale ansible/vscale.yml --tags 'cleanup'
```

### Locally in docker

Run simulation:

```
> ansible-playbook -i inventories/local ansible/local.yml
```
