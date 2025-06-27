*** Settings ***
Library    SeleniumLibrary
Library    FakerLibrary
Resource    keywordsConnexion.robot
Resource    ../Ressource/variablesBasket.robot

*** Keywords ***
Open And Connect To Home Page
    Open Browser To Login Page
    Maximize Browser Window
    Input Valid Username    ${VALID_USER}
    Input Valid Password    ${VALID_PASSWORD}
    Click on Login Button

Add Backpack To Basket
    Click Button    ${ADD_BACKPACK_BUTTON}

Add Bike Light To Basket
    Click Button    ${ADD_BIKELIGHT_BUTTON}

Visit Bolt T-shirt Page
    Click Element    ${VISIT_TSHIRT_ELEMENT}

Add Bolt T-shirt To Basket
    Click Button    ${ADD_TSHIRT_PAGE_BUTTON}

Go To Shopping Basket Page
    Click Element    ${BASKET_SHOPPING_BUTTON}

Remove Bikelight From Shopping Basket
    Click Button    ${REMOVE_BIKELIGHT_BUTTON}

Click Checkout Shopping Basket Button
    Click Button    ${CHECKOUT_SHOPPINGBASKET_BUTTON}

Add User Information
    ${first_name}=    FakerLibrary.First Name
    ${last_name}=     FakerLibrary.Last Name  
    ${zip_code}=      FakerLibrary.Zipcode
    Input Text    ${INPUT_FIRSTNAME_REGISTER}    ${first_name}
    Input Text    ${INPUT_LASTNAME_REGISTER}    ${last_name}
    Input Text    ${INPUT_ZIPCODE_REGISTER}    ${zip_code}

Click Button Continue Checkout
    Click Button    ${CONTINUE_BUTTON_REGISTER}

Click Finish Button Shopping
    Click Button    ${FINISH_BUTTON_BUY_SHOPPING_BASKET} 

Icone Shopping Cart Should Be Visible With Right Number
    [Arguments]    ${number}
    Element Should Contain    ${NUMBER_CART_BADGE}    ${number}
Final Page Should Be Open
    Location Should Be    ${COMPLETE_SHOPP_URL}

Thanks Message Should Be Visible
    Element Should Contain    ${THANKS_MESSAGE}    Thank you for your order!

Error Message User Information Should Be Visible
    Element Should Be Visible    ${ERROR_MESSAGE_CHECKOUT}