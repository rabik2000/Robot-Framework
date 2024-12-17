*** Settings ***
Documentation    All the page objects and keywords of shop page.
Library    SeleniumLibrary


*** Variables ***
${Shop_page_load}        css:.nav-link


*** Keywords ***
Wait Until Element Is Seen
    Wait Until Element Is Visible    ${Shop_page_load}


Verify Card titles in the Shop page
    @{expectedList} =    Create List    iphone X    Samsung Note 8    Nokia Edge    Blackberry
    @{actualList} =     Create List
    ${elements} =    Get WebElements    css:.card-title
    FOR  ${element}  IN    @{elements}
        Log    ${element.text}
        Append to List    ${actualList}    ${element.text}
    END
    Lists Should Be Equal    ${expectedList}    ${actualList}