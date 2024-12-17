*** Settings ***
Documentation    To validate the Login Form
Library    SeleniumLibrary
Test Setup    Open the browser with url
Test Teardown    Close Browser
Resource    ../tests/Resources/resource.robot
Library    String
Library    Collections

*** Variables ***
${Error_message_login}    css:.alert-danger


*** Test Cases ***
Validate Child window Functionality
    [Tags]    SMOKE
    Select the link of Child window
    Verify the user is Switched to Child window
    Grab the Email id in the Child Window
    Switch to Parent window and enter the Email
    

    
*** Keywords ***
Select the link of Child window
    Click Element    xpath:(//*[@class='blinkingText'])[1]
    
Verify the user is Switched to Child window
    Switch Window    NEW
    Element Text Should Be    css:h1    DOCUMENTS REQUEST


Grab the Email id in the Child Window
    ${text} =    Get Text    css:.red
    @{words}=    Split String    ${text}    at
    ${text_split} =    Get From List    ${words}    1
    @{words} =    Split String    ${text_split}
    ${email} =    Get From List    ${words}    0
    Log    ${email}
    Set Global Variable    ${email}

Switch to Parent window and enter the Email
    Switch Window    MAIN
    Title Should Be    LoginPage Practise | Rahul Shetty Academy
    Input Text    id:username    ${email}
    Sleep    5s