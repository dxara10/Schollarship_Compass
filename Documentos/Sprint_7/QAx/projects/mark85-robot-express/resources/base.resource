*** Settings ***

Library           Browser
Library           Collections
Library           JSONLibrary

Library           libs/database.py
Resource          env.resource

Resource          pages/components/Notice.resource
Resource          pages/components/Header.resource
Resource          pages/components/Alert.resource
Resource          pages/SignupPage.resource
Resource          pages/LoginPage.resource
Resource          pages/components/TaskCreatePage.resource
Resource          pages/components/TasksPage.resource

Resource          pages/services.resource




*** Keywords ***
Start Session
    New Browser    browser=firefox    headless=false
    New Page    ${BASE_URL}

Short password
    [Arguments]    ${short_pass}
    ${user}    Create Dictionary    
    ...    name=DouglasQA
    ...    email=douglasqa@gmail.com
    ...    password=${short_pass}
    
    Go to signup Page
    Submit formulario    ${user}


    Alert Should be    Informe uma senha com pelo menos 6 digitos


Get fixtures
    [Arguments]    ${file_name}    ${scenario}
    ${data}        Load Json From File
    ...    ${EXECDIR}/resources/fixtures/${file_name}.json
    ...    encoding=utf-8
    
    [Return]    ${data}[${scenario}]