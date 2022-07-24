*** Settings ***
Library  AppiumLibrary
# Library  ../../Libraries/String.py

*** Variables ***
${appium_host} =            http://localhost:4723/wd/hub

# Android Setting
${platform_name_andr}       android
${noreset_andr}             true
${automationName_andr}      uiautomator2
${app}                      D:\SDK\PayooV4\payoo-sbx-debug-4.0.0.apk
${appPackage_common}        vn.payoo.%SYS_TEST%.debug
${appActivity_common}       vn.payoo.presentation.ui.splash.SplashScreenActivity   #vn.payoo.presentation.ui.main.MainActivity

*** Keywords ***
Android - Open App With Install
    [Arguments]  ${devicename}  ${andr_version}  ${sdk_appPackage}  ${sdk_appActivity}
    Open Application
    ...  remote_url=${appium_host}                              automationName=${automationName_andr}
    ...  platformName=${platform_name_andr}                     appPackage=${sdk_appPackage}
    ...  platformVersion=${andr_version}                        appActivity=${sdk_appActivity}
    ...  deviceName=${devicename}                               app=${app}
    ...  ignoreHiddenApiPolicyError=true
    
Android - Open App Without Install
    [Arguments]  ${devicename}  ${andr_version}  ${sdk_appPackage}  ${sdk_appActivity}
    Open Application
    ...  remote_url=${appium_host}                              automationName=${automationName_andr}
    ...  platformName=${platform_name_andr}                     appPackage=${sdk_appPackage}
    ...  platformVersion=${andr_version}                        appActivity=${sdk_appActivity}
    ...  deviceName=${devicename}                               noReset=true
    ...  appWaitForLaunch=false                                 ignoreHiddenApiPolicyError=true

Open AppV4 Application
    [Arguments]   ${sys_test}  ${devicename}  ${andr_version}  ${skip_install}
    # ${sys_test}:     SBA/SBB/RLS

    ${sys_test} =          convert to lowercase  ${sys_test}
    ${sdk_appPackage} =    replace string        ${appPackage_common}       %SYS_TEST%      ${sys_test}

    #    appPackage:  vn.payoo.sample.{sba/sbb/rls}.debug
    #    appActivity: vn.payoo.presentation.ui.main.MainActivity

    run keyword if  '${skip_install}' == 'True'     common.Android - Open App Without Install      ${devicename}  ${andr_version}  ${sdk_appPackage}  ${appActivity_common}
    ...  ELSE IF    '${skip_install}' == 'False'    common.Android - Open App With Install         ${devicename}  ${andr_version}  ${sdk_appPackage}  ${appActivity_common}

End Application
    close all applications