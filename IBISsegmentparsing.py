import requests
import csv
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from bs4 import BeautifulSoup

options = webdriver.ChromeOptions()
options.headless = True

openfile = open("IBIS_global_market_list.txt","r")
filename = "IBIS_market_sizes.csv"
f = open(filename, "w", encoding="utf8", newline="")
writer = csv.writer(f)
list1 = ["marketname",2011,2012,2013,2014,2015,2016,2017,2018,2019,2020,2021]
writer.writerow(list1)
while True:
    list2 = []
    url=openfile.readline()
    if not url:
        break
    brower = webdriver.Chrome('C:\pythonnori\PPAP\python\chromedriver.exe')
    brower.get(url)
    try:
        elem = WebDriverWait(brower, 10).until(EC.presence_of_all_elements_located((By.XPATH, '//*[@id="Statistics_MarketSize_Chart_Div"]/div/div[1]/div/div/table')))
        elem = brower.page_source
        soup = BeautifulSoup(elem, 'html.parser')
        name = soup.find("span", attrs={"id":"reportTitleDisplay_MarketSize"}).text
        list2.append(name)
        for size in soup.find_all("td")[:22]:
            if 'Feb 1' in size.get_text():
                continue
            list2.append(size.get_text())  
        writer.writerow(list2)
    finally:
        brower.quit()
        list2 = []
openfile.close()