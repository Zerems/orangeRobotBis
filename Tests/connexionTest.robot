*** Settings ***
Library   SeleniumLibrary
Resource    ../KeywordsPages/keywordsConnexion.robot
Test Setup    Open Browser To Login Page
Test Teardown    Close Browser


*** Test Cases ***
Connexion with valid credentials
    Input Valid Username    ${VALID_USER}
    Input Valid Password    ${VALID_PASSWORD}
    Click on Login Button
    Home Page Should Be Open


Connexion with invalid credentials
    Input Invalid Username    ${INVALID_USER}
    Input Valid Password    ${VALID_PASSWORD}
    Click on Login Button
    Error message should be visible