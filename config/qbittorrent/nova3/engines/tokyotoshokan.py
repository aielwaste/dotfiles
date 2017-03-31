#VERSION: 2.1
#Author: Douman (douman@gmx.se)

try:
    #python3
    from html.parser import HTMLParser
except ImportError:
    #python2
    from HTMLParser import HTMLParser

from re import compile as re_compile

#qBt
from novaprinter import prettyPrinter
from helpers import download_file, retrieve_url

class tokyotoshokan(object):
    url = 'http://tokyotosho.info'
    def __init__(self):
        self.name = 'Tokyo Toshokan'
        self.supported_categories = {'all': '0', 'anime': '1', 'games': '14' }
        #self.supported_categories = {'all': '0', 'anime': '1', 'anime(non-english)': '10',
        #                        'manga': '3', 'drama': '8', 'music': '2',
        #                        'music video': '9', 'raw': '7', 'hentai': '4',
        #                        'eroge': '14', 'batch': '11', 'jav': '15', 'other': '5'}
        #

    def download_torrent(self, info):
        print(download_file(info))

    class MyHtmlParseWithBlackJack(HTMLParser):
        def __init__(self, url):
            HTMLParser.__init__(self)
            self.get_size_regex = re_compile(".*Size:\s+([^ ]*)\s+.*")
            self.url = url
            self.current_item = None
            self.size_found = False
            self.name_found = False
            self.stats_found = False
            self.stat_name = None

        def handle_starttag(self, tag, attrs):
            params = dict(attrs)
            if self.current_item:
                if tag == "a":
                    if params["href"].startswith("magnet"):
                        self.current_item["link"] = params["href"]
                    elif 'type' in params and params["type"] == "application/x-bittorrent":
                        self.name_found = True
                        self.current_item["name"] = ""
                    elif params["href"].startswith("details"):
                        self.current_item["desc_link"] = "".join((self.url, "/", params["href"]))

                elif tag == "td" and "class" in params:
                    if params["class"] == "desc-bot":
                        self.size_found = True
                        self.current_item['size'] = 'Unknown'
                    elif params["class"] == "stats":
                        self.stats_found = True

                elif self.stats_found and tag == "span":
                    self.stat_name = "leech" if "seeds" in self.current_item else "seeds"

            elif tag == "tr" and "class" in params:
                if params["class"].find("category"):
                    self.current_item = dict()
                    self.current_item["engine_url"] = self.url

        def handle_endtag(self, tag):
            if tag == "a":
                if self.name_found:
                    self.name_found = False
            elif tag == "span":
                self.stat_name = None
            elif self.current_item and tag == "tr" and len(self.current_item) == 7:
                prettyPrinter(self.current_item)
                self.current_item = None
                self.size_found = False
                self.name_found = False
                self.stats_found = False
                self.stat_name = None

        def handle_data(self, data):
            if self.name_found:
                self.current_item["name"] += data
            elif self.size_found:
                # There can be several pieces.
                result = self.get_size_regex.search(data)
                if result:
                    self.current_item['size'] = result.group(1)
                    self.size_found = False
            elif self.stat_name:
                self.current_item[self.stat_name] = data


    def search(self, query, cat='all'):
        query = query.replace(' ', '+')
        parser = self.MyHtmlParseWithBlackJack(self.url)

        torrent_list = re_compile("(?s)<table class=\"listing\">(.*)</table>")
        additional_links = re_compile("/?lastid=[0-9]+&page=[0-9]+&terms={}".format(query))

        request_url = '{0}/search.php?terms={1}&type={2}&size_min=&size_max=&username='.format(self.url, query, self.supported_categories[cat])
        data = retrieve_url(request_url)

        data = torrent_list.search(data).group(0)
        parser.feed(data)
        parser.close()
        for res_link in map(lambda link: "".join((self.url, "/search.php?", link.group(0))), additional_links.finditer(data)):
            data = retrieve_url(res_link)
            data = torrent_list.search(data).group(0)
            parser.feed(data)
            parser.close()
