*** Settings ***
Library  AppiumLibrary
#Library  ../../Libraries/String.py
Library  Dialogs

*** Variables ***
${ID_SYSTEM_TEST}                       vn.payoo.demo.debug:id

${ID_Login_Title}                       ${ID_SYSTEM_TEST}/tv_title_login
${ID_Login_Decription}                  ${ID_SYSTEM_TEST}/tv_title_login_description
${ID_Login_Username}                    ${ID_SYSTEM_TEST}/edit_content
${ID_Login_Password}                    ${ID_SYSTEM_TEST}/pin_view_password
${ID_Login_btnLogin}                    ${ID_SYSTEM_TEST}/btn_login
${ID_Login_linkForgot}                  ${ID_SYSTEM_TEST}/tv_forgot_passWord
${ID_Login_btnTogglePwd}                ${ID_SYSTEM_TEST}/checkbox_toggle
${ID_Login_btnClose}                    ${ID_SYSTEM_TEST}/img_close_screen
${ID_Login_linkYouNeedHelp}             ${ID_SYSTEM_TEST}/tv_support_login
${ID_Login_BottomSheetForgotPassword}   xpath=//android.widget.RelativeLayout[1]
${ID_Login_BottomSheetLoginByYourUsername}     xpath=//android.widget.RelativeLayout[2]
${ID_Login_BottomSheetCallHelp}         xpath=//android.widget.RelativeLayout[3]

*** Keywords ***
Click Button Close
    wait until element is visible       ${ID_Login_btnClose}
    click element                       ${ID_Login_btnClose}

Click Button Login
    wait until element is visible       ${ID_Login_btnLogin}
    click element                       ${ID_Login_btnLogin}

Click Link Forgot Password
    wait until element is visible       ${ID_Login_linkForgot}
    click element                       ${ID_Login_linkForgot}

Click Toggle Password
    wait until element is visible       ${ID_Login_btnTogglePwd}
    click element                       ${ID_Login_btnTogglePwd}

Enter Username
    [Arguments]  ${username}
    wait until element is visible       ${ID_Login_Username}
    clear text                          ${ID_Login_Username}
    input text                          ${ID_Login_Username}            ${username}

Enter Password
    [Arguments]  ${password}
    wait until element is visible       ${ID_Login_Password}
    input text                          ${ID_Login_Password}            ${password}

Get Title
    wait until element is visible       ${ID_Login_Title}
    ${title} =  get text                ${ID_Login_Title}
    [Return]  ${title}

Get Title Description
    wait until element is visible       ${ID_Login_Decription}
    ${des} =  get text                  ${ID_Login_Decription}
    [Return]  ${des}

Verify Screen Login
    wait until element is visible       ${ID_Login_btnLogin}            timeout=3s

Verify Screen Input 
    wait until element is visible       ${ID_Login_Title}            timeout=3s

Click Bottom Sheet You Need Help
    wait until element is visible       ${ID_Login_linkYouNeedHelp}
    click element                       ${ID_Login_linkYouNeedHelp}

Click Login By Username
    wait until element is visible       ${ID_Login_BottomSheetLoginByYourUsername}
    click element                       ${ID_Login_BottomSheetLoginByYourUsername}    