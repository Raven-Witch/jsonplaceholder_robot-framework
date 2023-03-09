
# Run =
# robot -d Results tests/Example.robot
*** Settings ***
Documentation    My first Robot Framework test Suite
#Library    JSONLibrary
Library    RequestsLibrary
Library    Collections

Resource    ../Resources/JsonPlaceholderApp.robot
Resource    ../Resources/Commons.robot
Resource    ../Resources/TestSetup.robot



#Test Setup    Create Session    ${SESSION_NAME}   https://jsonplaceholder.typicode.com
*** Variables ***
${SESSION_NAME}=    excamplesession

*** Test Cases ***
Do a GET Request and validate the Response
    [Tags]    posts     get
    JsonPlaceholderApp.GET posts should return a list of posts    ${SESSION_NAME}

Do a GET Request for id 1 and validate the Response
    [Tags]    posts     get
    JsonPlaceholderApp.GET post 1 should return a post    ${SESSION_NAME}

Do a GET Request for id 1s comments and validate the response
    [Tags]    posts     comments     get
    JsonPlaceholderApp.GET post 1 comments    ${SESSION_NAME}