*** Settings ***
Documentation    Cenários de autenticação
Resource         ../resources/base.resource


Test Setup        Start Session
Test Teardown     Take Screenshot


*** Test Cases ***
Deve logar com usuario pre-cadastratado
    
    ${user}    Create Dictionary    
    ...    name=DouglasQA
    ...    email=douglasQA@gmail.com
    ...    password=123456


    Remove user from database    ${user}[email]
    Insert user from database    ${user}  

    
    Submit login form           ${user}
    User should be logged in    ${user}[name]

Não deve logar com senha inválida

    ${user}    Create Dictionary    
    ...    name=Steve
    ...    email=steve@apple.com
    ...    password=1234567


    Remove user from database    ${user}[email]
    Insert user from database    ${user}  

    Set To Dictionary    ${user}    password=abc123

    
    Submit login form           ${user}
    Notice should be            Ocorreu um erro ao fazer login, verifique suas credenciais.