*** Settings ***
Documentation    To validate the Login Form
Library    SeleniumLibrary
Test Teardown    Close Browser

*** Variables ***
${Error_message_login}    css:.alert-danger


*** Test Cases ***
Validate Unsuccessful Login
    Open the browser with url
    Fill the login form
    wait until it checks and displays error message
    verify error message is correct


    
*** Keywords ***
Open the browser with url
    Create Webdriver    Chrome
    Go To    https://rahulshettyacademy.com/loginpagePractise/
    
Fill the login form
    Input Text        id:username    rahulshettyacademy
    Input Password    id:password    12345
    Click Button        signInBtn
    
wait until it checks and displays error message
    Wait Until Element Is Visible    css:.alert-danger


verify error message is correct
    ${result}=    Get Text    ${Error_message_login}
    Should Be Equal As Strings    ${result}    Incorrect username/password.
    
