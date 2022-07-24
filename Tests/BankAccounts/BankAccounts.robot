*** Settings ***
Library  AppiumLibrary
Library  Collections
Library  Dialogs
Library  String
Library  DataDriver      file=Tests/BankAccounts/BankAccount.xlsx      sheet_name=Sheet1    encoding=UTF-8

Resource  ../../Resources/common.robot
Resource  ../../Resources/Functions/Func_AppV4_BankAccount/Func_AppV4_BankAccount.robot


Test Setup                  Setup Login Ewallet  ${system_test}  ${device_name}  ${andr_version}  ${skip_install}
Test Teardown               Teardown Delete Bank


*** Variables ***
${ID_SYSTEM_TEST}           vn.payoo.demo.debug:id

${system_test}              demo
${device_name}              AIVI01
${andr_version}             10
${skip_install}             True

${result_addbank}           False


# How to run Script D:\code-auto\gitlab\qc_mobileapp_android_v4\results
# robot -d D:\results\SDK_Payment -i RegressionTest --variable ID_SYSTEM_TEST:vn.payoo.demo.debug:id  Tests/BankAccounts/BankAccounts.robot

# robot -d D:\results\AppV4 -i debug --variable ID_SYSTEM_TEST:vn.payoo.demo.debug:id Tests/BankAccounts/BankAccounts.robot

*** Keywords ***
Setup Login Ewallet
    [Arguments]  ${system_test}  ${device_name}  ${andr_version}  ${skip_install}
    common.Open AppV4 Application           ${system_test}  ${device_name}  ${andr_version}  ${skip_install}
    Func_AppV4_BankAccount.Skip Walkthrought Screen

Teardown Delete Bank
    run keyword if  ${is_add_bank_success}          Func_AppV4_BankAccount.Delete Bank Successfully
    common.End Application

Bank Account Template
    [Arguments]     ${phone_ewallet}	    ${password}	        ${action}	        ${bankname}         ${method}
    ...             ${type_link}	        ${cardnumber}       ${accountnumber}    ${holdername}	    ${issuedate}
    ...             ${expirydate}	        ${idcard}	        ${phone}	        ${email}            ${branch}       ${results}
    Func_AppV4_BankAccount.Login Ewallet Successfully          ${phone_ewallet}        ${password}
    Func_AppV4_BankAccount.Choose And Verify Screen Bank Account
    run keyword if  '${action}' == '${EMPTY}'           Func_AppV4_BankAccount.Verify View List Bank Account
    pass execution if  '${action}' == '${EMPTY}'        View List Bank Accounts
    set suite variable         ${action_suite}      ${action}
    run keyword if  '${action}' == 'add'                Func_AppV4_BankAccount.Add Bank Account             ${bankname}
    ...     ${method}       ${type_link}    ${cardnumber}       ${accountnumber}        ${holdername}	    ${issuedate}
    ...     ${expirydate}	${idcard}	    ${phone}	        ${email}                ${branch}           ${results}
    run keyword if  '${action}' == 'view'               Func_AppV4_BankAccount.View Bank Account       ${method}
    run keyword if  '${action}' == 'edit'               Func_AppV4_BankAccount.Edit Bank Account       ${method}

*** Test Cases ***
Bank Account
    [Tags]  RegressionTest  debug
    [Template]  Bank Account Template


