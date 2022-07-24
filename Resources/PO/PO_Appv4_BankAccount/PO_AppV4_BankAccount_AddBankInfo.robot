*** Settings ***
Library  AppiumLibrary
Library  Dialogs

*** Variables ***
${ID_SYSTEM_TEST}                           vn.payoo.demo.debug:id

${ID_BAccount_BankInfo_Header}              ${ID_SYSTEM_TEST}/tv_header
${ID_BAccount_BankInfo_BtnBack}             xpath=//android.widget.ImageButton[@content-desc="Di chuyển lên"]

${ID_BAccount_BankInfo_Logo}                ${ID_SYSTEM_TEST}/iv_bank_logo
${ID_BAccount_BankInfo_Notice}              ${ID_SYSTEM_TEST}/tv_notice
${ID_BAccount_BankInfo_Description}         ${ID_SYSTEM_TEST}/tv_description

${ID_BAccount_BankInfo_BtnConfirm}          ${ID_SYSTEM_TEST}/btn_confirm

*** Keywords ***
Click Button Confirm
    click element                           ${ID_BAccount_BankInfo_BtnConfirm}

Get Description Add Bank
    ${desc} =       get text                ${ID_BAccount_BankInfo_Description}
    [Return]  ${desc}

Verify Bank Info Screen
    wait until element is visible           ${ID_BAccount_BankInfo_BtnConfirm}
