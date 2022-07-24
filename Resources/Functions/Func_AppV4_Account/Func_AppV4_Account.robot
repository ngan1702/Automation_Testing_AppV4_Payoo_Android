*** Settings ***
Library   AppiumLibrary
Library   Dialogs
Resource  ../../PO/PO_AppV4_BottomNavigation.robot
Resource  ../../PO/PO_AppV4_Account/PO_AppV4_Account.robot

*** Variables ***

*** Keywords ***
Logout from tab account
    swipe by percent  50    50  50  80
    Click Button Logout

    # Bạn chắc chắn muốn đăng xuất?
    Verify Popup Error
    Click Popup Close Buton

    sleep  5s
    Verify Screen Account No Login

Verify notification when login success
    [Arguments]   ${USERNAME}       ${ERROR}
    element should contain text  ${ID_Account_Login_Name}   ${ERROR}
    element should contain text  ${ID_Account_Login_Phone}   ${USERNAME}


