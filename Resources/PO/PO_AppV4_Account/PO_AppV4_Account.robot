*** Settings ***
Library  AppiumLibrary
#Library  ../../Libraries/String.py
Library  Dialogs

*** Variables ***
${ID_SYSTEM_TEST}                       vn.payoo.demo.debug:id

${ID_Account_BtnLogout}                 ${ID_SYSTEM_TEST}/relative_layout_logout

${ID_Account_Layout_Guest}              ${ID_SYSTEM_TEST}/layout_guest_setting

${ID_Account_Link_Login}                ${ID_SYSTEM_TEST}/textview_login
${ID_Account_Link_Register}             ${ID_SYSTEM_TEST}/textview_signup

${ID_Account_NoLogin_Welcome}           ${ID_SYSTEM_TEST}/textview_welcome
${ID_Account_Login_Name}                ${ID_SYSTEM_TEST}/textview_account
${ID_Account_Login_Phone}               ${ID_SYSTEM_TEST}/textview_phone

${ID_Account_Popup_Btn_Right}           ${ID_SYSTEM_TEST}/right_button
${ID_Account_Popup_Btn_Left}            ${ID_SYSTEM_TEST}/left_button

${ID_Account_Popup_Error}               ${ID_SYSTEM_TEST}/mid_message
# Mật khẩu hiện tại không đúng. Vui lòng nhập lại.
# Ví của bạn hiện đang bị khóa. Vui lòng liên hệ với Bộ phận Hỗ trợ khách hàng của chúng tôi để được hướng dẫn.
# Thông tin Ví điện tử không đúng' but its text was 'Bạn đã nhập thông tin sai liên tục nhiều lần. Để bảo vệ, VĐT của bạn sẽ bị tạm khóa.
# Bạn chắc chắn muốn đăng xuất?

${ID_Account_Popup_Btn_Close}           ${ID_SYSTEM_TEST}/long_confirm_button

*** Keywords ***
Click Button Logout
    wait until element is visible       ${ID_Account_BtnLogout}
    click element                       ${ID_Account_BtnLogout}

Click Link Login
    wait until element is visible       ${ID_Account_Link_Login}                    timeout=15s
    click element                       ${ID_Account_Link_Login}

Click Link Register
    wait until element is visible       ${ID_Account_Link_Register}
    click element                       ${ID_Account_Link_Register}

Click Popup Right Button
    wait until element is visible       ${ID_Account_Popup_Btn_Right}
    click element                       ${ID_Account_Popup_Btn_Right}

Click Popup Left Button
    wait until element is visible       ${ID_Account_Popup_Btn_Left}
    click element                       ${ID_Account_Popup_Btn_Left}

Click Popup Close Buton
    wait until element is visible       ${ID_Account_Popup_Btn_Close}
    click element                       ${ID_Account_Popup_Btn_Close}
    # Nhấn 1 lần ko hoạt động
    click element                       ${ID_Account_Popup_Btn_Close}

Click Popup Close Buton Error Message
    wait until element is visible       ${ID_Account_Popup_Btn_Right}
    click element                       ${ID_Account_Popup_Btn_Right}

Verify Popup Error
    wait until element is visible       ${ID_Account_Popup_Error}                    timeout=30s

Verify Screen Account
    wait until element is visible       ${ID_Account_Layout_Guest}                   timeout=30s

Verify Screen Account No Login
    wait until element is visible       ${ID_Account_Link_Register}

