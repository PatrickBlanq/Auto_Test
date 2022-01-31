*** Variables ***
# ServerConnection
${Server}               http://localhost:7777/wd/hub
${PlatformName}         Android
${PlatformVersion}      8.1.0
${DeviceName}           Test
${AppPackage}           org.gtv.app
#${AppPackage}           com.android.calculator2
${AppActivity}          org.gtv.newapp.ui.MainActivity
#${AppActivity}          com.android.calculator2.view.BaseActivity

# UserData
&{Dict_User_Valid}      email=patrick@gmail.com     password=Test0604
&{Dict_User_Inalid}     email=Invalid@gmail.com     password=Test0604

# CommentData
&{Dict_Comment_Text}    first=This is my first comment.      second=This is my second comment.
