*** Settings ***
Library     SeleniumLibrary
Library    DataDriver   ../TestData/logindata.xlsx  sheet_name=Sheet1
Resource  ../Resources/login_resources.robot

Suite Setup     Open my Browser
Suite Teardown  Close Browsers
Test Template   Invalid login

Suite Setup     Open my Browser
Suite Teardown      Close Browsers
Test Template       Invalid login

*** Test Cases ***
LoginTestwithExcel  ${InvalidUsername}    ${InvalidPassword}  ${ValidUsername}    ${ValidPassword}

*** Keywords ***
Invalid login
    [Arguments]    ${InvalidUsername}    ${InvalidPassword}  ${ValidUsername}    ${ValidPassword}
    Input Username     ${InvalidUsername}
    Input pwd       ${InvalidPassword}
    click login button
    Error message should be visible
