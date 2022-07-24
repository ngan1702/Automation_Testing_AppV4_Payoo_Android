*** Settings ***
Library  AppiumLibrary
Library  Dialogs
Library  Collections

*** Variables ***
${ID_SYSTEM_TEST}                               vn.payoo.demo.debug:id

${ID_BAccount_ListBank_Header}                  ${ID_SYSTEM_TEST}/tv_header
${ID_BAccount_ListBank_BtnBack}                 xpath=//android.widget.ImageButton[@content-desc="Di chuyển lên"]

${ID_BAccount_ListBank_Search}                  ${ID_SYSTEM_TEST}/et_search
${ID_BAccount_ListBank_ListDomestic}            ${ID_SYSTEM_TEST}/tv_domestic_title
${ID_BAccount_ListBank_ListInternational}       ${ID_SYSTEM_TEST}/tv_international_title
${ID_BAccount_ListBank_BankDomestic}            ${ID_SYSTEM_TEST}/lnl_domestic
${ID_BAccount_ListBank_LogoDomestic}            ${ID_SYSTEM_TEST}/iv_domestic_bank
${ID_BAccount_ListBank_BankInternational}       ${ID_SYSTEM_TEST}/lnl_international
${ID_BAccount_ListBank_LogoInternational}       ${ID_SYSTEM_TEST}/iv_international_bank
${ID_BAccount_ListBank_Bankname}                xpath=//android.widget.TextView[@resource-id='${ID_SYSTEM_TEST}/tv_bank_name']                    #${ID_SYSTEM_TEST}/tv_bank_name

${ID_BAccount_ListBank_BottomSheet}             ${ID_SYSTEM_TEST}/design_bottom_sheet
${ID_BAccount_ListBank_BottomSheet_BtnClose}    ${ID_SYSTEM_TEST}/btn_close
${ID_BAccount_ListBank_BottomSheet_Method}      xpath=//androidx.recyclerview.widget.RecyclerView[@resource-id='${ID_SYSTEM_TEST}/rcv_add_options']//android.widget.TextView[@text='%METHOD%']


#vn.payoo.demo.debug:id/et_search
#
#
#vn.payoo.demo.debug:id/tv_international_title
#
#vn.payoo.demo.debug:id/tv_domestic_title
#
#vn.payoo.demo.debug:id/lnl_international   #android.widget.LinearLayout
#
#vn.payoo.demo.debug:id/iv_international_bank  # logo  android.widget.ImageView
#
#vn.payoo.demo.debug:id/tv_international_bank  #android.widget.TextView


#vn.payoo.demo.debug:id/lnl_domestic
#
#vn.payoo.demo.debug:id/iv_domestic_bank
#
#vn.payoo.demo.debug:id/tv_bank_name
#
#vn.payoo.demo.debug:id/tv_method_title
#
#vn.payoo.demo.debug:id/btn_close


#vn.payoo.demo.debug:id/iv_method
#
#vn.payoo.demo.debug:id/tv_method
#
#vn.payoo.demo.debug:id/iv_arrow_right

*** Keywords ***
Verify List Bank Screen
    wait until element is visible       ${ID_BAccount_ListBank_Search}

Verify Method Bottom Sheet
    wait until element is visible       ${ID_BAccount_ListBank_BottomSheet}

Choose Bank
    [Arguments]   ${bankname}
    click element                       ${ID_BAccount_ListBank_Search}
    input text                          ${ID_BAccount_ListBank_Search}                  ${bankname}
    click element                       ${ID_BAccount_ListBank_Bankname}

Choose Method
    [Arguments]   ${method}
    ${method_name} =     set variable if
    ...  '${method}' == 'card'          Thêm thẻ
    ...  '${method}' == 'link'          Thêm liên kết
    ...  '${method}' == 'account'       Thêm tài khoản

    ${xpath_method} =  replace string   ${ID_BAccount_ListBank_BottomSheet_Method}      %METHOD%        ${method_name}
    click element                       ${xpath_method}

