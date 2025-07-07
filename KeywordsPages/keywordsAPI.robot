*** Settings ***
Library    SeleniumLibrary
Library    FakerLibrary
Library    Collections
Library    RequestsLibrary
Resource    ../Ressource/variablesAPI.robot

*** Keywords ***
Setup Test Data
    ${PET_ID}=         FakerLibrary.Random Int    100    9900
    ${PET_NAME}=       FakerLibrary.First Name Male
    ${UPDATED_NAME}=   FakerLibrary.First Name Female
    Set Suite Variable    ${PET_ID}
    Set Suite Variable    ${PET_NAME}
    Set Suite Variable    ${UPDATED_NAME}
    Create Session    ${SESSION}    ${BASE_URL}

Create Pet
    [Arguments]    ${id}    ${name}    ${status}
    ${category}=    Create Dictionary    id=0    name=dog
    ${tag}=         Create Dictionary    id=0    name=test
    @{tags}=        Create List    ${tag}
    ${body}=    Create Dictionary
    ...    id=${id}
    ...    category=${category}
    ...    name=${name}
    ...    photoUrls=@{EMPTY}
    ...    tags=${tags}
    ...    status=${status}
    ${response}=    POST On Session    ${SESSION}    /pet    json=${body}
    Should Be Equal As Integers    ${response.status_code}    200
    ${json}=    Convert To Dictionary    ${response.json()}
    Dictionary Should Contain Value    ${json}    ${name}
    ${real_id}=    Set Variable    ${json['id']}
    Set Suite Variable    ${PET_ID}    ${real_id}
    Wait Until Keyword Succeeds    5x    4s    Pet Should Exist    ${real_id}    ${name}

Pet Should Exist
    [Arguments]    ${id}    ${expected_name}
    ${response}=    GET On Session    ${SESSION}    /pet/${id}
    Should Be Equal As Integers    ${response.status_code}    200
    ${json}=    Convert To Dictionary    ${response.json()}
    Should Be Equal    ${json['name']}    ${expected_name}

Get Pet
    [Arguments]    ${id}    ${name}
    Pet Should Exist    ${id}    ${name}
    ${response}=    GET On Session    ${SESSION}    /pet/${id}
    Should Be Equal As Integers    ${response.status_code}    200
    ${json}=    Convert To Dictionary    ${response.json()}
    RETURN    ${json}

Update Pet Name
    [Arguments]    ${id}    ${new_name}
    ${body}=    Create Dictionary
    ...    id=${id}
    ...    name=${new_name}
    ...    photoUrls=@{EMPTY}
    ...    status=available
    ${response}=    PUT On Session    ${SESSION}    /pet    json=${body}
    Should Be Equal As Integers    ${response.status_code}    200
    ${json}=    Convert To Dictionary    ${response.json()}
    Dictionary Should Contain Value    ${json}    ${new_name}

Delete Pet
    [Arguments]    ${id}
    ${response}=    DELETE On Session    ${SESSION}    /pet/${id}
    Should Be Equal As Integers    ${response.status_code}    200
