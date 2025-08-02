# Test assignments.

 - [x] **Task #1**
    > You need to iterate through a list of URLs and check their availability. Conditions:
    > The list of URLs is located in the file /urls.txt.
    > A URL is considered available if its response code is not 5XX or 4XX.
    > The check must be implemented as a Bash function, which should be called within the script.
    > The function must accept the path to the file with URLs as its input parameter.
    > If any service returns an unavailable response, stop further checks.

    Just run the script with a -f flag and provide a filename with url list. --help also available.
 - [x] **Task #2**
    > Write a simple daemon (configuration file) for systemd that will keep a process running and restart itself if the process crashes.

    You can link it in /etc/systemd/system/ or in any of the user directories.

 - [x] **Task #3 (optional)**
    > Write a Dockerfile to build the following project: https://github.com/anza-xyz/agave.
    
    Build it with "docker build -t name:tag .", then add the image in compose.yaml and do "docker compose up -d"
    
    You'll need a public static IP in order to actually run a validator. I do not have such IP, but was able to run validator in devnet with --no-voting. It found RPC peer nodes and started syncing: 

        [2025-08-02T11:55:20.200576531Z INFO  solana_file_download] Downloading 48177518042 bytes from http://60.244.89.49:8899/snapshot-398447112-HEMv7MDqUyqw4xz87TuReX3SEETm4KdMsp3N1a6Rj2va.tar.zst
        [2025-08-02T11:55:26.219121122Z INFO  solana_file_download] downloaded 2874280 bytes 0.0% 477572.0 bytes/s
        [2025-08-02T11:55:32.238339423Z INFO  solana_file_download] downloaded 6216264 bytes 0.0% 555219.0 bytes/s

    [Here](https://docs.anza.xyz/operations/guides/validator-start/#system-tuning) there are some instructions on configuring the environment for the validator.

 - [x] **Task #4**
    > Write a script that compares the values of result and height from the following two endpoints:
    >
    > Key: result
    > https://api.etherscan.io/api?module=proxy&action=eth_blockNumber&apikey=YourApiKeyToken
    > 
    > Key: height
    > https://api.blockcypher.com/v1/eth/main

    Populate .env with your Etherscan Api key, then just run the script. 

    Ouput example:
  
        ➭ ./task4.py
        blockcypher: 23048994
        etherscan: 23049009
        Diff: 15

