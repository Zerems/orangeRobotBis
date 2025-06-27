*** Settings ***
Library    SeleniumLibrary
Resource    ../Ressource/variablesConnexion.robot

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN_URL}    ${BROWSER}

Input Valid Username
    [Arguments]    ${username}
    Input Text    ${INPUT_USERNAME}    ${username}

Input Invalid Username
    [Arguments]    ${username}
    Input Text    ${INPUT_USERNAME}    ${username}

Input Valid Password
    [Arguments]    ${password}
    Input Text    ${INPUT_PASSWORD}    ${password}

Click on Login Button
    Click Button    ${SUBMIT_BUTTON}

Home Page Should Be Open
    Location Should Be    ${WELCOME_URL}

Error message should be visible
    Element Should Be Visible    ${ERROR_WINDOW}