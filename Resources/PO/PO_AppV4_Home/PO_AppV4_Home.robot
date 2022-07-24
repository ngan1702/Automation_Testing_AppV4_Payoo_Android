*** Settings ***
Library  AppiumLibrary
#Library  ../../Libraries/String.py
Library  Dialogs

*** Variables ***
${ID_SYSTEM_TEST}                       vn.payoo.demo.debug:id

${ID_Home_Banner}                       ${ID_SYSTEM_TEST}/imageview_home_banner

${ID_Home_BtnRegister}                  ${ID_SYSTEM_TEST}/textview_signup
${ID_Home_BtnLogin}                     ${ID_SYSTEM_TEST}/textview_signup

${ID_Home_Search}                       ${ID_SYSTEM_TEST}/search_view_home
${ID_Home_Ewallet_NoLogin}              ${ID_SYSTEM_TEST}/view_ewallet

${ID_Home_Ewallet_Balance}              ${ID_SYSTEM_TEST}/textview_balance

*** Keywords ***
Click Button Login
    wait until element is visible       ${ID_Home_BtnLogin}
    click element                       ${ID_Home_BtnLogin}

Click Button Register
    wait until element is visible       ${ID_Home_BtnRegister}
    click element                       ${ID_Home_BtnRegister}

Verify Screen Home No Login
    wait until element is visible       ${ID_Home_BtnRegister}                       timeout=10s

Verify Screen Home Login
    wait until element is visible       ${ID_Home_Ewallet_Balance}                   timeout=10s