from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
brower = webdriver.Chrome('C:\pythonnori\PPAP\python\chromedriver.exe')

url="https://www.ibisworld.com/global/industry-statistics/market-size/"
brower.get(url)
idx=1
try:
    elem = WebDriverWait(brower, 10).until(EC.presence_of_all_elements_located((By.XPATH, '//*[@id="CoreReportsList"]/div[8]/div[3]/div[2]/a/span')))
    
    elem = brower.find_elements_by_tag_name("a")
    for e in elem:
        if "https://www.ibisworld.com/global/market-size/global-" in e.get_attribute("href"):
            print(e.get_attribute("href")) 
            print(idx)
            idx+=1
        else:
            continue 
finally:
    brower.quit()


