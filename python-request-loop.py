import requests

url = 'https://whatever.com'
headers = {'Content-Type': 'application/json'}
data = {"name": "whatever", "brandId": "007"}

for i in range(100):
    response = requests.post(url, headers=headers, json=data)
    print("Status Code", response.status_code)