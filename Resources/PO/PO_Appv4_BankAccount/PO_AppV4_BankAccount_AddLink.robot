*** Settings ***
Library  AppiumLibrary
Library  Dialogs

*** Variables ***
${ID_SYSTEM_TEST}                           vn.payoo.demo.debug:id

${ID_BAccount_AddLink_Header}               ${ID_SYSTEM_TEST}/tv_header
${ID_BAccount_AddLink_BtnBack}              xpath=//android.widget.ImageButton[@content-desc="Di chuyển lên"]
${ID_BAccount_AddLink_Cardnumber}           ${ID_SYSTEM_TEST}/et_cardNumber
${ID_BAccount_AddLink_Cardholdername}       xpath=//android.widget.LinearLayout[@resource-id='vn.payoo.demo.debug:id/layout_card_holder_name']//android.widget.EditText
${ID_BAccount_AddLink_Issuedate}            xpath=//android.widget.LinearLayout[@resource-id='vn.payoo.demo.debug:id/layout_card_issue_date']//android.widget.EditText


*** Keywords ***
Input ID card
    [Arguments]  ${idcard}
    input text                              ${ID_BAccount_AddLink_Issuedate}             ${idcard}

Input Phone
    [Arguments]  ${phone}
    input text                              ${ID_BAccount_AddLink_Issuedate}             ${phone}

Input Email
    [Arguments]  ${email}
    input text                              ${ID_BAccount_AddLink_Issuedate}             ${email}

Verify Add Card Screen
    wait until element is visible           ${ID_BAccount_AddCard_Cardnumber}               timeout=10s

