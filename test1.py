import unittest
from selenium import webdriver
from selenium.webdriver.common.keys import Keys

import time

class KentCom_TestCase(unittest.TestCase):
    
    driver = None

    def setUp(self):
        self.driver = webdriver.Firefox()
        self.driver.get("https://kentcom.pythonanywhere.com")
        

    def tearDown(self):
        self.driver.close()
     
    

    def test_001_game_lore_page_exists(self):
      elem = self.driver.find_element_by_link_text("Game Lore").click()
      header1=self.driver.find_element_by_class_name("card-header")
      s='SAVE THE PRINCESS GAME LORE HOME'
      self.assertEqual(s,(header1.text))
      time.sleep(5)
         
    def test_002__game_rules_page_exists(self):
      elem = self.driver.find_element_by_link_text('Game Rules').click()
      header2=self.driver.find_element_by_tag_name("h2")
      s1='SAVE THE PRINCESS GAME RULES'
      self.assertEqual(s1,(header2.text))	
      time.sleep(5)
	 
    def test_03__kent_com_page_exists(self):
      elem = self.driver.find_element_by_link_text('KENTCOM').click()
      header3=self.driver.find_element_by_tag_name("u")
      s2='MISSION:'
      self.assertEqual(s2,(header3.text))
      time.sleep(5)
    def test_04__kent_com_contact_us_page_exists(self):
      elem = self.driver.find_element_by_link_text('CONTACT US').click()
      header3=self.driver.find_element_by_tag_name("h2")
      s2='SAVE THE PRINCESS GAME CREDITS'
      self.assertEqual(s2,(header3.text))
      time.sleep(5)
    def test_05__kent_com_game_page_exists(self):
      elem = self.driver.find_element_by_link_text('START GAME').click()
      header3=self.driver.find_element_by_tag_name("h3")
      s2='SAVE THE PRINCESS GAME LOGIN'
      self.assertEqual(s2,(header3.text))
      time.sleep(5)
   
   
	  
if __name__ == "__main__":
    unittest.main(verbosity=2)