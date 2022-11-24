*** Settings ***
Documentation    This is the Link between the test cases and the demo rest service

Resource    ./PO/PostsPO.robot
Library    Collections

Resource    ./Commons.robot

*** Keywords ***
JsonPlaceholderApp.GET posts should return a list of posts
    [Arguments]    ${sessionname}
    ${response}=    PostsPO.GET posts   ${sessionname}
    ${first_item}=  Commons.Convert first item in Responselist to Dictionary    ${response}

    dictionary should contain key   ${first_item}    userId
    dictionary should contain key   ${first_item}    id
    dictionary should contain key   ${first_item}    title
    dictionary should contain key   ${first_item}    body

JsonPlaceholderApp.Convert first item in Responselist to Dictionary
    [Arguments]    ${response}
    ${list}=    convert to list    ${response}
    ${dict}=    convert to dictionary    ${list}[0]
    RETURN    ${dict}

JsonPlaceholderApp.Convert Response to Dict
    [Arguments]    ${response}
    ${dict}=    convert to dictionary    ${response}
    RETURN    ${dict}

JsonPlaceholderApp.GET post 1
    PostsPO.GET post 1

JsonPlaceholderApp.GET post 1 comments
    PostsPO.GET post 1 comments

JsonPlaceholderApp.POST posts
    PostsPO.POST posts

JsonPlaceholderApp.PUT posts 1
    PostsPO.PUT posts 1

JsonPlaceholderApp.PATCH post 1
    PostsPO.PATCH post 1

JsonPlaceholderApp.DELETE post 1
    PostsPO.DELETE post 1
