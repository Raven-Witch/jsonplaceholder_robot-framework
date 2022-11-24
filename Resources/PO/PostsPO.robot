*** Settings ***
Documentation    Pageobject for the Posts in the demo rest service
Library    RequestsLibrary

*** Keywords ***
PostsPO.GET posts
    [Arguments]    ${sessionname}
    ${response}=    GET On Session    ${sessionname}   /posts
    Status Should Be    200     ${response}
    RETURN    ${response.json()}

PostsPO.GET post 1
    no operation

PostsPO.GET post 1 comments
    no operation

PostsPO.POST posts
    no operation

PostsPO.PUT posts 1
    no operation

PostsPO.PATCH post 1
    no operation

PostsPO.DELETE post 1
    no operation
