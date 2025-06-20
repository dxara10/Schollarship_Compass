*** Settings ***
Documentation        Ações de alerta do componente de mensagens

Library        Browser


*** Keywords ***
Alert Should be
    [Arguments]    ${expected_text}
    Wait For Elements State    css=.alert-error >> text=${expected_text}
    ...    visible    5