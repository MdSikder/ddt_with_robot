*** Settings ***
Library     SeleniumLibrary
#Library    DataDriver   ../TestData/logindata.xlsx  sheet_name=Sheet1
Resource  ../Resources/login_resources.robot

Suite Setup     Open my Browser
Suite Teardown  Close Browsers
Test Template   Run Login Test

*** Test Cases ***
LoginTestwithExcel
    ${InvalidUsername}    ${InvalidPassword}  ${ValidUsername}    ${ValidPassword}

*** Keywords ***
Run Login Test
    [Arguments]   ${InvalidUsername}    ${InvalidPassword}  ${ValidUsername}    ${ValidPassword}
    Invalid login    ${InvalidUsername}    ${InvalidPassword}  ${ValidUsername}    ${ValidPassword}
    Valid login    ${InvalidUsername}    ${InvalidPassword}  ${ValidUsername}    ${ValidPassword}

Invalid login
    [Arguments]   ${InvalidUsername}    ${InvalidPassword}  ${ValidUsername}    ${ValidPassword}
    Input Username     ${InvalidUsername}
    Input pwd       ${InvalidPassword}
    click login button
    # Validation for invalid login
    Error message should be visible

Valid login
    [Arguments]    ${InvalidUsername}    ${InvalidPassword}  ${ValidUsername}    ${ValidPassword}
    Input Username     ${ValidUsername}
    Input pwd       ${ValidPassword}
    click login button
    Error message should be visible
