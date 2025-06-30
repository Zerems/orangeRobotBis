*** Settings ***
Library    RequestsLibrary
Library    SeleniumLibrary
Library    FakerLibrary
Resource    ../KeywordsPages/keywordsAPI.robot
Resource    ../Ressource/variablesAPI.robot
Suite Setup      Create Session    petstore    ${BASE_URL}
Suite Teardown   Delete All Sessions

*** Test Cases ***
Create A New Pet
    Create Pet    ${PET_ID}    ${PET_NAME}    ${STATUS}

Read The Created Pet
    Get Pet    ${PET_ID}

Update The Pet
    Update Pet Name    ${PET_ID}    ${UPDATED_NAME}

Delete The Pet
    Delete Pet    ${PET_ID}