*** Settings ***
Documentation    To verify Toast message "Logged In" after Successfully Log In
Resource    ../Resources/data.robot
Resource    ../Resources/locators.robot
Resource    ../Resources/resource.robot
*** Test Cases ***
1 Launch the GTV application
    Launch Applacation
2 Tap on the 'Profile' column at the bottom
    Wait Until Page Contains Element    ${Main_Profile}
    Click element    ${Main_Profile}
3 Enter email in 'Email' field
    Wait Until Page Contains Element    ${Login_Email_Field}
    Element Text Should Be    ${Login_Email_Field}    Enter your email
    Input Text    ${Login_Email_Field}      ${Dict_User_Valid}[email]
4 Enter the password in 'Password' field
    Element Text Should Be    ${Login_Password_Fieled}    Enter your password
    Input text    ${Login_Password_Fieled}   ${Dict_User_Valid}[password]
5 Tap on the 'Log In' button
    Click element    ${Login_Login_Button}


