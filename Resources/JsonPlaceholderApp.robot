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
    JsonPlaceholderApp.Compare Result Dictionary with defiened values  ${first_item}

JsonPlaceholderApp.GET post 1 should return a post
    [Arguments]    ${sessionname}
    ${response}=    PostsPO.GET post 1   ${sessionname}
    JsonPlaceholderApp.Compare Result Dictionary with defiened values  ${response}

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

JsonPlaceholderApp.Compare Result Dictionary with defiened values
    [Arguments]    ${dict}
    ${expected_userId}=  convert to number    1
    ${expected_id}=      convert to number    1
    ${expected_title}=   convert to string    sunt aut facere repellat provident occaecati excepturi optio reprehenderit
    ${expected_body}=    convert to string    quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto

    dictionary should contain item      ${dict}    userId    ${expected_userId}
    dictionary should contain item      ${dict}    id        ${expected_id}
    dictionary should contain item      ${dict}    title        ${expected_title}
    dictionary should contain item      ${dict}    body        ${expected_body}

