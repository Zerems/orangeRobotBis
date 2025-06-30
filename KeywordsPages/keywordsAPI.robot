*** Settings ***
Library    SeleniumLibrary
Library    FakerLibrary
Library    Collections
Library    RequestsLibrary
Resource    ../Ressource/variablesAPI.robot

*** Keywords ***
Create Pet
    [Arguments]    ${id}    ${name}    ${status}
    ${body}=    Create Dictionary
    ...    id=${id}
    ...    name=${name}
    ...    photoUrls=@{EMPTY}
    ...    status=${status}
    ${response}=    POST On Session    ${SESSION}    /pet    json=${body}
    Should Be Equal As Integers    ${response.status_code}    200
    Dictionary Should Contain Value    ${response.json()}    ${name}

Get Pet
    [Arguments]    ${id}
    ${response}=    GET On Session    petstore    /pet/${id}
    Should Be Equal As Integers    ${response.status_code}    200
    Dictionary Should Contain Value    ${response.json()}    ${PET_NAME}

Update Pet Name
    [Arguments]    ${id}    ${new_name}
    ${body}=    Create Dictionary
    ...    id=${id}
    ...    name=${new_name}
    ...    photoUrls=@{EMPTY}
    ...    status=available
    ${response}=    PUT On Session    ${SESSION}    /pet    json=${body}
    Should Be Equal As Integers    ${response.status_code}    200
    Dictionary Should Contain Value    ${response.json()}    ${new_name}

Delete Pet
    [Arguments]    ${id}
    ${response}=    DELETE On Session    ${SESSION}    /pet/${id}
    Should Be Equal As Integers    ${response.status_code}    200