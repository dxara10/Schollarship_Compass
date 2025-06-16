*** Settings ***
Documentation     Componentes da página de tarefas
Library    Browser


*** Keywords ***
Task should be registered
    [Arguments]    ${task_name}

    Wait For Elements State    css=.task-todo >> text=${task_name}
    ...    visible    5
    