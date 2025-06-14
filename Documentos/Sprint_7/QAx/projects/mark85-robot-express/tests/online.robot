*** Settings ***
Documentation     Online Robot
Resource          ../resources/base.resource


*** Test Cases ***
Acessando Mark85
    Start Session
    Get Title    equal    Mark85 by QAx