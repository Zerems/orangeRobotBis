*** Settings ***
Library    RequestsLibrary
Library    SeleniumLibrary
Library    FakerLibrary
Suite Setup    Setup Test Data
Resource    ../KeywordsPages/keywordsAPI.robot
Resource    ../Ressource/variablesAPI.robot
Suite Teardown   Delete All Sessions

*** Test Cases ***
Create A New Pet
    Create Pet    ${PET_ID}    ${PET_NAME}    ${STATUS}
    Sleep    5s

Read The Created Pet
    Sleep    5s
    ${pet}=    Get Pet    ${PET_ID}    ${PET_NAME}
    Should Be Equal    ${pet['name']}    ${PET_NAME}

Update The Pet
    Sleep    5S
    Update Pet Name    ${PET_ID}    ${UPDATED_NAME}
    ${pet}=    Get Pet    ${PET_ID}    ${UPDATED_NAME}
    Should Be Equal    ${pet['name']}    ${UPDATED_NAME}

Delete The Pet
    Sleep    5s
    Delete Pet    ${PET_ID}
