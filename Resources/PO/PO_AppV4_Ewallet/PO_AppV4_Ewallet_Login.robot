*** Settings ***
Library  AppiumLibrary
Library  Dialogs
#Library  ../../Libraries/String.py

*** Variables ***
${ID_SYSTEM_TEST}                       vn.payoo.demo.debug:id

${ID_Ewallet_Login_Balance}             ${ID_SYSTEM_TEST}/tv_balance
${ID_Ewallet_Login_Balance_Toggle}      ${ID_SYSTEM_TEST}/iv_balance_toggle
${ID_Ewallet_Login_Profile}             ${ID_SYSTEM_TEST}/tv_profile

${ID_Ewallet_Login_Icon_BAccount}       ${ID_SYSTEM_TEST}/iv_card_management

${ID_Ewallet_Login_Deposit}
${ID_Ewallet_Login_Transfer}
${ID_Ewallet_Login_Withdraw}
${ID_Ewallet_Login_QR}

${ID_Ewallet_Login_History}

*** Keywords ***
Click Icon Bank Account
    wait until element is visible       ${ID_Ewallet_Login_Icon_BAccount}
    click element                       ${ID_Ewallet_Login_Icon_BAccount}

Verify Screen Home Ewallet Login
    wait until element is visible       ${ID_Ewallet_Login_Balance}                 timeout=15s



