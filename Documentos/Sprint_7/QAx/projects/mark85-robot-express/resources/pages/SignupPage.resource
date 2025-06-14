*** Settings ***
Library        Browser
Resource       ../env.resource


*** Keywords ***
Go to signup Page
    Go To    ${BASE_URL}/signup

    #Checkpoint: Verifica se a página de cadastro foi carregada
    Wait For Elements State    css=h1    visible     5
    Get Text                   css=h1    equal    Faça seu cadastro



Submit formulario
    [Arguments]        ${user}
    #formulario
    Fill Text    css=input[name=name]         ${user}[name]
    Fill Text    css=input[name=email]        ${user}[email]
    Fill Text    css=input[name=password]     ${user}[password]
    Click        css=button[type=submit] >> text=Cadastrar




