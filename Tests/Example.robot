
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
Do a GET Request and validate the Response Code
    [Tags]    posts
    JsonPlaceholderApp.GET posts should return a list of posts    ${SESSION_NAME}
