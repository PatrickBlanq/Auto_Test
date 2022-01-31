*** Settings ***
Library    AppiumLibrary
Library    BuiltIn
Resource    ../Resources/data.robot
Resource    ../Resources/locators.robot
Resource    ../Resources/resource.robot
*** Variables ***
${Video_Pa}                     org.gtv.app:id/user_avatar
#org.gtv.app:id/title       (live schedule videoplayback)
#org.gtv.app:id/nickname    (author)
#org.gtv.app:id/start_time  (schedule)
#org.gtv.app:id/desc
${banners}    org.gtv.app:id/banners
${Schedule}
#org.gtv.app:id/cover_group
#org.gtv.app:id/live_tag
#android.widget.TextView    UPCOMING
#org.gtv.app:id/title       -01/23 23:02; android schedule live
#android.widget.TextView    -zhengyi62_android_喜
#org.gtv.app:id/start_time  -Scheduled for 2022-02-02 12:11:00
${Live}
#org.gtv.app:id/cover_group
#org.gtv.app:id/live_tag
#android.widget.TextView        LIVE
#org.gtv.app:id/title           -test
#org.gtv.app:id/nickname        -火烧擀面杖Android/web
#org.gtv.app:id/desc            - · 0 watching · 56 seconds ago
${VideoPlayback}    androidx.recyclerview.widget.RecyclerView@org.gtv.app:id/feed_list/android.view.ViewGroup[0]/android.widget.FrameLayout
#org.gtv.app:id/cover_group
#org.gtv.app:id/video_left_time_group
#org.gtv.app:id/video_length    0:10
#org.gtv.app:id/title           Who is Miles Guo Episode 1 谁是郭文贵第一集;The story about the Terminator of CCP ;中国共产党终结者的故事
#org.gtv.app:id/nickname        zhengyi63-web-普通
#org.gtv.app:id/desc             · 1.38K views · 17 days ago
${VideoPlayback}
#org.gtv.app:id/cover_group
#org.gtv.app:id/video_left_time_group
#org.gtv.app:id/video_length    0:10
#org.gtv.app:id/title           Who is Miles Guo Episode 1 谁是郭文贵第一集;The story about the Terminator of CCP ;中国共产党终结者的故事
#org.gtv.app:id/nickname        zhengyi63-web-普通
#org.gtv.app:id/desc             · 1.38K views · 17 days ago
#@{Feed-List}        //androidx.recyclerview.widget.RecyclerView[@resource-id="org.gtv.app:id/feed_list"]
#${count}    Get Matching Xpath Count    //androidx.recyclerview.widget.RecyclerView[@resource-id="org.gtv.app:id/feed_list"]/android.view.ViewGroup
#${count}    Get Matching Xpath Count    //android.widget.ImageView
#${Feed-List}    //androidx.recyclerview.widget.RecyclerView[@resource-id="org.gtv.app:id/feed_list"]/android.view.ViewGroup
*** Keywords ***
*** Test Cases ***
Test Home Page
Launch the GTV application
    Launch Applacation
Get Elements
    Wait Until Page Contains Element    ${Main_Feed_List}
    Get Video List Structure    ${Main_Feed_List}
    Capture Page Screenshot     HomePage.png
    Wait Until Page Contains Element    ${Main_Live_Tab}
    Click Element    ${Main_Live_Tab}