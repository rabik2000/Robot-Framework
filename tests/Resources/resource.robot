*** Settings ***
Documentation    A resource file with reusable keywords and variables.
Library    SeleniumLibrary
Library    OperatingSystem

*** Variables ***
${user_name}    rahulshettyacademy
${invalid_password}    12345
${valid_password}    learning
${url}            https://rahulshettyacademy.com/loginpagePractise/


*** Keywords ***
Open the browser with url
    Create Webdriver    Chrome
    Maximize Browser Window
    Go To    ${url}
    
Open chosen browser with url
    [Arguments]    ${browser_name}
    Create Webdriver    ${browser_name}
    Maximize Browser Window
    Go To    ${url}


Close Browser Session
    Close Browser


Wait until element is located in the page
    [Arguments]    ${page_locator}
    Wait Until Element Is Visible    ${page_locator}