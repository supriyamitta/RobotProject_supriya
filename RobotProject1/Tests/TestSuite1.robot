*** Settings ***
Library    SeleniumLibrary    

Suite Setup    Log    I am inside test suite setup    
Suite Teardown    Log    I am inside test suite Teardown

Test Setup    OpenBrowser
              
Test Teardown  CloseBrowser

Default Tags    Sanity

*** Test Cases ***
# MyFirstTest
    # Log    Hello Suppu....its your first robot test    
    
# #FirstSeleniumTest
    # #Open Browser    https://www.google.com/    Chrome   
    # Set Browser Implicit Wait    30
    # Input Text    name=q           Nokia
    # Press Keys    name=q    ENTER
  # #  Click Element    name=btnK    
    # Sleep    5    
    # #Close Browser
    
Sample Login test
    [Tags]    Regression
    [Documentation]    Sample login test
    Log    Test started by %{username} in %{os}
    Log    Name of the test is ${TEST NAME} 
    #Open Browser    ${URL}    ${Browser}
    Click Element    id=txtUsername
    Input Text    id=txtUsername    @{Credentials}[0]
    Click Element    id=txtPassword
    Input Password    id=txtPassword    &{LoginData}[password]
    Click Element    id=btnLogin    
    Set Browser Implicit Wait    5
    Click Element    id=welcome 
    Set Browser Implicit Wait    5
    Click Element    Link=Logout
    #Close Browser
    Log    Test completed    
    
KeywordTest

    [Documentation]    Sample login test
    Log    Test started by %{username} in %{os}
    Log    Name of the test is ${TEST NAME} 
    #Open Browser    ${URL}    ${Browser}
    Click Element    id=txtUsername
    LoginKW    
    Set Browser Implicit Wait    5
    Click Element    id=welcome 
    Set Browser Implicit Wait    5
    Click Element    Link=Logout
    #Close Browser
    Log    Test completed 
    
*** Variables ***

${URL}   https://opensource-demo.orangehrmlive.com/
${Browser}    Chrome

@{Credentials}    Admin    admin123

&{LoginData}    username=Admin    password=admin123    
              
*** Keywords ***

LoginKW
    Input Text    id=txtUsername    @{Credentials}[0]
    Click Element    id=txtPassword
    Input Password    id=txtPassword    &{LoginData}[password]
    Click Element    id=btnLogin
    
OpenBrowser
    SeleniumLibrary.Open Browser    ${URL}    ${Browser}
    
CloseBrowser
    SeleniumLibrary.Close Browser
    
