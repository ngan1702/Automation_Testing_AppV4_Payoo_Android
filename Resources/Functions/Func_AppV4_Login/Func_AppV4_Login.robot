*** Settings ***
Library   AppiumLibrary
Library   Dialogs
Resource  ../../PO/PO_AppV4_BottomNavigation.robot
Resource  ../../PO/PO_AppV4_Walkthrought.robot
Resource  ../../PO/PO_AppV4_Home/PO_AppV4_Home.robot
Resource  ../../PO/PO_AppV4_Ewallet/PO_AppV4_Ewallet_NoLogin.robot
Resource  ../../PO/PO_AppV4_Ewallet/PO_AppV4_Ewallet_Login.robot
Resource  ../../PO/PO_AppV4_Login/PO_AppV4_Login.robot
Resource  ../../PO/PO_AppV4_Account/PO_AppV4_Account.robot
Resource  ../../PO/PO_AppV4_BankAccount/PO_AppV4_BankAccount_AddAccount.robot
Resource  ../../PO/PO_AppV4_BankAccount/PO_AppV4_BankAccount_AddBankInfo.robot
Resource  ../../PO/PO_AppV4_BankAccount/PO_AppV4_BankAccount_AddCard.robot
Resource  ../../PO/PO_AppV4_BankAccount/PO_AppV4_BankAccount_AddLink.robot
Resource  ../../PO/PO_AppV4_BankAccount/PO_AppV4_BankAccount_ListBank.robot
Resource  ../../PO/PO_AppV4_BankAccount/PO_AppV4_BankAccount_Management.robot
Resource  ../../PO/PO_AppV4_BankAccount/PO_AppV4_BankAccount_ViewBank.robot
Resource  ../Func_AppV4_Account/Func_AppV4_Account.robot
*** Variables ***

*** Keywords ***
Open Screen Login From Home
    PO_AppV4_Home.Verify Screen Home No Login
    PO_AppV4_BottomNavigation.Click Tab Ewallet Payoo
    PO_AppV4_Ewallet_NoLogin.Click Button Login

Logout Ewallet And Open Screen Login
    PO_AppV4_BottomNavigation.Click Tab Account
    PO_AppV4_Account.Click Button Logout
    PO_AppV4_Account.Click Popup Right Button

    # Hành xử khi app Android gọi getuserprofile (bug)
    ${is_popup_error} =     run keyword and return status           PO_AppV4_Account.Verify Popup Error
    run keyword if          ${is_popup_error}                       PO_AppV4_Account.Click Popup Close Buton

    PO_AppV4_BottomNavigation.Click Tab Ewallet Payoo
    PO_AppV4_Ewallet_NoLogin.Click Button Login
    
Verify notification when disable button
    element should be disabled   ${ID_Login_btnLogin}

Verify notification when red text
    [Arguments]   ${ERROR}
    page should contain text  ${ERROR}
    element should be disabled   ${ID_Login_btnLogin}

Verify notification when popup
    [Arguments]   ${ERROR}
    pO_AppV4_Login.Click Button Login
    Verify Popup Error
    element should contain text  ${ID_Account_Popup_Error}  ${ERROR}

Input user info
   [Arguments]  ${name}     ${VALUE}
    click element   ${name}
    input text    ${name}     ${VALUE}

Input info
    [Arguments]    ${USERNAME}	${PASSWORD}
    input user info  ${ID_Login_Username}     ${USERNAME}
    run keyword if  '${USERNAME}' == None                 sleep  5s

    input user info  ${ID_Login_Password}     ${PASSWORD}

Login from account
    [Arguments]    ${USERNAME}	${PASSWORD}	    ${ERROR}
   Input info  ${USERNAME} 	${PASSWORD}
   pO_AppV4_Login.Click Button Login
   sleep  10s
   Verify notification when login success   ${USERNAME}     ${ERROR}

Login from home
    [Arguments]    ${USERNAME}	${PASSWORD}	    ${ERROR}
   click button  ${ID_Navigation_Item_Home}
   sleep  8s
   Open Screen Login From Home

   Verify Screen Input 
   clear text  ${ID_Login_Username}

   Input info  ${USERNAME} 	${PASSWORD}
   pO_AppV4_Login.Click Button Login
   sleep  10s
   Verify Screen Home Ewallet Login
   Click Tab Account

   Verify notification when login success   ${USERNAME}     ${ERROR}

Login from eWallet
    [Arguments]    ${USERNAME}	${PASSWORD}	    ${ERROR}
   Click Tab Ewallet Payoo
   Verify Screen Press Login
   Click Button            ${ID_Ewallet_NoLogin_BtnLogin}

   Verify Screen input
   clear text  ${ID_Login_Username}

   Input info  ${USERNAME} 	${PASSWORD}
   pO_AppV4_Login.Click Button Login
   Verify Screen Home Ewallet Login
   Click Tab Account
   Verify notification when login success   ${USERNAME}     ${ERROR}

Login by phone number
    [Arguments]    ${USERNAME}	${PASSWORD}	    ${ERROR}
    pO_AppV4_Login.Click Button Login
    Verify Screen Home Login
    Click Tab Account
    Verify notification when login success   ${USERNAME}     ${ERROR}
    Logout from tab account

Login by username
    [Arguments]    ${USERNAME}	${PASSWORD}	    ${ERROR}
    pO_AppV4_Login.Click Button Login
    Verify Screen Home Login
    Click Tab Account
    Verify notification when login success   ${USERNAME}     ${ERROR}
    Logout from tab account    

Input temporarily locked info
    [Arguments]    ${USERNAME}	${PASSWORD}
    FOR    ${i}    IN RANGE    3
       Verify Screen input
        pO_AppV4_Login.Click Button Login
        Verify Popup Error
        Click Popup Close Buton Error Message
    END
