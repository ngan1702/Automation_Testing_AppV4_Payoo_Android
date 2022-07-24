*** Settings ***
###### Common Resources #############
Library  AppiumLibrary
Library     DataDriver      file=Tests/Login/LoginTestCase.xlsx   sheet_name=Sheet1    encoding=UTF-8

Resource  ../../Resources/Functions/Func_AppV4_Login/Func_AppV4_Login.robot
Resource  ../../Resources/common.robot
Resource  ../../Resources/Functions/Func_AppV4_BankAccount/Func_AppV4_BankAccount.robot

Test Template       Login Template
Suite Setup         Begin Test
#Test Teardown       End Test

*** Variables ***
${ID_SYSTEM_TEST}           vn.payoo.demo.debug:id

${system_test}              demo
${device_name}              AIVI01
${andr_version}             10
${skip_install}             True

# python -m robot -d D:\code-auto\gitlab\qc_mobileapp_android_v4\results -i debug Tests/Login/Login.robot
*** Test Cases ***
Test Login
   [Tags]  debug
   [Template]  Login Template


*** Keywords ***
Login Template
    [Arguments]    ${USERNAME}	${PASSWORD}	${TYPE}	${STATUS}	${ERROR}
    ${status} =  run keyword and return status  page should contain element   ${ID_Account_Popup_Error}
    run keyword if  ${status}      Click Popup Close Buton Error Message

    run keyword if  '${TEST_NAME}'=='eWallet is temporarily locked'     Input temporarily locked info       ${USERNAME}	${PASSWORD}

    Input info  ${USERNAME} 	${PASSWORD}

    run keyword if  '${TYPE}' == 'red text'                     Verify notification when red text       ${ERROR}
    run keyword if  '${TYPE}' == 'popup'                        Verify notification when popup       ${ERROR}
    run keyword if  '${TYPE}' == 'disable button'               Verify notification when disable button
    run keyword if  '${TEST_NAME}'=='login by phone number'     Login by phone number   ${USERNAME}	${PASSWORD}	    ${ERROR}
    run keyword if  '${TEST_NAME}'=='login by username'         Login by username   ${USERNAME}	${PASSWORD}	    ${ERROR}
Setup Login Ewallet
    [Arguments]  ${system_test}  ${device_name}  ${andr_version}  ${skip_install}
    common.Open AppV4 Application           ${system_test}  ${device_name}  ${andr_version}  ${skip_install}
    Skip Walkthrought Screen

Begin Test
    common.Open AppV4 Application           ${system_test}  ${device_name}  ${andr_version}  ${skip_install}
    # open when first install app
   Skip Walkthrought Screen

    # ${is_screenlogin} =  run keyword and return status      PO_AppV4_Login.Verify Screen Login
    ${is_home_logined} =  run keyword and return status     PO_AppV4_Home.Verify Screen Home Login

    # run keyword if      ${is_screenlogin} != True and ${is_home_logined} != True       Func_AppV4_BankAccount.Open Screen Login From Home
    # run keyword if      ${is_screenlogin} != True and ${is_home_logined} == True       Func_AppV4_BankAccount.Logout Ewallet And Open Screen Login

    run keyword if  ${is_home_logined} == True    Func_AppV4_Login.Logout Ewallet And Open Screen Login
    ...  ELSE                                     Func_AppV4_Login.Open Screen Login From Home
#   click button  ${id_navmenu_account}
#
#   click button  ${id_logout_account_loginButton}
#
#   Verify Screen input
#   clear text  ${id_login_input_usernameInput}

End Test
   close all applications



