#!/bin/bash
#
# Basic scripts
#

# 1. Copy jenkins logs to host
docker cp jenkins-master:/var/log/jenkins/jenkins.log jenkins.log
# 2. Print logs on console
cat jenkins.log
# 3. remove log file (comment below line to keep log file)
rm jenkins.log

