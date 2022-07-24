*** Settings ***
Library  AppiumLibrary
Library  Dialogs
#Library  ../../Libraries/String.py

*** Variables ***
${ID_SYSTEM_TEST}                       vn.payoo.demo.debug:id

${ID_Ewallet_NoLogin_BtnLogin}          ${ID_SYSTEM_TEST}/button_login
${ID_Ewallet_NoLogin_Image_Guest}          ${ID_SYSTEM_TEST}/imageview_guest_login
${ID_Ewallet_NoLogin_BtnRegister}       ${ID_SYSTEM_TEST}/button_signup
${ID_Ewallet_NoLogin_Intro}             ${ID_SYSTEM_TEST}/textview_intro
${ID_Ewallet_NoLogin_AboutUs}           ${ID_SYSTEM_TEST}/textview_about_us

*** Keywords ***
#AIVI
Click Button Login
    wait until element is visible       ${ID_Ewallet_NoLogin_BtnLogin}          timeout=10s
    click element                       ${ID_Ewallet_NoLogin_BtnLogin}

Click Button Register
    wait until element is visible       ${ID_Ewallet_NoLogin_BtnRegister}
    click element                       ${ID_Ewallet_NoLogin_BtnRegister}

Get Description Intro
    wait until element is visible       ${ID_Ewallet_NoLogin_Intro}
    ${intro} =  get text                ${ID_Ewallet_NoLogin_Intro}
    [Return]  ${intro}

Get Description About Us
    wait until element is visible       ${ID_Ewallet_NoLogin_AboutUs}
    ${aboutus} =  get text              ${ID_Ewallet_NoLogin_AboutUs}
    [Return]  ${aboutus}

Verify Screen Press Login
    wait until element is visible       ${ID_Ewallet_NoLogin_Image_Guest}            timeout=3s