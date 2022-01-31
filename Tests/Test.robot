*** Settings ***
Library    AppiumLibrary    timeout=15
Library    BuiltIn
Library    OperatingSystem
Library    DateTime
Library     ../Extension/GTVLibrary.py
Resource    ../Resources/data.robot
Resource    ../Resources/locators.robot
Resource    ../Resources/resource.robot

*** Test Cases ***
1 Launch the GTV application
    Launch Applacation
2 Login with a valid email and password
    Login with a valid email and password
3 Check home Page video info
    Wait Until Page Contains Element    ${Main_Feed_List}
    Get Video List Structure    ${Main_Feed_List}
    Capture Page Screenshot     HomePage.png
4 Navigate To Newest Check The First Video info
    Navigate To Newest Check The First Video info
5 Verify The Playback Function
    Verify The Playback Quality Function
    Verify The Playback Speed Function
    Verify Playback Forward And Backward Function  
6 Verify User Is Able To like The Video
    Toggle Selected Attribute    ${Video_Like_Button}
    Toggle Selected Attribute    ${Video_Like_Button}
7 Verify User Is Able To Dislike The Video
    Toggle Selected Attribute    ${Video_Dislike_Button}
    Toggle Selected Attribute    ${Video_Dislike_Button}
8 Verify User Is Able To "Add A Public Comment" For The Video
    Add A Public Comment For The Video    ${Dict_Comment_Text}[first]
    Add A Public Comment For The Video    ${Dict_Comment_Text}[second]
9 Verify The Favorites Function
    Verify The Favorites Function


