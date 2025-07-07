*** Settings ***
Library    SeleniumLibrary
Library    FakerLibrary
Library    Collections
Library    RequestsLibrary
Resource    ../Ressource/variablesAPI.robot

*** Keywords ***
Setup Test Data
    ${FIRST_NAME}=         FakerLibrary.First Name Male
    ${LAST_NAME}=          FakerLibrary.Last Name 
    ${EMAIL}=              FakerLibrary.Email      
    ${UPDATED_FIRST_NAME}=   FakerLibrary.First Name Female
    Set Suite Variable    ${FIRST_NAME}
    Set Suite Variable    ${LAST_NAME}
    Set Suite Variable    ${EMAIL}
    Set Suite Variable    ${UPDATED_FIRST_NAME}
    Create Session    ${SESSION}    ${BASE_URL}    headers={"Authorization": "${API_KEY}"}

Create Contact
    [Arguments]    ${first_name}    ${last_name}    ${locale}    ${email}
    ${body}=    Create Dictionary
    ...    first_name=${first_name}
    ...    last_name=${last_name}
    ...    email=${email}
    ...    locale=${locale}
    ${response}=    POST On Session    ${SESSION}    /contacts    json=${body}
    Should Be Equal As Integers    ${response.status_code}    201
    ${json}=    Convert To Dictionary    ${response.json()}
    Dictionary Should Contain Value    ${json}    ${first_name}
    ${contact_id}=    Set Variable    ${json['id']}
    Set Suite Variable       ${contact_id}
    Wait Until Keyword Succeeds    5x    4s    Contact Should Exist    ${contact_id}    ${first_name}

Contact Should Exist
    [Arguments]    ${id}    ${expected_name}
    ${response}=    GET On Session    ${SESSION}    /contacts/${id}
    Should Be Equal As Integers    ${response.status_code}    200
    ${json}=    Convert To Dictionary    ${response.json()}
    Should Be Equal    ${json['first_name']}    ${expected_name}

Get Contact
    [Arguments]    ${id}    ${first_name}
    Wait Until Keyword Succeeds    5x    4s    Contact Should Exist    ${contact_id}    ${first_name}
    ${response}=    GET On Session    ${SESSION}    /contacts/${id}
    Should Be Equal As Integers    ${response.status_code}    200
    ${json}=    Convert To Dictionary    ${response.json()}
    RETURN    ${json}

Update Contact First Name
    [Arguments]    ${new_first_name}     ${id}    ${first_name}
    Wait Until Keyword Succeeds    5x    4s    Contact Should Exist    ${contact_id}    ${first_name}
    ${body}=    Create Dictionary
    ...    first_name=${new_first_name}
    ${response}=    PATCH On Session    ${SESSION}    /contacts/${id}    json=${body}
    Should Be Equal As Integers    ${response.status_code}    200
    ${json}=    Convert To Dictionary    ${response.json()}
    Dictionary Should Contain Value    ${json}    ${new_first_name}

Delete Contact
    [Arguments]    ${id}
    ${response}=    DELETE On Session    ${SESSION}    /contacts/${id}
    Should Be Equal As Integers    ${response.status_code}    204
