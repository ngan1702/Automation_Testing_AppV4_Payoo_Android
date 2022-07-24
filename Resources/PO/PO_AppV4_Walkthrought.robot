*** Settings ***
Library  AppiumLibrary
#Library  ../../Libraries/String.py
Library  Dialogs

*** Variables ***
${ID_SYSTEM_TEST}                       vn.payoo.demo.debug:id

${ID_Walkthrought_Bypass}               ${ID_SYSTEM_TEST}/textview_action
${ID_Walkthrought_Image}                ${ID_SYSTEM_TEST}/imageview_introduction

*** Keywords ***
Verify Display Btn By Pass
    ${status} =  run keyword and return status   wait until page contains element     ${ID_Walkthrought_Bypass}     timeout=5s
    [Return]   ${status}

Click Btn By Pass
    wait until page contains element     ${ID_Walkthrought_Bypass}
    click element        ${ID_Walkthrought_Bypass}
