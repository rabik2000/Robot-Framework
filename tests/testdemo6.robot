*** Settings ***
Documentation    To validate the Login Form
Library    SeleniumLibrary
Library    Collections
Library    ../Custom Libraries/Shop.py
Test Setup        Open chosen browser with url    Firefox
Test Teardown    Close Browser Session
Resource    ../tests/Resources/resource.robot
Resource    ../PO/LandingPage.robot
Resource    ../PO/Shop.robot
Resource    ../PO/CheckoutPage.robot
Resource    ../PO/ConfirmationPage.robot

*** Variables ***
@{listofproducts}        Blackberry    Nokia Edge    iphone X
${country_name}        India

*** Test Cases ***


Validate Cards display in the Shopping page
    [Tags]    REGRESSION
    LandingPage.Fill the login form    ${user_name}    ${valid_password}  
    Shop.Wait Until Element Is Seen
    Shop.Verify Card titles in the Shop page
    Hello World
    Add Items To Cart And Checkout    ${listofproducts}
    CheckoutPage.Verify items in the Checkout Page and proceed
    ConfirmationPage.Enter the Country        ${country_name}
    ConfirmationPage.Purchase the Product
    Sleep    5s









    

