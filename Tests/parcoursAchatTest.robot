*** Settings ***
Library   SeleniumLibrary
Resource    ../KeywordsPages/keywordsBasket.robot
#Arrange: Connection With Valid Credentials
Suite Setup    Open And Connect To Home Page
Suite Teardown    Close Browser

*** Test Cases ***
Add Multiple Items To Basket Shopping
    #Act: Add Items
    Add Backpack To Basket
    Add Bike Light To Basket
    #Assert: Check Items Are Counted
    Icone Shopping Cart Should Be Visible With Right Number    2
    #Act: Add an other Item By His Page
    Visit Bolt T-shirt Page
    Add Bolt T-shirt To Basket
    #Assert: Check New Item Is Counted
    Icone Shopping Cart Should Be Visible With Right Number    3

Remove An Item From Basket Shopping
    #Act: Remove 1 Item From Cart
    Go To Shopping Basket Page
    Remove Bikelight From Shopping Basket
    #Assert: Check New COunt Is Right
    Icone Shopping Cart Should Be Visible With Right Number    2

Error When Add User Information For Validate Shopping Cart
    #Act: Validate User Page With Empty Information
    Click Checkout Shopping Basket Button
    Click Button Continue Checkout
    #Assert: Check The Error Message Is Visible
    Error Message User Information Should Be Visible

Validate The Basket Shopping With Valid User
    #Act: Validate the Cart With Right User Info
    Add User Information
    Click Button Continue Checkout
    Click Finish Button Shopping
    #Assert: Check URL and Message are OK
    Final Page Should Be Open
    Thanks Message Should Be Visible