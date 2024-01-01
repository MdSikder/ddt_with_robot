*** Settings ***
Library     SeleniumLibrary

# make prdefined keywords to use

*** Variables ***
${url}=     https://admin-demo.nopcommerce.com/login
${browser}=     chrome

*** Keywords ***
Open my Browser
    open browser    ${url}      ${browser}
    maximize browser window
    sleep    2

Close Browsers
    close all browsers

Open Login Page
    go to   ${url}

Input Username
#    [Arguments]    ${username}
    input text    id:Email      admin@yourstore.com
    sleep    2

Input pwd
#    [Arguments]    ${password}
    input text    id:Password      admin
    sleep    2

Click LogIn Button
    click element    xpath://button[contains(text(),'Log in')]

Input Product Id
    [Arguments]    ${Part}
    input text    xpath://input[@placeholder='Search']      ${Part}
    sleep    2

Click Logout
    click element    //a[normalize-space()='Logout']
    sleep    5
Error message should be visible
    page should contain    Login was unsuccessful

Dashboard page should be visible
    page should contain    Dashbord