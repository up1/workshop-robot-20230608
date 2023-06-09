*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}   http://www.google.com
${TARGET}   chrome

*** Test Cases ***
Success with search in google with keyword=hello
    Go to google.com
    Search with keyword=hello
    Found result with hello

*** Keywords ***
Found result with hello
    Wait Until Page Contains    hello
    ${result}=  Get Text    id:result-stats
    Log To Console    ${result}

Search with keyword=hello
    Input Text    name:q    hello
    Press Keys    name:q    RETURN

Go to google.com
    Open Browser    chrome://settings/   browser=${TARGET}    
    ...    options=add_experimental_option("detach", True)
    ...    remote_url=http://167.99.75.45:8080/wd/hub
    Go To    ${URL}
    Maximize Browser Window