*** Settings ***
Library  AppiumLibrary
Library  Dialogs
Library  Collections

*** Variables ***
${ID_SYSTEM_TEST}                           vn.payoo.demo.debug:id

${ID_BAccount_AddCard_Header}               ${ID_SYSTEM_TEST}/tv_header
${ID_BAccount_AddCard_BtnBack}              xpath=//android.widget.ImageButton[@content-desc="Di chuyển lên"]

${ID_BAccount_AddCard_Cardnumber}           ${ID_SYSTEM_TEST}/et_cardNumber
${ID_BAccount_AddCard_Cardholdername}       xpath=//android.widget.LinearLayout[@resource-id='vn.payoo.demo.debug:id/layout_card_holder_name']//android.widget.EditText
${ID_BAccount_AddCard_Issuedate}            xpath=//android.widget.LinearLayout[@resource-id='vn.payoo.demo.debug:id/layout_card_issue_date']//android.widget.EditText
${ID_BAccount_AddCard_Expirydate}           xpath=//android.widget.LinearLayout[@resource-id='vn.payoo.demo.debug:id/layout_card_valid_date']//android.widget.EditText
${ID_BAccount_AddCard_BtnConfirm}           ${ID_SYSTEM_TEST}/btn_confirmCard

${ID_BAccount_AddCard_BottomSheet}          ${ID_SYSTEM_TEST}/design_bottom_sheet

*** Keywords ***
Click Button Confirm
    click element                           ${ID_BAccount_AddCard_BtnConfirm}

Input Card Number
    [Arguments]  ${cardnumber}
    input text                              ${ID_BAccount_AddCard_Cardnumber}            ${cardnumber}

Input Card Holder Name
    [Arguments]  ${holdername}
    clear text                              ${ID_BAccount_AddCard_Cardholdername}
    input text                              ${ID_BAccount_AddCard_Cardholdername}        ${holdername}

Input Card Issue Date
    [Arguments]  ${issuedate}
    input text                              ${ID_BAccount_AddCard_Issuedate}             ${issuedate}

Input Card Expiry Date
    [Arguments]  ${expirydate}
    input text                              ${ID_BAccount_AddCard_Expirydate}             ${expirydate}

Verify Add Card Screen
    wait until element is visible           ${ID_BAccount_AddCard_Cardnumber}               timeout=10s

Verify OTP Bottom Sheet
    wait until element is visible           ${ID_BAccount_AddCard_BottomSheet}              timeout=15s

