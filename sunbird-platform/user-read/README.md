### Test Scenario

Benchmarking Get User Profile API.


### Test Environment Details
1. No of AKS node - 16
2. No of learner service replicas - 16 (1Core and 1GB)
3. Cassandra Cluster- 5 Nodes; CPU- 8Core; Memory- 32GB
4. ES Cluster - 3 nodes; CPU- 16core ; Memory- 64GB
5. Release version - Release 3.9.0


**API End Point:** 
`/api/user/v3/read`


**Executing the test scenario using JMeter**


```./run_scenario.sh <JMETER_HOME> <JMETER_IP_LIST> <SCENARIO_NAME> <SCENARIO_ID> <THREADS_COUNT> <RAMPUP_TIME> <CTRL_LOOPS> <API_KEY> <DOMAIN_FILE> <CSV_FILE> <pathPrefix>```

e.g.

```./run_scenario.sh /mount/data/benchmark/apache-jmeter-5.3/ 'Jmeter_Slave1_IP,Jmeter_Slave2_IP,Jmeter_Slave3_IP,Jmeter_Slave4_IP' user-read user-read 5 1 5 "ABCDEFabcdef012345" /mount/data/benchmark/sunbird-perf-tests/sunbird-platform/testdata/host.csv  /mount/data/benchmark/sunbird-perf-tests/sunbird-platform/testdata/userData.csv /api/user/v3/read```


**Note**

- Update `UserData.csv` file with users Ids and user access token.
- Update `host.csv` file data with correct host details before running the test. It can be domain details / Kubernetes Node IPs/ LB IPs/ Direct Service IPs with port details.

### Test Result

|API                |Thread Count|Samples |Errors%  |Throughput/sec|Avg Resp Time |95th pct |99th pct|
|-------------------|------------|--------|---------| -------------|--------------|---------|--------|
|Get User Profile   |200         |2000000 |0(0.00%) | 3680.2       | 50           |  91     |100     |
