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

*** Variables ***
@{data_list_bank}   TK Liên kết 9704 03** **** 2812     Thẻ 9704 03** **** 4512    Tài khoản 5554444666

@{list_bank}

&{keycode}    0=7    1=8     2=9     3=10    4=11    5=12    6=13    7=14    8=15    9=16

${is_add_bank_success}          False

*** Keywords ***
### Precondition ###
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

    PO_AppV4_Account.Click Link Login

Login Ewallet Successfully
    [Arguments]  ${phone}  ${pwd}
    ${is_screenlogin} =  run keyword and return status      PO_AppV4_Login.Verify Screen Login
    ${is_home_logined} =  run keyword and return status     PO_AppV4_Home.Verify Screen Home Login

    run keyword if      ${is_screenlogin} != True and ${is_home_logined} != True       Func_AppV4_BankAccount.Open Screen Login From Home
    run keyword if      ${is_screenlogin} != True and ${is_home_logined} == True       Func_AppV4_BankAccount.Logout Ewallet And Open Screen Login

    PO_AppV4_Login.Enter Username                       ${phone}
    PO_AppV4_Login.Enter Password                       ${pwd}
    PO_AppV4_Login.Click Button Login

    # Successfully
    PO_AppV4_BottomNavigation.Click Tab Ewallet Payoo
    PO_AppV4_Ewallet_Login.Verify Screen Home Ewallet Login

Logout Ewallet Successfully
    PO_AppV4_BottomNavigation.Click Tab Account
    #PO_AppV4_Account.Verify Screen Account
    PO_AppV4_Account.Click Button Logout
    PO_AppV4_Account.Click Popup Right Button

    # Successfully
    PO_AppV4_Account.Verify Screen Account No Login

Skip Walkthrought Screen
    ${status} =  PO_AppV4_Walkthrought.Verify Display Btn By Pass
    run keyword if  ${status}       PO_AppV4_Walkthrought.Click Btn By Pass

Choose And Verify Screen Bank Account
    PO_AppV4_Ewallet_Login.Click Icon Bank Account
    PO_AppV4_BankAccount_Management.Verify Screen Bank Account

Add Bank Account
    [Arguments]     ${bankname}         ${method}       ${type_link}    ${cardnumber}       ${accountnumber}
    ...             ${holdername}	    ${issuedate}    ${expirydate}   ${idcard}	        ${phone}
    ...             ${email}            ${branch}       ${results}
    PO_AppV4_BankAccount_Management.Click Button Add Card/Account

    PO_AppV4_BankAccount_ListBank.Verify List Bank Screen
    PO_AppV4_BankAccount_ListBank.Choose Bank           ${bankname}
    Func_AppV4_BankAccount.Choose Method Bank           ${method}

    PO_AppV4_BankAccount_AddBankInfo.Verify Bank Info Screen
    PO_AppV4_BankAccount_AddBankInfo.Click Button Confirm

    run keyword if  '${method}' == 'card'       Func_AppV4_BankAccount.Add Card         ${cardnumber}       ${holdername}       ${issuedate}    ${expirydate}

    run keyword if  '${method}' == 'account'    Func_AppV4_BankAccount.Add Account      ${accountnumber}    ${holdername}       ${branch}

    run keyword if  '${method}' == 'link'       Func_AppV4_BankAccount.Add Link         ${type_link}        ${cardnumber}       ${accountnumber}
    ...  ${holdername}	    ${issuedate}        ${expirydate}       ${idcard}	        ${phone}            ${email}

    # Add Successfully
    PO_AppV4_BankAccount_Management.Verify Add Bank Successfully       ${results}
    set suite variable          ${is_add_bank_success}      True


Add Card
    [Arguments]     ${cardnumber}       ${holdername}	    ${issuedate}    ${expirydate}
    PO_AppV4_BankAccount_AddCard.Verify Add Card Screen
    run keyword if   '${cardnumber}' != '${EMPTY}'      PO_AppV4_BankAccount_AddCard.Input Card Number          ${cardnumber}
    run keyword if   '${holdername}' != '${EMPTY}'      PO_AppV4_BankAccount_AddCard.Input Card Holder Name     ${holdername}
    run keyword if   '${issuedate}' != '${EMPTY}'       PO_AppV4_BankAccount_AddCard.Input Card Issue Date      ${issuedate}
    run keyword if   '${expirydate}' != '${EMPTY}'      PO_AppV4_BankAccount_AddCard.Input Card Expiry Date     ${expirydate}

    PO_AppV4_BankAccount_AddCard.Click Button Confirm

    PO_AppV4_BankAccount_AddCard.Verify OTP Bottom Sheet
    Func_AppV4_BankAccount.Enter OTP

