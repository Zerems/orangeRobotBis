*** Settings ***
Library    RequestsLibrary
Library    SeleniumLibrary
Library    FakerLibrary
Suite Setup    Setup Test Data
Resource    ../KeywordsPages/keywordsAPI.robot
Resource    ../Ressource/variablesAPI.robot
Suite Teardown   Delete All Sessions

*** Test Cases ***
Create A New Contact
    Create Contact    ${FIRST_NAME}    ${LAST_NAME}    ${LOCALE}    ${EMAIL}
    Sleep    5s

Read The Created Contact
    Sleep    5s
    ${contact}=    Get Contact    ${contact_id}    ${FIRST_NAME}
    Should Be Equal    ${contact['first_name']}    ${FIRST_NAME}

Update The Contact
    Sleep    5S
    Update Contact First Name    ${UPDATED_FIRST_NAME}    ${contact_id}    ${FIRST_NAME}
    ${contact}=    Get Contact    ${contact_id}    ${UPDATED_FIRST_NAME}
    Should Be Equal    ${contact['first_name']}    ${UPDATED_FIRST_NAME}


Delete The Contact
    Sleep    5s
    Delete Contact    ${contact_id}
