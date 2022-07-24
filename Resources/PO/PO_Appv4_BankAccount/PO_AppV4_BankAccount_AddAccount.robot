*** Settings ***
Library  AppiumLibrary
Library  Dialogs
Library  Collections

*** Variables ***
${ID_SYSTEM_TEST}                               vn.payoo.demo.debug:id

${ID_BAccount_AddAccount_Header}                ${ID_SYSTEM_TEST}/tv_header
${ID_BAccount_AddAccount_BtnBack}               xpath=//android.widget.ImageButton[@content-desc="Di chuyển lên"]

${ID_BAccount_AddAccount_Accountnumber}         ${ID_SYSTEM_TEST}/et_cardNumber
${ID_BAccount_AddAccount_Holdername}            xpath=//android.widget.LinearLayout[@resource-id='vn.payoo.demo.debug:id/layout_account_owner']//android.widget.EditText
${ID_BAccount_AddAccount_Branch}                xpath=//android.widget.LinearLayout[@resource-id='vn.payoo.demo.debug:id/layout_account_branch']//android.widget.EditText
${ID_BAccount_AddAccount_BtnConfirm}            ${ID_SYSTEM_TEST}/btn_confirmAccount

${ID_BAccount_AddAccount_BottomSheet}           ${ID_SYSTEM_TEST}/design_bottom_sheet

*** Keywords ***
Click Button Confirm
    click element                               ${ID_BAccount_AddAccount_BtnConfirm}

Input Account Number
    [Arguments]  ${accountnumber}
    input text                                  ${ID_BAccount_AddAccount_Accountnumber}            ${accountnumber}

Input Account Holder Name
    [Arguments]  ${holdername}
    clear text                                  ${ID_BAccount_AddAccount_Holdername}
    input text                                  ${ID_BAccount_AddAccount_Holdername}                ${holdername}

Input Branch
    [Arguments]  ${branch}
    input text                                  ${ID_BAccount_AddAccount_Branch}                    ${branch}

Verify OTP Bottom Sheet
    wait until element is visible               ${ID_BAccount_AddAccount_BottomSheet}               timeout=15s

Verify Add Account Screen
    wait until element is visible               ${ID_BAccount_AddAccount_Accountnumber}             timeout=10s
