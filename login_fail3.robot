*** Settings ***
Library   SeleniumLibrary
Suite Setup   เข้าไปยังหน้า Login
Test Teardown   กลับไปยังหน้าแรก
Test Template   Template for login failed

*** Test Cases ***
#---------------------------------------------------------------
#      Case name            |       User name  |     Password  |
#---------------------------------------------------------------
Wrong username                    demo2                mode
Wrong password                    demo                 mode2
Wrong username and password       demo2                mode2
Empty username                    ${EMPTY}             mode
Empty password                    demo                 ${EMPTY}

*** Keywords ***
Template for login failed
    [Arguments]   ${username}   ${password}
    ทำการกรอกข้อมูล user=${username} และ password=${password}
    ผลการ login ผิดพลาด แสดงหน้า error

ทำการกรอกข้อมูล user=${username} และ password=${password}
    Input Text    id:username_field    ${username}
    Input Text    id:password_field    ${password}
    Click Element    id:login_button


ผลการ login ผิดพลาด แสดงหน้า error
    Wait Until Element Contains    xpath://*[@id="container"]/h1    Error Page
    Element Should Contain    xpath://*[@id="container"]/p    
    ...  Login failed. Invalid user name and/or password.

กลับไปยังหน้าแรก
    Go To    https://demo-login-workshop.vercel.app/

เข้าไปยังหน้า Login
    Open Browser    https://demo-login-workshop.vercel.app/   
    ...    browser=gc    
    ...    options=add_experimental_option("detach", True)
    Maximize Browser Window