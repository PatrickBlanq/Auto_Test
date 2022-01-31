*** Settings ***
Library  AppiumLibrary    timeout=15
Library  BuiltIn
Library  Collections
Resource    data.robot
Resource    locators.robot
Library     ../Extension/GTVLibrary.py
*** Keywords ***
Launch Applacation
    [Timeout]    20
    Open Application	${Server}     platformName=${PlatformName}    platformVersion=${PlatformVersion}
    ...     deviceName=${DeviceName}      appPackage=${AppPackage}    appActivity=${AppActivity}
Login With A Valid Email And Password
    Wait Until Page Contains Element    ${Main_Profile}
    Click element    ${Main_Profile}
    Wait Until Page Contains Element    ${Login_Email_Field}
    Input Text    ${Login_Email_Field}      ${Dict_User_Valid}[email]
    Input text    ${Login_Password_Fieled}   ${Dict_User_Valid}[password]
    Hide Keyboard
    Click element    ${Login_Login_Button}
    
# Swipe up to find a random video to click
Click Random Video Under Newest Tap
    Wait Until Page Contains Element    ${Main_Newest_Tab}
    Click element      ${Main_Newest_Tab}
    Wait Until Page Contains Element    ${Main_Video_Length}
    ${random} =	Evaluate	random.randint(50, 500)
    Swipe    450    1500   450    ${random}
    Sleep    3    seconds
    Click element    ${Main_Video_Length}

After Click Element Should Be Unselected
    [Arguments]        ${SelectBefore}    ${TextBefore}    ${TextAfter}
    Should Be True    '${SelectBefore}' == 'true'
    ${TextBefore}    Evaluate    ${TextBefore} - 1
    ${TextAfter}    Convert To Integer    ${TextAfter}
    Should Be Equal As Integers    ${TextBefore}    ${TextAfter}
After Click Element Should Be Selected
    [Arguments]        ${SelectBefore}    ${TextBefore}    ${TextAfter}
    Should Be True    '${SelectBefore}' == 'false'
    ${TextBefore}    Evaluate    ${TextBefore} + 1
    ${TextAfter}    Convert To Integer    ${TextAfter}
    Should Be Equal As Integers    ${TextBefore}    ${TextAfter}
# For the element(like, dislike, favortite) can be selected and un selected
Toggle Selected Attribute
    [Arguments]    ${Element}
    Wait Until Page Contains Element    ${Element}
    ${TextBefore}    Get Element Attribute        ${Element}       text
    ${SelectBefore}    Get Element Attribute    ${Element}      selected
    Click Element    ${Element}
    ${TextAfter}    Get Element Attribute        ${Element}       text
    ${SelectAfter}    Get Element Attribute    ${Element}      selected
    Run Keyword If    '${SelectAfter}' == 'true'    After Click Element Should Be selected    ${SelectBefore}    ${TextBefore}    ${TextAfter}
    Run Keyword If    '${SelectAfter}' == 'false'    After Click Element Should Be Unselected    ${SelectBefore}    ${TextBefore}    ${TextAfter}
Add A Public Comment For The Video
    [Arguments]    ${CommentText}
    Wait Until Page Contains Element    ${Comment_Input_Placeholder}
    Click Element    ${Comment_Input_Placeholder}
    Wait Until Page Contains Element    ${Video_AddComment_Field}
    Input Text    ${Video_AddComment_Field}    ${CommentText}
    Click Element    ${Video_CommentSend_Button}
    Wait Until Page Contains    ${CommentText}
# for the video list
Log structure
    [Arguments]    ${Title}     ${nickname}     ${org.gtv.app:id/desc}
    Log  ${Title}
    Log  ${nickname}
    Log  ${org.gtv.app:id/desc}
Parse Live
    [Arguments]    ${xml}
    ${title}    Get Text    ${xml}//android.widget.TextView[@resource-id="org.gtv.app:id/title"]
    ${nickname}    Get Text    ${xml}//android.widget.TextView[@resource-id="org.gtv.app:id/nickname"]
    ${desc}    Get Text    ${xml}//android.widget.TextView[@resource-id="org.gtv.app:id/desc"]
    Log   ${title}, ${nickname}, ${desc}
Parse VideoPlayback
    [Arguments]    ${xml}
    ${title}    Get Text    ${xml}//android.widget.TextView[@resource-id="org.gtv.app:id/title"]
    ${nickname}    Get Text    ${xml}//android.widget.TextView[@resource-id="org.gtv.app:id/nickname"]
    ${desc}    Get Text    ${xml}//android.widget.TextView[@resource-id="org.gtv.app:id/desc"]
    Log   ${title}, ${nickname}, ${desc}
