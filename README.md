## Test assignments. 

- ### Task #1
    > You need to iterate through a list of URLs and check their availability. Conditions:
    > The list of URLs is located in the file /urls.txt.
    > A URL is considered available if its response code is not 5XX or 4XX.
    > The check must be implemented as a Bash function, which should be called within the script.
    > The function must accept the path to the file with URLs as its input parameter.
    > If any service returns an unavailable response, stop further checks.

    **task1/task1.sh**
    Just run it with a -f flag and provide a filename with url list. --help also available.
- ### Task #2
    > Write a simple daemon (configuration file) for systemd that will keep a process running and restart itself if the process crashes.

    **task2/task2.service.**
    You can link it in /etc/systemd/system/
    or in any of the user directories:

        - $XDG_CONFIG_HOME/systemd/user/*
        - $HOME/.config/systemd/user/*
        - /etc/systemd/user/*
        - $XDG_RUNTIME_DIR/systemd/user/*
        - /run/systemd/user/*
        - $XDG_DATA_HOME/systemd/user/*
        - $HOME/.local/share/systemd/user/*
        - /usr/lib/systemd/user/*
- ### Task #3 (optional)
    > Write a Dockerfile to build the following project: https://github.com/anza-xyz/agave.
    - Write a script that compares the values of result and height from the following two endpoints:
    
        > Key: result
        https://api.etherscan.io/api?module=proxy&action=eth_blockNumber&apikey=YourApiKeyToken
    
        > Key: height
        https://api.blockcypher.com/v1/eth/main

