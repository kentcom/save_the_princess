mail_address='manvithsingh@gmail.com'
password="123456"
from selenium import webdriver
from random import randint
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import time
driver = webdriver.Firefox()
wait=WebDriverWait(driver,100)
driver.get("https://kentcom.pythonanywhere.com")
elem1=driver.find_element_by_link_text('Game Lore')
elem1.click()
elem2=driver.find_element_by_class_name('card-header')
print(elem2.text)
time.sleep(5)
elem3=driver.find_element_by_link_text('HOME')
elem3.click()
time.sleep(5)
elem4=driver.find_element_by_link_text('Game Rules')
elem4.click()
time.sleep(5)
elem = driver.find_element_by_link_text('START GAME')
elem.click()
time.sleep(5)
elem5=driver.find_element_by_class_name('abcRioButtonContentWrapper')
elem5.click()
time.sleep(5)
elem6=driver.find_element_by_tag_name('h3')
print(elem6.text)
time.sleep(5)
#iframe1=driver.find_element_by_id('ssIFrame_google')
#driver.switch_to.frame(iframe1)
#iframe1=driver.find_elements_by_tag_name('iframe')[0]
#driver.switch_to.frame(iframe1)
#time.sleep(10)
driver.switch_to_default_content()
elem9=driver.find_element_by_link_text('HOME')
elem9.click()
time.sleep(10)
time.sleep(5)
elem10=driver.find_element_by_tag_name('h2')
print(elem10.text)
time.sleep(5)
r=driver.current_url
while r == "https://kentcom.pythonanywhere.com/gamepage":
 elem11=driver.find_elements_by_class_name('col-md-6')
 l=elem11[randint(0,len(elem11)-1)]
 l_attribute_value=l.get_attribute('innerHTML')
 print (l_attribute_value)
 l.click()
 time.sleep(5)
 driver.find_element_by_class_name('swal2-actions').click()
 t=driver.current_url
 print (t)
 time.sleep(5)
 if t == "https://kentcom.pythonanywhere.com/gameover":
  elem9=driver.find_element_by_link_text('Play Again')
  elem9.click()
  time.sleep(5)
 else:
  r="https://kentcom.pythonanywhere.com/gamepage"
  
#alert=driver.switch_to_alert()
#elem9=driver.find_element_by_link_text('Continue')
#elem10.click()
#time.sleep(5)
#driver.switch_to_default_content()
#elem7=driver.find_element_by_id('headingText')
#print(elem7.text)
#elem8=driver.find_element_by_tag_name('h3')
#print(elem8.text)
#wait.until(EC.presence_of_element_located((By.NAME,'identifier'))).send_keys("manvithsingh@gmail.com")
#wait.until(EC.presence_of_element_located((By.ID, "next"))).click()
#wait.until(EC.presence_of_element_located((By.ID, "Passwd"))).send_keys(password)
#wait.until(EC.presence_of_element_located((By.ID, "signIn"))).click()
#wait.until(EC.presence_of_element_located((By.ID, "nav-questions")))
driver.close()