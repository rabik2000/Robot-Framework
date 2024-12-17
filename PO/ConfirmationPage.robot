*** Settings ***
Documentation    All the page objects and keywords of landing page.
Library    SeleniumLibrary
Resource    ../tests/Resources/resource.robot




*** Keywords ***    

Enter the Country
    [Arguments]    ${country_name}
    Input Text    id:country    ${country_name}
    Sleep    5
    Wait until element is located in the page        //a[text()='${country_name}']
    Click Element    //a[text()='${country_name}']
    Click Element    css:.checkbox label

Purchase the Product
    Click Button    css:.btn-success
    Page Should Contain    Success!