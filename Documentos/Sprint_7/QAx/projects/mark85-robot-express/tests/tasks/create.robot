*** Settings ***
Documentation     Tests for the create task

Resource           ../../resources/base.resource



Test Setup        Start Session
Test Teardown     Take Screenshot

*** Test Cases ***
Deve poder cadastrar uma nova tarefa

    ${data}    Get fixtures    tasks    create

    Clean user from database        ${data}[user][email]
    Insert user from database       ${data}[user]

    Submit login form               ${data}[user]
    User should be logged in        ${data}[user][name]

    Go to task form
    Submit task form                ${data}[task]
    Task should be registered       ${data}[task][name]

    Log            ${data}

Não deve cadastrar tarefa com nome duplicado
    [Tags]    dup
    
    ${data}    Get fixtures    tasks    duplicate

    Clean user from database        ${data}[user][email]
    Insert user from database       ${data}[user]

    POST user session    ${data}[user]
    POST a new task      ${data}[task]

    Submit login form               ${data}[user]
    User should be logged in        ${data}[user][name]

    Go to task form
    Submit task form                ${data}[task]
    #Task should be registered       ${data}[task][name]

   
    Notice should be    Oops! Tarefa duplicada.