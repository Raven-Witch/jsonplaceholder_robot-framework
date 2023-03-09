*** Settings ***
Documentation    Generic Testsuite and Testcase Setup
Library    RequestsLibrary

*** Variables ***
${SESSION_NAME}    session
${LOG_LEVEL}       DEBUG    #TRACE, DEBUG, INFO (default), WARN, ERROR, NONE
${ROOT_URL}        https://jsonplaceholder.typicode.com

*** Keywords ***
TestSetup.General Setup Test
    TestSetup.Set Loglevel from Variable
    TestSetup.Create Session
    
TestSetup.Create Session
    Create Session    ${SESSION_NAME}    ${ROOT_URL}

TestSetup.Set Loglevel from Variable
    Set Log Level    ${LOG_LEVEL}
