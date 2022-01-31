*** Settings ***
Library  AppiumLibrary
Library  BuiltIn
Resource    ../Resources/data.robot
Resource    ../Resources/locators.robot
Resource    ../Resources/resource.robot
*** Variables ***
#@{Top-Tab}          //android.support.v4.view.ViewPager[@index="1"]
#@{Top-Tab}          //android.support.v4.view.ViewPager[@resource-id="com.android.calculator2:id/panelswitch"]
#@{Top-Tab}          //android.support.v4.view.ViewPager//android.widget.LinearLayout[@resource-id="com.android.calculator2:id/simplePad"]
#@{Top-Tab}          //android.widget.LinearLayout[@resource-id="com.android.calculator2:id/simplePad"]

@{Top-Tab}          //android.widget.LinearLayout[@resource-id="com.android.calculator2:id/simplePad"]//android.widget.LinearLayout[1]//android.widget.Button

*** Keywords ***

*** Test Cases ***
Test 360 Calculater
    Launch Applacation
    wait until page contains element    id=com.android.calculator2:id/digit9
    ${count} =	Get Matching Xpath Count	@{Top-Tab}
    Log Many    @{Top-Tab}[0]
    FOR    ${animal}    IN    @{Top-Tab}
        Log    ${animal}

    END
