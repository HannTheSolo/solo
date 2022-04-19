import requests
import sys
import json

headers = {'Content-Type': 'application/json'}
url_input = sys.argv[1]
data_input = sys.argv[2]
number_input = int(sys.argv[3])


def url_requests(url, data):
    for i in range(number_input):
        response = requests.post(url, headers=headers, json=json.loads(data))
        print("Status Code", response.status_code)


url_requests(url_input, data_input)