Parse UpComing
    [Arguments]    ${xml}
    ${title}    Get Text    ${xml}//android.widget.TextView[@resource-id="org.gtv.app:id/title"]
    ${start_time}    Get Text    ${xml}//android.widget.TextView[@resource-id="org.gtv.app:id/start_time"]
    ${desc}    Get Text    ${xml}//android.widget.TextView[@resource-id="org.gtv.app:id/desc"]
    Log   ${title}, ${start_time}, ${desc}
Get Video List Structure
    [Arguments]     ${Main_Feed_List}
    ${count_ViewGroup}    Get Matching Xpath Count    ${Main_Feed_List}
    #Log    ${Feed_List}[0]
    FOR    ${index}    IN RANGE     1   ${count_ViewGroup}
        #Log    ${index}
        #Parse ViewGroup     ${index}
        #Log   //androidx.recyclerview.widget.RecyclerView[@resource-id="org.gtv.app:id/feed_list"]/android.view.ViewGroup[${index}]
        ${count_ViewGroup_Son}   Get Matching Xpath Count    //androidx.recyclerview.widget.RecyclerView[@resource-id="org.gtv.app:id/feed_list"]/android.view.ViewGroup[${index}]/*
        IF    ${count_ViewGroup_Son}==3
            Log    This's Banner.
        END
        IF    ${count_ViewGroup_Son}==5

            ${count}   Get Matching Xpath Count    //androidx.recyclerview.widget.RecyclerView[@resource-id="org.gtv.app:id/feed_list"]/android.view.ViewGroup[${index}]/*[1]/*
            IF    ${count}==1
                Log    This's VideoPlayback.
                Parse VideoPlayback    //androidx.recyclerview.widget.RecyclerView[@resource-id="org.gtv.app:id/feed_list"]/android.view.ViewGroup[${index}]
            END
            IF    ${count}==2
                Log    This's Live.
                Parse Live    //androidx.recyclerview.widget.RecyclerView[@resource-id="org.gtv.app:id/feed_list"]/android.view.ViewGroup[${index}]
            END
        END
        IF    ${count_ViewGroup_Son}==6
            Log    This is Upcoming.
            Parse UpComing    //androidx.recyclerview.widget.RecyclerView[@resource-id="org.gtv.app:id/feed_list"]/android.view.ViewGroup[${index}]
        END
    END
Verify Playback Forward And Backward Function  
    Click Element At Coordinates    100    666
    #Double click on the right side
    ${positionBefore}    Get Text    ${exo_position}    
    Click Element At Coordinates    800    350
    Click Element At Coordinates    800    350
    ${positionBefore}  Calculate Time Add    ${positionBefore}    10  
    ${positionAfter}    Get Text    ${exo_position}
    Should Be Equal As Strings    ${positionBefore}    ${positionAfter}
    Sleep    1
    #Double click on the left side
    ${positionBefore}    Get Text    ${exo_position}    
    Click Element At Coordinates    400    350
    Click Element At Coordinates    400    350
    ${positionBefore}  Calculate Time Sub    ${positionBefore}    10  
    ${positionAfter}    Get Text    ${exo_position}
    Should Be Equal As Strings    ${positionBefore}    ${positionAfter}
Return Parse VideoPlayback
    [Arguments]    ${xml}
    ${title}    Get Text    ${xml}//android.widget.TextView[@resource-id="org.gtv.app:id/title"]
    ${nickname}    Get Text    ${xml}//android.widget.TextView[@resource-id="org.gtv.app:id/nickname"]
    ${desc}    Get Text    ${xml}//android.widget.TextView[@resource-id="org.gtv.app:id/desc"]
    @{list}  Create List   ${title}  ${nickname}  ${desc} 
    [Return]    @{list}
Navigate To Favorites
    Wait Until Page Contains Element    ${Main_Profile}
    Click element    ${Main_Profile}
    Wait Until Page Contains Element    ${MyProfile_History_and_Favorites} 
    Click element    ${MyProfile_History_and_Favorites} 
    Wait Until Page Contains Element    ${MyProfile_Favorites}
    Click element    ${MyProfile_Favorites}
Navigate To Newest Check The First Video info
    Wait Until Page Contains Element    ${Main_Newest_Tab}   
    Click element      ${Main_Newest_Tab}        
    Wait Until Page Contains Element    ${Playback_first_video}
    ${result_Newest}  Return Parse VideoPlayback   ${Playback_first_video}     
    Click element    ${Playback_first_video} 
    Wait Until Page Contains Element    ${Video_Like_Button}
    #Click the time_bar to select a position
    Click Element At Coordinates    100    666
    Wait Until Page Contains Element    ${Playback_notification} 
    Click Element   ${exo_pause} 
    #Check the video info
    ${result_Playback}  Return Parse VideoPlayback   ${Playback_first_video} 
    Lists Should Be Equal    ${result_Newest}    ${result_Playback} 
