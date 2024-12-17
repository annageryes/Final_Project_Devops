# CI/CD Project with Jenkins, Ansible, and Docker Compose


## Collaborators : annageryes , nastyak6

## Overview
This project demonstrates a fully automated CI/CD pipeline leveraging Jenkins, Ansible, and Docker Compose. The system supports continuous integration, delivery, and deployment workflows with pipelines for development, staging, and production environments. Additional features include nightly builds, data management pipelines using Samba, and an artifact repository.
This Project is Part of the Devops Course Final assignment.


## Prerequisites
- *Host System*: Linux-based system with Docker and Docker Compose installed.
- *Dependencies*: Ansible installed on the host for configuration management.
- *Source Code Management*: GitHub or any Git-based version control system.

### Tasks
In this project we implemented the following tasks:
- Build CI/CD Server with worker nodes
- Deploy CI/CD Server with workers
- Build Pipeline for CI of product/DEV/Stage/Prod
- Build Pipeline for Nightly Release
- Build Pipeline for Data:
  - Revert
  - Backup
- Build Artifact Server

### Our Plan (TO DO LIST)
- create another repository for tthe application : [DUMMY_APP](https://github.com/nastyak6/dummy_func/)
- bring up jenkins master contianer with dockr compose
- configure everything 
- bring up two agents as well
- add needed configurations and credintials
- write an ansible playbook that will deploy the jenkins server and agent with all the configuration
- write a bash script to trigger the playbook
- create jenkins file and build pipline job for CI/CD (multibranch)
- use the same file with a jenkins schedules job to run with the nightly branch
- add Samba contianer to the docker file ( make sure it can communicate with the jenkins and that they have a shared volume)
- create jenkins pipline job and jenkinsfile for the data pipline (backup & retrive) 
- bring up artifact server to upload the binaries into 




## Getting Started
### Step 1: Clone the Repository
bash
git clone <repository-url>
cd <repository-folder>


### Step 2: Configure Environment

1. Create the **jenkins_sandbox_home** folder in your local environment

   ```
   mkdir jenkins_sandbox_home
   ```
2. Create a file named **.env** and add the following:

   ```yml
    JENKINS_HOME_PATH=<jenkins_sandbox_home_path> # /home/annageryes/Projects/Final_Project_Devops/jenkins_sandbox_home
    SAMBA_USER=<user>
    SAMBA_PASS=<password>
   ```

### Step 3: Deploy CI/CD Infrastructure
Run the Ansible playbook to deploy Jenkins master and worker nodes using the bash script :
```bash
./deploy_jenkins.sh
```

### Step 4: Configure Credintials and launch agents
Because we encountered an issue with the way the privte key is uploaded to jenkins, there is an addional step :
1. copy the private key from /tmp/agent.rsa
2. replace the key in the jenkins web interface Manage Jenkins -> Credintials -> ansible-creds
3. launch both agents in the jenkins web interface Manage Jenkins 

### Step 5: Configure Samba container

1. If you applied the last step the samba contianer should already be up
    check to see if up and healthy ```docker ps ```  or run ```docker-compose up samba```
2. install the smaba client we use in the jenkins file for the [data piplines](https://github.com/nastyak6/dummy_func/blob/main/Jenkinsdata)
    ```apt install smbclient```
3. get the container IP address
    ```docker inspect -f '{% raw %}{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}{% endraw %}'   <container name/id>```
4. make sure that the samba conf file has the writable enabled or just run:
    ```docker-compose exec -it samba /bin/bash -c "echo '   writable = yes' >> /etc/samba/smb.conf"```
4. check connectivity by running the following command with the credintials you set in the .env file and the address from the previous step
    ``` smbclient -U <SAMBA_USER> //<SAMBA_IP>/shared ```



## Deploy Playbook Overview

#### this playbook is designed to run locally , if you need it to run remotly make sure to 
1. add your inventory into the hosts.txt file
2. change the localhost and hosts connection in [main-playbook.yaml](https://github.com/annageryes/Final_Project_Devops/blob/main/main-playbook.yml)


## Pipelines Overview
### DEV/Stage/Prod Pipelines
- Multi-stage pipelines with all the checks we used in our [previous HW](https://github.com/annageryes/pipeline_task)

attach image
 Jenkins file for CI/CD Piplines [Jenkinsfile](https://github.com/nastyak6/dummy_func/blob/main/Jenkinsfile)

### Nightly Builds
- Scheduled nightly jobs for code integration, testing , run at midnight daily on the nightly branch commits

attach image
 Jenkins file for nigthly Piplines [Jenkinsfile](https://github.com/nastyak6/dummy_func/blob/main/Jenkinsfile)

### Data Management Pipelines

- *Revert Pipeline*: Automates rollback to the last known good state.
- *Backup Pipeline*: Automates backup of critical data and artifacts.

 *we combined both actions into one pipline with condional arguments: 
 Jenkins file for Data Piplines [Jenkinsdata](https://github.com/nastyak6/dummy_func/blob/main/Jenkinsdata)
 

attach image


