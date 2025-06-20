*** Settings ***
Documentation     Tests for the remove task


Resource           ../../resources/base.resource


Test Setup       Start Session
Test Teardown    Take Screenshot

*** Test Cases ***
Deve poder apagar uma tarefa

    ${data}      Get fixtures    tasks    delete

    Clean user from database     ${data}[user][email]
    Insert user from database    ${data}[user]

    POST user session    ${data}[user]
    POST a new task      ${data}[task]


    Submit login form           ${data}[user]
    User should be logged in    ${data}[user][name]

    Request removal           ${data}[task][name]
    Task should not exist     ${data}[task][name]