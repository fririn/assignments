# Test assignments.

 - [x] **Task #1**
    > You need to iterate through a list of URLs and check their availability. Conditions:
    > The list of URLs is located in the file /urls.txt.
    > A URL is considered available if its response code is not 5XX or 4XX.
    > The check must be implemented as a Bash function, which should be called within the script.
    > The function must accept the path to the file with URLs as its input parameter.
    > If any service returns an unavailable response, stop further checks.

    File: **task1/task1.sh**  

    Just run it with a -f flag and provide a filename with url list. --help also available.
 - [x] **Task #2**
    > Write a simple daemon (configuration file) for systemd that will keep a process running and restart itself if the process crashes.

    File: **task2/task2.service.**  

    You can link it in /etc/systemd/system/ or in any of the user directories.

 - [x] **Task #3 (optional)**
    > Write a Dockerfile to build the following project: https://github.com/anza-xyz/agave.
    
    File: **task3/Dockerfile**  

    Build it with "docker build -t name:tag .", then mention the image in compose.yaml and do docker compose up -d 
    
    Stuck at "ports not available" errors since i do not have public static ip. So looks like i can't actually try running it locally.

    The validator-agave command in compose.yaml is for devnet, from [this](https://docs.anza.xyz/clusters/available#devnet) doc page. 

    Also [here](https://docs.anza.xyz/operations/guides/validator-start/#system-tuning) there are some instructions on configuring the environment for the validator.

 - [ ] **Task #4 (?)**
    > Write a script that compares the values of result and height from the following two endpoints:
    >
    > Key: result
    > https://api.etherscan.io/api?module=proxy&action=eth_blockNumber&apikey=YourApiKeyToken
    > 
    > Key: height
    > https://api.blockcypher.com/v1/eth/main

