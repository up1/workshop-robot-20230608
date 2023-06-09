*** Settings ***
Library   SeleniumLibrary
Suite Setup   เข้าไปยังหน้า Login
Test Teardown   กลับไปยังหน้าแรก

*** Test Cases ***
Login fail with empty username
    [Tags]  done   feature1
    ทำการกรอกข้อมูล user=${EMPTY} และ password=mode2
    ผลการ login ผิดพลาด แสดงหน้า error

Login fail with wrong password
    [Tags]  done   feature1
    ทำการกรอกข้อมูล user=demo และ password=mode2
    ผลการ login ผิดพลาด แสดงหน้า error

Login fail with wrong username
    [Tags]  testing   feature1
    ทำการกรอกข้อมูล    demo2    mode
    ผลการ login ผิดพลาด แสดงหน้า error

*** Keywords ***
ทำการกรอกข้อมูล
    [Arguments]   ${username}   ${password}
    Input Text    id:username_field    ${username}
    Input Text    id:password_field    ${password}
    Click Element    id:login_button

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
    ...    remote_url=http://167.99.75.45:8080/wd/hub
    Maximize Browser Window