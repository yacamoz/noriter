import requests
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from bs4 import BeautifulSoup

brower = webdriver.Chrome('C:\pythonnori\PPAP\python\chromedriver.exe')

url="https://www.ibisworld.com/global/market-size/global-advertising-agencies/"
brower.get(url)
idx=1
try:
    elem = WebDriverWait(brower, 10).until(EC.presence_of_all_elements_located((By.XPATH, '//*[@id="Statistics_MarketSize_Chart_Div"]/div/div[1]/div/div/table')))
    elem = brower.page_source
    soup = BeautifulSoup(elem, 'html.parser')
    for size in soup.find_all("td")[:22]:
        print(size.get_text())

finally:
    brower.quit()