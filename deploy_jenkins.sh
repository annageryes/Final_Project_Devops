#!/bin/bash

# Bash script to trigger Ansible playbooks for the CI/CD project
echo "Running Ansible playbook..."
ansible-playbook main-playbook.yml -K
