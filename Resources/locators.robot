*** Variables ***
# Main Page
${Main_Home}                    org.gtv.app:id/navigation_home
${Main_Profile}                 org.gtv.app:id/navigation_mine
${Main_Live_Tab}                //android.widget.TextView[@text="Live"]
${Main_Newest_Tab}              //android.widget.TextView[@text="Newest"]
${Main_Feed_List}               //androidx.recyclerview.widget.RecyclerView[@resource-id="org.gtv.app:id/feed_list"]/android.view.ViewGroup
${Main_Video_Length}            org.gtv.app:id/video_length

# Login Page
${Login_Email_Field}            org.gtv.app:id/account
${Login_Password_Fieled}        org.gtv.app:id/password
${Login_Login_Button}           org.gtv.app:id/sign_in_parent

# Video Playback Page
${Video_Like_Button}            org.gtv.app:id/video_like
${Video_Dislike_Button}         org.gtv.app:id/video_dislike
${Comment_Input_Placeholder}    org.gtv.app:id/comment_input
${Video_AddComment_Field}       org.gtv.app:id/content
${Video_CommentSend_Button}     org.gtv.app:id/send
${Playback_home_channels}       org.gtv.app:id/home_channels
${Playback_video_collect}       org.gtv.app:id/video_collect
${Playback_first_video}                   //androidx.recyclerview.widget.RecyclerView[@resource-id="org.gtv.app:id/feed_list"]/android.view.ViewGroup[${1}]
${exo_pause}                    org.gtv.app:id/exo_pause
${exo_buffering}                org.gtv.app:id/exo_buffering
${exo_play}                     org.gtv.app:id/exo_play
${exo_position}                 org.gtv.app:id/exo_position
${Playback_notification}           org.gtv.app:id/notification
${speed_hint}                   org.gtv.app:id/speed_hint
${quality_hint}                 org.gtv.app:id/quality_hint
${qualities}                    //androidx.recyclerview.widget.RecyclerView[@resource-id="org.gtv.app:id/qualities"]
${Playback_cancel}        org.gtv.app:id/cancel
${Video_Playback_close}                org.gtv.app:id/close

# My Profile Page
${MyProfile_History_and_Favorites}    //android.widget.TextView[@text="History and Favorites"]
${MyProfile_Favorites}    //android.widget.TextView[@text="Favorites"]
${MyProfile_feed_list}    //androidx.recyclerview.widget.RecyclerView[@resource-id="org.gtv.app:id/feed_list"]
${Myprofile_favourite_title}    org.gtv.app:id/tv_item_mine_works_title

