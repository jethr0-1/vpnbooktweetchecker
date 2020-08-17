#/usr/bin/python3
import requests
from bs4 import BeautifulSoup
import re


i = 1
vpntweet = ""
r = requests.get("https://mobile.twitter.com/vpnbook")
soup = BeautifulSoup(r.text, 'html.parser')
result = soup.find_all('div', attrs = {'class':'tweet-text'})

for new in result:
    vpntweet += new.text.strip()
    vpntweet += "\n"
    i += i


finaltweet = vpntweet.partition('\n')[0]
print(finaltweet)
