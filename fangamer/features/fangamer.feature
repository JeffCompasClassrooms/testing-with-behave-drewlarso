Feature: Fangamer Website Testing
    As a shopper
    I want to search through gaming merchandise
    and checkout when I am ready

    Scenario: User opens empty cart
        Given I open the fangamer homepage
        Given I click the shopping cart button
        Then I expect that the cart is empty

    Scenario: User wants to buy a book
        Given I open the product page at "https://www.fangamer.com/collections/guidebooks/products/m3-handbook"
        Given I click the add to cart button
        Then I expect that the cart is not empty
        Given I click the checkout button
        Then I expect I am on the cart page
        Given I remove item 1 from my cart

    Scenario: User wants to buy a shirt
        Given I open the product page at "https://www.fangamer.com/collections/t-shirts/products/desert-bus-2025"
        Given I click the size button
        Given I click the add to cart button
        Then I expect that the cart is not empty
        Given I click the checkout button
        Then I expect I am on the cart page
        Given I remove item 1 from my cart

    Scenario: User searches for a specific game
        Given I open the fangamer homepage
        Given I search "deltarune"
        Given I click the first item in the list
        Then I expect that "deltarune" is somewhere on the screen

    Scenario: User searches for an invalid game
        Given I open the fangamer homepage
        Given I search "invaliddata"
        Then I expect no results to show up

    Scenario: User wants to buy an out of stock item
        Given I open the product page at "https://www.fangamer.com/products/balatro-wall-calendar-2026"
        Then I expect that it says restock planned
        Then I expect I can get notified when its back in stock

    Scenario: User selects game from the navbar
        Given I open the fangamer homepage
        Given I click the collections button
        Given I click the first game in the collections tab

    Scenario: User wants to look through items under $15
        Given I open the product page at "https://www.fangamer.com/collections/gifts-under-15"
        Then I expect every item on this page to be less than 15

    Scenario: User wants to go back to the home page
        Given I open the product page at "https://www.fangamer.com/collections/metal-gear-solid/products/metal-gear-d-dog-plush"
        Given I click the navbar logo
        Then I expect I am on the home page

    Scenario: User adds multiple different products to their cart
        Given I open the product page at "https://www.fangamer.com/collections/metal-gear-solid/products/metal-gear-d-dog-plush"
        Given I click the add to cart button
        Given I open the product page at "https://www.fangamer.com/collections/t-shirts/products/desert-bus-2025"
        Given I click the size button
        Given I click the add to cart button
        Given I click the checkout button
        Then I expect the subtotal to be 72
        Given I remove item 2 from my cart
        Given I remove item 1 from my cart

    Scenario: User adds many of the same item to their cart
        Given I open the product page at "https://www.fangamer.com/collections/metal-gear-solid/products/metal-gear-d-dog-plush"
        Given I click the add to cart button
        Given I click the checkout button
        Given I click the add quantity button for item 1
        Given I click the add quantity button for item 1
        Then I expect the subtotal to be 108
        Given I remove item 1 from my cart

    Scenario: User adds a combo of items to their cart
        Given I open the product page at "https://www.fangamer.com/collections/metal-gear-solid/products/metal-gear-d-dog-plush"
        Given I click the add to cart button
        Given I open the product page at "https://www.fangamer.com/collections/long-sleeved-shirts/products/ufo-50-night-manor-shirt"
        Given I click the size button
        Given I click the add to cart button
        Given I click the checkout button
        Given I click the add quantity button for item 1
        Given I click the add quantity button for item 2
        Given I click the add quantity button for item 2
        Then I expect the subtotal to be 198
        Given I remove item 2 from my cart
        Given I remove item 1 from my cart

    Scenario: User wants less of an item in their cart
        Given I open the product page at "https://www.fangamer.com/collections/metal-gear-solid/products/metal-gear-d-dog-plush"
        Given I click the add to cart button
        Given I click the checkout button
        Given I click the add quantity button for item 1
        Given I click the add quantity button for item 1
        Given I click the add quantity button for item 1
        Given I click the subtract quantity button for item 1
        Given I click the subtract quantity button for item 1
        Then I expect the subtotal to be 72
        Given I remove item 1 from my cart

    Scenario: User wants less of multiple items in their cart
        Given I open the product page at "https://www.fangamer.com/collections/metal-gear-solid/products/metal-gear-d-dog-plush"
        Given I click the add to cart button
        Given I open the product page at "https://www.fangamer.com/collections/long-sleeved-shirts/products/ufo-50-night-manor-shirt"
        Given I click the size button
        Given I click the add to cart button
        Given I click the checkout button
        Given I click the add quantity button for item 1
        Given I click the add quantity button for item 2
        Given I click the add quantity button for item 2
        Given I click the subtract quantity button for item 1
        Given I click the subtract quantity button for item 2
        Given I click the subtract quantity button for item 2
        Given I click the subtract quantity button for item 2
        Then I expect the subtotal to be 45
        Given I remove item 1 from my cart

    Scenario: User wants to multiple limited items
        Given I open the product page at "https://www.fangamer.com/collections/restocked/products/mystery-shirt"
        Given I click the any size button
        Given I click the add to cart button
        Given I open the product page at "https://www.fangamer.com/collections/restocked/products/mystery-shirt"
        Given I click the any size button
        Given I click the add to cart button
        Given I open the product page at "https://www.fangamer.com/cart"
        Then I expect the subtotal to be 10