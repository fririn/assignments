#!/bin/python3
import requests
import os

from dotenv import load_dotenv
load_dotenv()

def fetch_blockcypher():
    url = "https://api.blockcypher.com/v1/eth/main"
    try:
        response = requests.get(url)
        response.raise_for_status()
        data = response.json()
        return data['height']
    except Exception as e:
        print(f"Error fetching blcokcypher: {e}")
        return None


def fetch_etherscan(api_key):
    url = "https://api.etherscan.io/api"
    params = {
        "module": "proxy",
        "action": "eth_blockNumber",
        "apikey": api_key
    }
    try:
        response = requests.get(url, params=params)
        response.raise_for_status()
        data = response.json()
        return int(data['result'], 16)
    except Exception as e:
        print(f"Error fetching Etherscan: {e}")
        return None


def main():
    first = fetch_blockcypher()
    second = fetch_etherscan(os.getenv('ETHERSCAN_API_KEY'))

    if first is None or second is None:
        print("Error: Couldn't get block numbers from one or both APIs")
        print(f"blockcypher: {first or 'N/A'}")
        print(f"etherscan: {second or 'N/A'}")
    else:
        print(f"blockcypher: {first}\netherscan: {second}\nDiff: {abs(first - second)}")



if __name__ == "__main__":
    main()
