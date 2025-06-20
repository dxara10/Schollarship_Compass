*** Settings ***
Documentation     Consumindo API REST do mark85

Library           RequestsLibrary


*** Keywords ***
POST user session
    [Arguments]    ${user}
    ${payload}    Create Dictionary
    ...    email=${user}[email]
    ...    password=${user}[password]

#    ${headers}    Create Dictionary
#    ...    Authorization=${token}

    ${resp}    POST    url=http://localhost:3333/sessions      
    ...    json=${payload}
#    ...    headers=${headers}
    ...    expected_status=200
    
    ${token}    Set Variable    ${resp.json()}[token]
    Set Test Variable    ${token}

POST a new task
    [Arguments]    ${payload}

    ${headers}    Create Dictionary
    ...    Authorization=${token}

    POST    url=http://localhost:3333/tasks      
    ...    json=${payload}
    ...    headers=${headers}
    ...    expected_status=201