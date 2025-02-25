### Test Scenario:

Benchmarking Merge Account API.


### Test Environment Details:
1. No of AKS node -24 (CPU- 8Core & Memory- 16GB)
2. No of learner service replicas - 8 (CPU- 3Core & Memory- 5GB)
3. ES Cluster - 3 nodes; CPU- 8core ; Memory- 32GB
4. Cassandra Cluster- 5 Nodes; CPU- 16Core; Memory- 64GB
5. Release version - NA


**API End Point:** 
`/api/user/v1/account/merge`


**Executing the test scenario using JMeter:**

```./run_scenario.sh <JMETER_HOME> <JMETER_IP_LIST> <SCENARIO_NAME> <SCENARIO_ID> <THREADS_COUNT> <RAMPUP_TIME> <CTRL_LOOPS> <API_KEY> <DOMAIN_FILE> <CSV_FILE_TO_ACCOUNT>  <CSV_FILE_FROM_ACCOUNT> <pathPrefix>```

e.g.

```./run_scenario.sh /mount/data/benchmark/apache-jmeter-5.3/ 'Jmeter_Slave1_IP,Jmeter_Slave2_IP,Jmeter_Slave3_IP,Jmeter_Slave4_IP' account-merge account-merge-Id1 5 1 5 "ABCDEFabcdef012345" ~/sunbird-perf-tests/sunbird-platform/testdata/host.csv ~/sunbird-perf-tests/sunbird-platform/testdata/toAccounts.csv ~/sunbird-perf-tests/sunbird-platform/testdata/fromAccounts.csv /api/user/v1/account/merge```


**Note**
- `toAccounts.csv` : State tenant users account details. Custodian users accounts will be merged to these accounts.
- `fromAccounts.csv`: Custodian users account details. These are the accounts which are going to be megred with state tenant user accounts.
- `x-authenticated-user-token` in header manager is tenant user's access token to which account of the custodian user account is going to be merged.
- `x-source-user-token` in header manager is custodian user's access token , whose account to going to be merged.
- Update `host.csv` file data with correct host details before running the test. It can be domain details / Kubernetes Node IPs/ LB IPs/ Direct Service IPs with port details.



### Test Result

| API           | Thread Count  | Samples  | Errors%   | Throughput/sec  | Avg Resp Time |   95th pct  |  99th pct   |
| ------------- | ------------- | -------- | --------- | --------------- |---------------|-------------|-------------|
| Account Merge | 200           | 100000   | 0 (0.00%) | 401.7           | 429           |    1040     |   1686.94   |
