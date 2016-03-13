from bs4 import BeautifulSoup
from urlparse import urlparse
from feedfinder2 import find_feeds
import requests
import time


class FeedFinder():
    def __init__(self):
        
        headers = {'User-Agent' : 'AD'}
        links = []
        hostname = None
        
    def make_request(self, link):
        
        r = requests.get(link, headers = self.headers)
        self.hostname = urlparse(link)
        return r.text

    def extract_links(self, html):
        
        soup = BeautifulSoup(html, 'html.parser')
    
        for link in soup.findAll('link', {'type' : 'application/rss+xml'}):
            if link['href'] not in self.links:
                self.links.append(link['href'])

        for a in soup.findAll('a'):
            try:
                if (a['href'].endswith('.xml') == True):
                    if self.hostname.scheme not in a['href']:
                        href = self.hostname.scheme + "://" + a['href']

                        if self.hostname.hostname not in a['href']:
                            a['href'] = self.hostname.scheme + "://" + self.hostname.hostname + href

                        else:
                            a['href'] = href
                        
                    if a['href'] not in self.links:
                        self.links.append(a['href'])

            except Exception:
                pass


        for area in soup.findAll('area'):
            try:
                if (area['href'].endswith('.xml') == True):
                    if self.hostname.scheme not in area['href']:
                        href = self.hostname.scheme + "://" + area['href']
                        
                        if self.hostname.hostname not in area['href']:
                            area['href'] = self.hostname.scheme + "://" + self.hostname.hostname + href

                        else:
                            a['href'] = href

                    if area['href'] not in self.links:
                        self.links.append(area['href'])

            except Exception:
                pass

            return self.links

    def collect_feeds(self, link):

        html = self.make_request(link)
        self.extract_links(html)

        if len(self.links) == 0:
            print "process sleeping for 6 seconds"
            time.sleep(6)
            return find_feeds(link)

        else:
            return self.links
