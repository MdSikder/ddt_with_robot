*** Settings ***
Library     SeleniumLibrary
Library    DataDriver   ../TestData/PartRun.xlsx  sheet_name=Sheet1
Resource  ../Resources/run_indecator_resources.robot

Suite Setup     Open my Browser
Suite Teardown  Close Browsers
Test Template   Run All Login Test

*** Test Cases ***
Check Login
    [Template]    _Check Login
    [Tags]    Run

*** Keywords ***
Run All Login Test
    [Arguments]    ${Part}      ${Run_Indi}
    ${run_test}    Evaluate    "${Run_Indi.lower()}" == "y"
    Run Keyword If    ${run_test}    _Check And Perform Valid Login    ${Part}
    Run Keyword If    ${run_test}    _Check And Perform Invalid Login    ${Part}
    Log    Test Skipped: Run_Indicator is not 'y'

_Check And Perform Valid Login
    [Arguments]    ${Part}
    Input Text    id:Email    ${Part}
    Sleep    2
    # Add more steps as needed for the login process

_Check And Perform Invalid Login
    [Arguments]    ${Part}
    Input Text    id:Email    ${Part}
    Sleep    2
    # Add more steps as needed for the login process

_Check Login
    [Arguments]    ${Part}  ${Run_Indi}
    ${run_test}    Evaluate    "${Run_Indi.lower()}" == "y"
    Run Keyword If    ${run_test}    _Check And Perform Valid Login    ${Part}
    Run Keyword If    ${run_test}    _Check And Perform Invalid Login    ${Part}
    Log    Test Skipped: Run_Indicator is not 'y'
