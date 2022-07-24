*** Settings ***
Library  AppiumLibrary
#Library  ../../Libraries/String.py
Library  Dialogs

Resource  ../../Resources/common.robot

Suite Setup                 common.Open AppV4 Application  ${system_test}  ${device_name}  ${andr_version}  ${skip_install}
Suite Teardown              common.End Application

#Test Setup

*** Variables ***
${ID_SYSTEM_TEST}

${system_test}              sbx
${device_name}              AIVI01
${andr_version}             11
${skip_install}             True

# How to run Script
# robot -d D:\results\SDK_Payment -i debug --variable ID_SYSTEM_TEST:vn.payoo.paymentsdk.sample.rls.debug:id Tests/SDK_Payment/Regression_PaymentSDK.robot

# robot -d C:\Users\vi.tran\Downloads\results -i debug Tests/Home/testhome.robot

*** Keywords ***

*** Test Cases ***
Test 1
    [Tags]  debug
    sleep  30s
    log to console  Hello

