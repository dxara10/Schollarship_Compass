*** Settings ***
Documentation       Cenários de tentativa de cadastro com senha curta
Resource            ../resources/base.resource


Test Template    Short password


Test Setup        Start Session
Test Teardown     Take Screenshot


*** Test Cases ***

Nao passar senha 1 digitos    1
Nao passar senha 2 digitos    12
Nao passar senha 3 digitos    123
Nao passar senha 4 digitos    1234
Nao passar senha 5 digitos    12345







#*** Keywords ***
#Short password
#    [Arguments]    ${short_pass}
#    ${user}    Create Dictionary    
#    ...    name=DouglasQA
#    ...    email=douglasqa@gmail.com
#    ...    password=${short_pass}
#    
#    Go to signup Page
#    Submit formulario    ${user}
#
#
#    Alert Should be    Informe uma senha com pelo menos 6 digitos
