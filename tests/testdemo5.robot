*** Settings ***
Documentation    To validate the Login Form
Library    SeleniumLibrary
Library    DataDriver    file=../tests/Resources/data.csv   encoding=utf-8    dialect=unix
Test Teardown    Close Browser
Test Template    Validate Unsuccessful Login

*** Variables ***
${Error_message_login}    css:.alert-danger

*** Test Cases ***
Login with user ${username} and password ${password}    asdsfr    asdf


*** Keywords ***
Validate Unsuccessful Login
    [Arguments]    ${username}    ${password}
    Open the browser with url
    Fill the login form    ${username}    ${password}
    wait until it checks and displays error message
    verify error message is correct

Open the browser with url
    Create Webdriver    Chrome
    Go To    https://rahulshettyacademy.com/loginpagePractise/
    
Fill the login form
    [Arguments]    ${username}    ${password}
    Input Text        id:username    ${username}
    Input Password    id:password    ${password}
    Click Button        signInBtn

wait until it checks and displays error message
    Wait Until Element Is Visible    css:.alert-danger


verify error message is correct
    ${result}=    Get Text    ${Error_message_login}
    Should Be Equal As Strings    ${result}    Incorrect username/password.
    
