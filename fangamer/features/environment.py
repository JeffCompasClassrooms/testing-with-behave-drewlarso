import behave_webdriver
from behave_webdriver.steps import *
from selenium.webdriver.chrome.options import Options


def before_all(context):
    options = Options()
    options.add_argument("--headless")
    options.add_argument("--no-sandbox")
    context.behave_driver = behave_webdriver.Chrome(chrome_options=options)


def after_all(context):
    context.behave_driver.quit()
