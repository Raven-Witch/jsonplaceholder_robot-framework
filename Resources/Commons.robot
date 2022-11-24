*** Settings ***
Documentation    Common tasks
Library    RequestsLibrary
Library    Collections

*** Keywords ***
Commons.API Setup
    [Documentation]    Setup of an API Test, takes the session name
    [Arguments]    ${sessionname}   ${url}
    Create Session    ${sessionname}   ${url}  verify=true

Commons.Convert first item in Responselist to Dictionary
    [Arguments]    ${response}
    ${list}=    convert to list    ${response}
    ${dict}=    convert to dictionary    ${list}[0]
    RETURN    ${dict}