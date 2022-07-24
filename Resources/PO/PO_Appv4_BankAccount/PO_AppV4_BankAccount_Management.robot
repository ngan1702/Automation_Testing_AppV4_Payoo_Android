*** Settings ***
Library  AppiumLibrary
Library  Dialogs
Library  Collections
Library  String


*** Variables ***
${ID_SYSTEM_TEST}                           vn.payoo.demo.debug:id

${ID_BAccount_Management_Header}            ${ID_SYSTEM_TEST}/tv_header
${ID_BAccount_Management_BtnBack}           xpath=//android.widget.ImageButton[@content-desc="Di chuyển lên"]
${ID_BAccount_Management_Title}             ${ID_SYSTEM_TEST}/tv_title
${ID_BAccount_Management_LogoBank}          ${ID_SYSTEM_TEST}/iv_bank                            #${ID_SYSTEM_TEST}/iv_bank           #xpath=//android.widget.TextView[@resource-id='${ID_SYSTEM_TEST}/iv_bank' and @text='%BANKNAME%']
${ID_BAccount_Management_BankName}          //android.widget.TextView[@resource-id='${ID_SYSTEM_TEST}/tv_bank']          #${ID_SYSTEM_TEST}/tv_bank
${ID_BAccount_Management_Default}           ${ID_SYSTEM_TEST}/tv_default
${ID_BAccount_Management_Info}              xpath=//androidx.recyclerview.widget.RecyclerView[@resource-id='${ID_SYSTEM_TEST}/rcv_bank_account']/android.view.ViewGroup[%COUNT%]/android.widget.TextView[@resource-id='${ID_SYSTEM_TEST}/tv_description']
${ID_BAccount_Management_BtnDetail}         ${ID_SYSTEM_TEST}/iv_arrow

${ID_BAccount_Management_BtnAdd}            ${ID_SYSTEM_TEST}/view_add

${ID_BAccount_Management_Toast}             xpath=//android.widget.Toast

*** Keywords ***
Click Button Add Card/Account
    click element                           ${ID_BAccount_Management_BtnAdd}

Click Bank Detail
    [Arguments]  ${number}
    ${xpath_bank} =         replace string          ${ID_BAccount_Management_Info}      %COUNT%     ${number}
    click element           ${xpath_bank}

Verify Screen Bank Account
    wait until element is visible           ${ID_BAccount_Management_BtnAdd}

Get Count Bank
    ${count} =  get matching xpath count    ${ID_BAccount_Management_BankName}
    [Return]    ${count}

Get Bank Detail
    [Arguments]  ${number}
    ${xpath_bank} =         replace string          ${ID_BAccount_Management_Info}      %COUNT%     ${number}
    ${detail_bank} =        get text                ${xpath_bank}
    [Return]    ${detail_bank}

Verify Add Bank Successfully
    [Arguments]  ${result}
    #wait until element is visible                   ${ID_BAccount_Management_BtnAdd}
    page should contain text                ${result}               timeout=10s





