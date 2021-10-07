import requests
import csv
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from bs4 import BeautifulSoup

brower = webdriver.Chrome('C:\pythonnori\PPAP\python\chromedriver.exe')

list = ["marketname",2011,2012,2013,2014,2015,2016,2017,2018,2019,2020,2021]
list2 = []

filename = "IBIS_global_industry_marketsize.csv"
f = open(filename, "w", encoding="utf8", newline="")
writer = csv.writer(f)
writer.writerow(list)
url="https://www.ibisworld.com/global/market-size/global-advertising-agencies/"
brower.get(url)
idx=1
try:
    elem = WebDriverWait(brower, 10).until(EC.presence_of_all_elements_located((By.XPATH, '//*[@id="Statistics_MarketSize_Chart_Div"]/div/div[1]/div/div/table')))
    elem = brower.page_source
    soup = BeautifulSoup(elem, 'html.parser')
    for size in soup.find_all("td")[:22]:
        if 'Feb 1' in size.get_text():
            continue
        # print(size.get_text())
        list2.append(size.get_text())  
    writer.writerow(list2)

finally:
    brower.quit()