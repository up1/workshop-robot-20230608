*** Settings ***
Library    SeleniumLibrary

*** Variables ***

*** Test Cases ***
Success with search in google with keyword=hello
    Go to google.com
    Search with keyword=hello
    Found result with hello

*** Keywords ***
Go to google.com
    Open Browser    https://www.google.com   browser=chrome
    Maximize Browser Window