*** Settings ***
Library   SeleniumLibrary

*** Test Cases ***
Login fail with wrong password
    เข้าไปยังหน้า Login
    ทำการกรอกข้อมูล user=demo และ password=mode2
    ผลการ login ผิดพลาด แสดงหน้า error

*** Keywords ***
ผลการ login ผิดพลาด แสดงหน้า error
    Wait Until Element Contains    xpath://*[@id="container"]/h1    Error Page
    Element Should Contain    xpath://*[@id="container"]/p    
    ...  Login failed. Invalid user name and/or password.

ทำการกรอกข้อมูล user=demo และ password=mode2
    Input Text    id:username_field    demo
    Input Text    id:password_field    mode2
    Click Element    id:login_button


เข้าไปยังหน้า Login
    Open Browser    https://demo-login-workshop.vercel.app/   
    ...    browser=gc    
    ...    options=add_experimental_option("detach", True)
    Maximize Browser Window