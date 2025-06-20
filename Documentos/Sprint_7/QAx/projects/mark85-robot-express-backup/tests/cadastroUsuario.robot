*** Settings ***
Documentation     Cadastro de Usuário Robot
Library           FakerLibrary
Resource          ../resources/base.resource



Test Setup        Start Session
Test Teardown     Take Screenshot


*** Test Cases ***
Cadastrar Usuário

    #massa de dados
    ${user}    Create Dictionary
    ...    name=Fulano da Silva
    ...    email=fulano@qa.com
    ...    password=pwd123

    Remove user from database    ${user}[email]

    Go to signup Page    
    Submit formulario    ${user}
    Notice should be     Boas vindas ao Mark85, o seu gerenciador de tarefas.


Nao deve permitir cadastro com email duplicado
    [Tags]    duplicado
    
    #massa de dados
    ${user}    Create Dictionary
    ...    name=Ciclano da Silva
    ...    email=ciclano@qa.com
    ...    password=pwd123

    Remove user from database        ${user}[email]
    Insert user from database        ${user}

    Go to signup Page    
    Submit formulario    ${user}
    Notice should be     Oops! Já existe uma conta com o e-mail informado.

Campos Obrigatorios
    [Tags]    Obrigatorios 
    ${user}    Create Dictionary    
    ...    name=${EMPTY}
    ...    email=${EMPTY}
    ...    password=${EMPTY}
    
    Go to signup Page
    Submit formulario    ${user}

    Alert Should be    Informe seu nome completo
    Alert Should be    Informe seu e-email
    Alert Should be    Informe uma senha com pelo menos 6 digitos
    

Não deve cadastrar email incorreto
    [Tags]    emailinvalido
    ${user}    Create Dictionary    
    ...    name=DouglasQA
    ...    email=emailinvalido
    ...    password=123456
    
    Go to signup Page
    Submit formulario    ${user}
    Alert Should be    Digite um e-mail válido

Não deve cadastrar com senhas curtas
    [Tags]    temp
    @{password_list}    Create List    
    ...    1
    ...    12
    ...    123
    ...    1234
    ...    12345
    
    FOR    ${password}    IN    @{password_list}
        ${user}    Create Dictionary    
        ...    name=DouglasQA
        ...    email=douglasqa@gmail.com
        ...    password=${password}
    
        Go to signup Page
        Submit formulario    ${user}


        Alert Should be    Informe uma senha com pelo menos 6 digitos
    END

