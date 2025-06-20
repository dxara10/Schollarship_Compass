*** Settings ***
Documentation     Componentes da página de tarefas
Library    Browser


*** Keywords ***
Task should be registered
    [Arguments]    ${task_name}

    Wait For Elements State    css=.task-todo >> text=${task_name}
    ...    visible    5


Task should be complete
    [Arguments]    ${task_name}

    ${element}     Set Variable
    ...    css=.task-done >> text=${task_name}

    Wait For Elements State     ${element}
    ...    visible    10
    

    Get Style    ${element}    text-decoration-line    equal    line-through


#//strong[text()="Proteger a terra"]/..//button@class="item-toggle"
#//strong[text()="Proteger a terra"]/..
# se não funcionar, pegar manualmente o xpath do botão

 Mark task as completed
    [Arguments]    ${task_name}

    ${element}     Set Variable     
    ...    xpath=//*[@id="root"]/div/main/div/div/div/div/button[1]
    Wait For Elements State    ${element}    visible    5

    Click    ${element}

Request removal
    [Arguments]    ${task_name}

    ${element}     Set Variable     
    ...    xpath=//*[@id="root"]/div/main/div/div/div/div/button[2]
    Wait For Elements State    ${element}    visible    5

    Click    ${element}

Task should not exist
    [Arguments]    ${task_name}

    Wait For Elements State    css=.task-todo >> text=${task_name}
    ...    detached    5