Add Account
    [Arguments]     ${accountnumber}    ${holdername}       ${branch}
    PO_AppV4_BankAccount_AddAccount.Verify Add Account Screen
    run keyword if   '${accountnumber}' != '${EMPTY}'   PO_AppV4_BankAccount_AddAccount.Input Account Number           ${accountnumber}
    run keyword if   '${holdername}' != '${EMPTY}'      PO_AppV4_BankAccount_AddAccount.Input Account Holder Name      ${holdername}
    run keyword if   '${branch}' != '${EMPTY}'          PO_AppV4_BankAccount_AddAccount.Input Branch                   ${branch}

    PO_AppV4_BankAccount_AddAccount.Click Button Confirm

    PO_AppV4_BankAccount_AddAccount.Verify OTP Bottom Sheet
    Func_AppV4_BankAccount.Enter OTP

Add Link
    [Arguments]     ${type_link}        ${cardnumber}       ${accountnumber}    ${holdername}	    ${issuedate}
    ...             ${expirydate}       ${idcard}	        ${phone}            ${email}
    PO_AppV4_BankAccount_AddCard.Verify Add Card Screen


    run keyword if   '${cardnumber}' != '${EMPTY}'      PO_AppV4_BankAccount_AddCard.Input Card Number          ${cardnumber}
    run keyword if   '${holdername}' != '${EMPTY}'      PO_AppV4_BankAccount_AddCard.Input Card Holder Name     ${holdername}
    run keyword if   '${issuedate}' != '${EMPTY}'       PO_AppV4_BankAccount_AddCard.Input Card Issue Date      ${issuedate}
    run keyword if   '${expirydate}' != '${EMPTY}'      PO_AppV4_BankAccount_AddCard.Input Card Expiry Date     ${expirydate}

    PO_AppV4_BankAccount_AddCard.Click Button Confirm

    PO_AppV4_BankAccount_AddCard.Verify OTP Bottom Sheet
    Func_AppV4_BankAccount.Enter OTP

Choose Method Bank
    [Arguments]  ${method}
    ${is_bottom_sheet} =    run keyword and return status   PO_AppV4_BankAccount_ListBank.Verify Method Bottom Sheet
    run keyword if          ${is_bottom_sheet}              PO_AppV4_BankAccount_ListBank.Choose Method                     ${method}

Edit Bank Account
    [Arguments]     ${method}

View Bank Account
    [Arguments]     ${method}

Delete Bank Successfully
    # Đối phó lỗi
    run keyword and return status       PO_AppV4_Ewallet_Login.Click Icon Bank Account
    PO_AppV4_BankAccount_Management.Verify Screen Bank Account

    # Thẻ đầu tiên
    ${count} =                  PO_AppV4_BankAccount_Management.Get Count Bank
    PO_AppV4_BankAccount_Management.Click Bank Detail           ${count}
    # Xóa bank
    PO_AppV4_BankAccount_ViewBank.Verify Screen Bank Detail
    PO_AppV4_BankAccount_ViewBank.Click Button Remove
    PO_AppV4_BankAccount_ViewBank.Click Button Confirm Delete
    ### Mã PIN      888888
    Func_AppV4_BankAccount.Enter PIN
    # Quay về màn hình Bank Account
    PO_AppV4_BankAccount_Management.Verify Screen Bank Account



Verify View List Bank Account
    ${count} =                  PO_AppV4_BankAccount_Management.Get Count Bank
    # Get List Bank Account
    FOR  ${i}  IN RANGE  1  ${count}+1
        ${i} =                  convert to string       ${i}
        ${detail_bank}=         PO_AppV4_BankAccount_Management.Get Bank Detail             ${i}
        append to list          ${list_bank}            ${detail_bank}
    END
    # Check có đúng List Bank đã có
    FOR  ${i}  IN RANGE  1  ${count}
        should be equal as strings      ${list_bank}[${i}]         ${data_list_bank}[${i}]
    END


Enter OTP
    [Arguments]  ${text}=123456
    @{list} =                                       convert to list  ${text}
    ${number} =                                     get length       ${list}
    FOR  ${INDEX}  IN RANGE  0  ${number}
        ${tmp_text} =                               set variable  ${list}[${INDEX}]
        press keycode                               ${keycode}[${tmp_text}]
    END
    hide keyboard

Enter PIN
    [Arguments]  ${text}=888888
    @{list} =                                       convert to list  ${text}
    ${number} =                                     get length       ${list}
    PO_AppV4_BankAccount_ViewBank.Verify Bottom Sheet Enter PIN
    FOR  ${INDEX}  IN RANGE  0  ${number}
        ${tmp_text} =                               set variable  ${list}[${INDEX}]
        PO_AppV4_BankAccount_ViewBank.Enter Keycode                  ${tmp_text}
    END
    hide keyboard


