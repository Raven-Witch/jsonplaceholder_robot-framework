
# Run =
# robot -d Results tests/Example.robot
*** Settings ***
Documentation    Mein erster Robot Framework Test
Library    JSONLibrary
Library    RequestsLibrary
Library    Collections

Resource    ../Resources/JsonPlaceholderApp.robot
Resource    ../Resources/Commons.robot



Test Setup    Create Session    ${SESSION_NAME}   https://jsonplaceholder.typicode.com
*** Variables ***
${SESSION_NAME}=    excamplesession

*** Test Cases ***
Do a GET Request and validate the Response
    [Tags]    posts     get
    JsonPlaceholderApp.GET posts should return a list of posts    ${SESSION_NAME}

Do a GET Request for id 1 and validate the Response
    [Tags]    posts     get
    JsonPlaceholderApp.GET post 1 should return a post    ${SESSION_NAME}