from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.desired_capabilities import DesiredCapabilities
from selenium.webdriver import ActionChains

desired_cap = {'browser': 'Chrome', 'browser_version': '38.0', 'os': 'OS X', 'os_version': 'Yosemite', 'resolution': '1024x768'}
desired_cap['browserstack.debug'] = True
desired_cap['browserstack.local'] = True
driver = webdriver.Remote(command_executor='http://aalekh1:hq3rAmo4Uqv2ADAAPGJq@hub.browserstack.com:80/wd/hub', desired_capabilities=desired_cap)
driver.get("https://locahost:8001")
#if not "TinEye" in driver.title:
#    raise Exception("Unable to load google page!")
driver.quit()
