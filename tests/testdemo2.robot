*** Settings ***
Documentation    To validate the Login Form
Library    SeleniumLibrary
Library    Collections
Test Setup        Open the browser with url
Test Teardown    Close Browser Session
Resource    ../tests/Resources/resource.robot

*** Variables ***
${Error_message_login}    css:.alert-danger
${Shop_page_load}        css:.nav-link

*** Test Cases ***
Validate Unsuccessful Login
    [Tags]    SMOKE
    Fill the login form     ${user_name}  ${invalid_password}
    Wait Until Element Is Visible    ${Error_message_login}
    verify error message is correct

Validate Cards display in the Shopping page
    Fill the login form    ${user_name}    ${valid_password}  
    Wait Until Element Is Seen    ${Shop_page_load} 
    Verify Card titles in the Shop page
    Select the Card    Nokia Edge

Select the Form and navigate to Child window
    Fill the login form and select the User option


*** Keywords ***    
Fill the login form
    [Arguments]    ${username}    ${password}
    Input Text        id:username    ${username}
    Input Password    id:password    ${password}
    Click Button        signInBtn

Wait Until Element Is Seen
    [Arguments]    ${element}
    Wait Until Element Is Visible    ${element}


verify error message is correct
    ${result}=    Get Text    ${Error_message_login}
    Should Be Equal As Strings    ${result}    Incorrect username/password.
    
Verify Card titles in the Shop page
    @{expectedList} =    Create List    iphone X    Samsung Note 8    Nokia Edge    Blackberry
    @{actualList} =     Create List
    ${elements} =    Get WebElements    css:.card-title
    FOR  ${element}  IN    @{elements}
        Log    ${element.text}
        Append to List    ${actualList}    ${element.text}
    END
    Lists Should Be Equal    ${expectedList}    ${actualList}
    
Select the Card
    [Arguments]    ${cardname}
    ${elements} =    Get WebElements    css:.card-title
    ${index} =    Set Variable    1
    FOR  ${element}  IN    @{elements}
        Exit For Loop If     '${cardname}' == '${element.text}'
         ${index} =    Evaluate    ${index} + 1      
    END
    Click Button    xpath:(//*[@class='card-footer'])[${index}]/button
   


Fill the login form and select the User option
    Input Text        id:username    ${user_name}
    Input Password    id:password    ${valid_password}
    Click Element    css:input[value='user']
    Wait Until Element Is Visible    css:.modal-body
    Click Button    okayBtn
    Click Button    okayBtn
    Wait Until Element Is Not Visible    css:.modal-body
    Select From List By Value    css:select.form-control    teach
    Select Checkbox    terms
    Checkbox Should Be Selected    terms
     Sleep    5s