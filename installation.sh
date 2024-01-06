#!/bin/bash

(set -o pipefail; \
ansible-playbook ansible/pre-deployment.yml "${@:1}" | tee install.log && \
ansible-playbook ansible/deployment-rancher.yml "${@:1}" | tee -a install.log && \
ansible-playbook ansible/deployment-rke2.yml "${@:1}" | tee -a install.log )

RC=$?
exit $RC