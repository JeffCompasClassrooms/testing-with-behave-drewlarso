from behave import given, when, then
from selenium.webdriver import *
from selenium.webdriver.common.by import By
import time


@given("I open the fangamer homepage")
def step_impl(context):
    context.behave_driver.get(
        "https://www.fangamer.com/"
    )


@given('I open the product page at "{url}"')
def step_impl(context, url):
    context.behave_driver.get(url)
    time.sleep(1)


@given("I click the collections button")
def step_impl(context):
    button = context.behave_driver.find_element(
        By.CSS_SELECTOR, "#nav_collections_toggle"
    )
    button.click()
    time.sleep(0.25)


@given("I click the first game in the collections tab")
def step_impl(context):
    button = context.behave_driver.find_element(
        By.CSS_SELECTOR, "#nav_collections div ul:nth-of-type(2) li"
    )
    button.click()
    time.sleep(1)


@given("I click the shopping cart button")
def step_impl(context):
    button = context.behave_driver.find_element(
        By.CSS_SELECTOR, "#nav_cart_button"
    )
    button.click()
    time.sleep(0.25)


@given("I click the add quantity button for item {n}")
def step_impl(context, n):
    buttons = context.behave_driver.find_elements(
        By.CSS_SELECTOR, ".quantity-plus"
    )
    buttons[int(n)-1].click()
    time.sleep(1)


@given("I click the subtract quantity button for item {n}")
def step_impl(context, n):
    buttons = context.behave_driver.find_elements(
        By.CSS_SELECTOR, ".quantity-minus"
    )
    buttons[int(n)-1].click()
    time.sleep(1)


@given("I click the navbar logo")
def step_impl(context):
    button = context.behave_driver.find_element(
        By.CSS_SELECTOR, "#nav_logo"
    )
    button.click()
    time.sleep(0.5)


@given('I search "{text}"')
def step_impl(context, text):
    search_box = context.behave_driver.find_element(
        By.CSS_SELECTOR, "#nav_search"
    )
    search_box.send_keys(text)
    search_box.submit()
    time.sleep(1)
    button = context.behave_driver.find_element(
        By.CSS_SELECTOR, "#nav_clear_button"
    )
    button.click()


@given("I click the size button")
def step_impl(context):
    button = context.behave_driver.find_element(
        By.CSS_SELECTOR, "#variant_select_buttons_unisex button")
    button.click()
    time.sleep(1)


@given("I click the any size button")
def step_impl(context):
    button = context.behave_driver.find_element(
        By.CSS_SELECTOR, "#variant_select_buttons button")
    button.click()
    time.sleep(1)


@given("I click the add to cart button")
def step_impl(context):
    button = context.behave_driver.find_element(By.CSS_SELECTOR, "#add")
    button.click()
    time.sleep(1)


@given("I click the checkout button")
def step_impl(context):
    button = context.behave_driver.find_element(
        By.XPATH, "//a[text()='Checkout']")
    button.click()
    time.sleep(0.5)


@given("I click the first item in the list")
def step_impl(context):
    button = context.behave_driver.find_element(
        By.CSS_SELECTOR, ".item-view-box")
    button.click()
    time.sleep(1)


@given("I remove item {n} from my cart")
def step_impl(context, n):
    buttons = context.behave_driver.find_elements(
        By.XPATH, "//button[text()='Remove']")
    buttons[int(n)-1].click()
    time.sleep(1)


@then("I expect that the cart is empty")
def step_impl(context):
    p = context.behave_driver.find_element(
        By.CSS_SELECTOR, "#cart_items_container p")
    assert p.text == "Your cart is empty!"


@then("I expect that the cart is not empty")
def step_impl(context):
    p = context.behave_driver.find_element(
        By.XPATH, "//a[text()='Checkout']")
    assert p.text.lower() == "checkout"


@then("I expect I am on the cart page")
def step_impl(context):
    assert context.behave_driver.current_url == "https://www.fangamer.com/cart"


@then("I expect I am on the home page")
def step_impl(context):
    assert context.behave_driver.current_url == "https://www.fangamer.com/"


@then('I expect that "{text}" is somewhere on the screen')
def step_impl(context, text):
    page = context.behave_driver.page_source
    assert text.lower() in page.lower()


@then("I expect no results to show up")
def step_impl(context):
    page = context.behave_driver.page_source
    assert "did not yield any results." in page.lower()


@then("I expect to see some items")
def step_impl(context):
    button = context.behave_driver.find_element(
        By.CSS_SELECTOR, ".item-view-box")
    assert button != None


@then("I expect the subtotal to be {subtotal}")
def step_impl(context, subtotal):
    time.sleep(0.5)
    text = context.behave_driver.find_element(
        By.CSS_SELECTOR, "#nav_cart_subtotal .text-fangamer-green-700"
    )
    assert f"${subtotal}" == text.text


@then("I expect every item on this page to be less than {price}")
def step_impl(context, price):
    items = context.behave_driver.find_elements(
        By.XPATH, "//span[./sup[contains(text(), '$')]]"
    )
    for item in items:
        assert int(price) >= int(item.text[1:])


@then("I expect that it says restock planned")
def step_impl(context):
    text = context.behave_driver.find_element(
        By.CSS_SELECTOR, "#add"
    )
    assert text != None


@then("I expect I can get notified when its back in stock")
def step_impl(context):
    button = context.behave_driver.find_element(
        By.CSS_SELECTOR, "#signup_modal_button"
    )
    button.click()
    time.sleep(0.5)
    dialogue = context.behave_driver.find_element(
        By.CSS_SELECTOR, "[id^='fancybox']"
    )
