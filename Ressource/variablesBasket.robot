*** Variables ***
#Add/Remove Items
${ADD_BACKPACK_BUTTON}    xpath://*[@id="add-to-cart-sauce-labs-backpack"]
${ADD_BIKELIGHT_BUTTON}    xpath://*[@id="add-to-cart-sauce-labs-bike-light"]
${ADD_TSHIRT_PAGE_BUTTON}    xpath://*[@id="add-to-cart"]
${REMOVE_BIKELIGHT_BUTTON}    xpath://*[@id="remove-sauce-labs-bike-light"] 

#Navigation elements
${BASKET_SHOPPING_BUTTON}    xpath://*[@id="shopping_cart_container"] 
${NUMBER_CART_BADGE}    css=[data-test="shopping-cart-badge"]
${VISIT_TSHIRT_ELEMENT}    xpath://div[text()="Sauce Labs Bolt T-Shirt"]

#URL
${COMPLETE_SHOPP_URL}    https://www.saucedemo.com/checkout-complete.html

#Error element
${ERROR_MESSAGE_CHECKOUT}    css=[data-test="error"]

#Validation elements
${CHECKOUT_SHOPPINGBASKET_BUTTON}    xpath://*[@id="checkout"]
${THANKS_MESSAGE}    css=[data-test="complete-header"]
${FINISH_BUTTON_BUY_SHOPPING_BASKET}    xpath://*[@id="finish"]
${CONTINUE_BUTTON_REGISTER}    xpath://*[@id="continue"]

#Add/remove infos 
${INPUT_FIRSTNAME_REGISTER}    xpath://*[@id="first-name"]
${INPUT_LASTNAME_REGISTER}    xpath://*[@id="last-name"]
${INPUT_ZIPCODE_REGISTER}    xpath://*[@id="postal-code"]