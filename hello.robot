*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}   http://www.google.com

*** Test Cases ***
Success with search in google with keyword=hello
    Go to google.com
    Search with keyword=hello
    Found result with hello

*** Keywords ***
Go to google.com
    Open Browser    chrome://settings/   browser=gc   
    ...    options=add_experimental_option("detach", True)
    Go To    ${URL}
    Maximize Browser Window