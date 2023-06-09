*** Settings ***
Library   SeleniumLibrary

*** Test Cases ***
Flow การยื่นแบบภาษี
    Go to efilling Page
    Read information
    View service detail
    Start e-filling process

*** Keywords ***
Start e-filling process
    Switch Window   MAIN
    # close popup
    Click Element     xpath=//*[@id="announceModal"]/div/div/div[1]/button

View service detail
    Switch Window   NEW
    Wait Until Element Contains   xpath=//div/div[2]/h4[3]  
    ...  ช่วงเวลาการให้บริการของแต่ละช่องทาง

Read information
    Wait Until Element Is Visible   id:exampleModalLabel
    Click Element    xpath=//*[@id="announceModal"]/div/div/div[2]/div/div[2]/span/a 
    

Go to efilling Page
    Open Browser    https://efiling.rd.go.th/rd-cms/   browser=gc   
    ...    options=add_experimental_option("detach", True)
    ...    remote_url=http://167.99.75.45:8080/wd/hub
    Maximize Browser Window