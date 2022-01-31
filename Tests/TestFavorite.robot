*** Settings ***
Library    AppiumLibrary    timeout=15
Library    BuiltIn
Library    OperatingSystem
Library    DateTime
Library     ../Extension/GTVLibrary.py
Resource    ../Resources/data.robot
Resource    ../Resources/locators.robot
Resource    ../Resources/resource.robot
*** Variables ***
#${Playback_first_video}     //androidx.recyclerview.widget.RecyclerView[@resource-id="org.gtv.app:id/feed_list"]/android.view.ViewGroup[${1}]

*** Keywords ***

*** Test Cases ***
Launch the GTV application
    Launch Applacation
Login with a valid email and password
    Login with a valid email and password
Tap on the first video on Newest
    Navigate To Newest Check The First Video info
    Verify The Favorites Function