Verify The Playback Quality Function
    #Click the time_bar to select a position
    Click Element At Coordinates    100    666
    #Call the playback panel to Check the resolution 
    Wait Until Page Contains Element    ${Playback_notification} 
    Click Element    ${Playback_notification}
    Wait Until Page Contains Element    ${quality_hint}
    Click Element     ${quality_hint}
    Wait Until Page Contains Element    ${qualities}    
    ${count}    Get Matching Xpath Count    ${qualities}/*
    FOR    ${index}    IN RANGE     1   ${count} + 1
        ${qualitiesArray}    Get Text    ${qualities}/*[${index}]/*[1]
        Click Element    ${qualities}/*[${index}]
        Click Element At Coordinates    100    666
        Wait Until Page Contains Element    ${Playback_notification} 
        Click Element    ${Playback_notification}
        Wait Until Page Contains Element    ${quality_hint} 
        ${qualitySetting}    Get Text    org.gtv.app:id/quality
        #Page Should Contain Text    ${qualitiesArray}
        ${result}    Two String Equal    ${qualitiesArray}     ${qualitySetting}
         Log    ${result}
        #Should Be Equal   ${qualitiesArray}    ${qualitySetting}
        Click Element     ${quality_hint}
        Wait Until Page Contains Element    ${qualities}        
    END
    Click Element    ${Playback_cancel}
    
Verify The Playback Speed Function
    Click Element At Coordinates    100    666
    Wait Until Page Contains Element    ${Playback_notification} 
    #Call the playback panel to check play speed
    Click Element    ${Playback_notification}
    Wait Until Page Contains Element    ${speed_hint} 
    Click Element     ${speed_hint} 
    Wait Until Page Contains Element    ${qualities}
    #Check the resolution 
    ${count}    Get Matching Xpath Count    ${qualities}/*
        FOR    ${index}    IN RANGE     1   ${count} + 1
        ${qualitiesArray}    Get Text    ${qualities}/*[${index}]/*[1]
        Click Element    ${qualities}/*[${index}]
        Click Element At Coordinates    100    666
        Wait Until Page Contains Element    ${Playback_notification} 
        Click Element    ${Playback_notification}
        Wait Until Page Contains Element    ${speed_hint} 
        ${qualitySetting}    Get Text    org.gtv.app:id/quality
        #Page Should Contain Text    ${qualitiesArray}
        ${result}    Two String Equal    ${qualitiesArray}     ${qualitySetting}
         Log    ${result}
        #Should Be Equal   ${qualitiesArray}    ${qualitySetting}
        Click Element     ${speed_hint}
        Wait Until Page Contains Element    ${qualities}        
    END
    Click Element    ${Playback_cancel}
Verify The Favorites Function
     ${SelectStatus}    Get Element Attribute    ${Playback_video_collect}       selected
    #If this video has been favorited
    IF    '${SelectStatus}' == 'true'
        Click Element    ${Playback_video_collect}
    END
    ${result_Playback}    Return Parse VideoPlayback    ${Playback_first_video} 
    Click Element    ${Playback_video_collect} 
    Go Back
    Wait Until Page Contains Element    ${Video_Playback_close}  
    Click Element    ${Video_Playback_close}      
    #Go to my profile to check if the video has been added 
    Wait Until Page Contains Element    ${Main_Profile}
    Click element    ${Main_Profile}
    Wait Until Page Contains Element    ${MyProfile_History_and_Favorites} 
    Click element    ${MyProfile_History_and_Favorites} 
    Wait Until Page Contains Element    ${MyProfile_Favorites}
    Click element    ${MyProfile_Favorites}
    Wait Until Page Contains Element    ${MyProfile_feed_list}
    Wait Until Page Contains Element    ${Myprofile_favourite_title} 
    ${title}    Get Num Of String    ${result_Playback}[0]    60
    Page Should Contain Text    ${title}
        #Go to the video playback page to remove the video
    Click Element    ${MyProfile_feed_list}/*[1]
    Wait Until Page Contains Element    ${Video_Like_Button}
    Click Element At Coordinates    100    666
    Sleep    1
    Click Element At Coordinates    535    380
    ${SelectStatus}    Get Element Attribute    ${Playback_video_collect}       selected
    #If this video has been favorited
    IF    '${SelectStatus}' == 'true'
        Click Element    ${Playback_video_collect}
    END
    Go Back
    Wait Until Page Contains Element    ${Video_Playback_close}  
    Click Element    ${Video_Playback_close}      
    Navigate To Favorites
    Wait Until Page Contains Element    ${Myprofile_favourite_title}
    Page Should Not Contain Text    ${title}