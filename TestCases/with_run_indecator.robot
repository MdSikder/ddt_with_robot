*** Settings ***
Library     SeleniumLibrary
#Library    DataDriver   ../TestData/data.csv
Library    DataDriver   ../TestData/logindata.xlsx  sheet_name=Sheet2
Resource  ../Resources/run_indecator_resources.robot

Suite Setup     Open my Browser
Suite Teardown  Close Browsers
Test Template   _Check And Perform Login

*** Test Cases ***
Check Login
    [Template]    _Check Login
    [Tags]    Run

*** Keywords ***
_Check And Perform Login
    [Arguments]    ${username}    ${password}
    Input Text    id:Email    ${username}
    Sleep    2
    Input Text    id:Password    ${password}
    Sleep    2
    Click Element    xpath://button[contains(text(),'Log in')]
    Sleep    2
    # Add more steps as needed for the login process

_Check Login
    [Arguments]    ${username}    ${password}    ${Run_Indicator}
    ${run_test}    Evaluate    "${Run_Indicator.lower()}" == "y"
    Run Keyword If    ${run_test}    _Check And Perform Login    ${username}    ${password}
    Log    Test Skipped: Run_Indicator is not 'y'
