#!/bin/bash
# Variable file for run_scenario.sh
# This file will be sourced to run_scenario.sh

# Parameter for Jmeter
scenario_name=
numThreads=
rampupTime=
ctrlLoops=

# Comma seperated ips of jmeter slves
# eg: 
# JMETER_CLUSTER_IPS="28.0.0.34,28.0.0.35,28.0.0.36,28.0.0.37"
JMETER_CLUSTER_IPS=""

# Jwt token to authorize kong
apiKey="" # BEarer token

# Username and password to generate x-authenticated-token
# for user related actions
username="ntp-loadtest-admin"
password="password"

# Jmeter location
JMETER_HOME="/mount/data/benchmark/apache-jmeter-4.0"
# Datafile path in slaves
data_file_path="/mount/data/benchmark/current_scenario/"

# Scenarios logs location
SCENARIO_LOGS=~/logs/$scenario_name

# ssh user to jmeter slaves
ssh_jmeter_slave_user="deployer"