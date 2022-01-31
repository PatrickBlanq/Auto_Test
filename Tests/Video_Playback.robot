*** Settings ***
Documentation    To verify that User able to like the video
Resource    ../Resources/resource.robot

*** Variables ***

*** Keywords ***

*** Test Cases ***
1 Launch the GTV application
    Launch Applacation
2 Login with a valid email and password
    Login with a valid email and password
3 Tap on "Any playback Video" in Home page
    Click Random Video Under Newest Tap
4 Tap on "Like" in Video play page
    Toggle Selected Attribute    ${Video_Like_Button}
    Toggle Selected Attribute    ${Video_Like_Button}
5 To verify that User able to Dislike the Video
    Toggle Selected Attribute    ${Video_Dislike_Button}
    Toggle Selected Attribute    ${Video_Dislike_Button}
6 To verify that User able to "Add a Public comment" for the video
    Add A Public Comment For The Video    ${Dict_Comment_Text}[first]
    Add A Public Comment For The Video    ${Dict_Comment_Text}[second]
