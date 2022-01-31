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
Launch the GTV application
    Launch Applacation
# Go to Newest，Find the first video to watch
Tap on the first video on Newest
    Navigate To Newest Check The First Video info
    Verify The Playback Quality Function
    Verify The Playback Speed Function
    Verify Playback Forward And Backward Function  
    

