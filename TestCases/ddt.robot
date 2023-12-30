*** Settings ***
Library     SeleniumLibrary
Library    DataDriver   ../TestData/logindata.xlsx  sheet_name=Sheet1   # here we can use sheet name or number
Resource  ../Resources/login_resources.robot


Suite Setup     Open my Browser
Suite Teardown      Close Browsers
Test Template       Invalid login

*** Test Cases ***
LoginTestwithExcel    ${username}    ${password}

*** Keywords ***
Invalid login
    [Arguments]    ${username}      ${password}
    Input Username     ${username}
    Input pwd       ${password}
    click login button
    #Validation for invalid login
    Error message should be visible