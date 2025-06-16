*** Settings ***
Documentation     Componentes da página de criação de tarefas
Library    Browser


*** Keywords ***
Submit task form
    [Arguments]    ${task}
    Fill Text    css=input[placeholder$=tarefa]    ${task}[name]

    ${tags_elements}    Set Variable    css=input[name=tags]

    FOR    ${tag}    IN    @{task}[tags]
        Fill Text    css=input[name=tags]    ${tag}
        Sleep    1
        Press Keys    css=input[name=tags]    Enter
    END

    Click    css=button >> text=Cadastrar

   