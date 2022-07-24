*** Settings ***
Library  AppiumLibrary
Library  Dialogs
Library  Collections
Library  String



*** Variables ***
${ID_SYSTEM_TEST}                               vn.payoo.demo.debug:id

${ID_BAccount_ViewBank_BtnRemove}               ${ID_SYSTEM_TEST}/btn_remove

${ID_BAccount_ViewBank_Popup_BtnDelete}         ${ID_SYSTEM_TEST}/right_button
${ID_BAccount_ViewBank_Popup_BtnCancel}         ${ID_SYSTEM_TEST}/left_button

${ID_BAccount_ViewBank_BottomSheet_Keycode}     ${ID_SYSTEM_TEST}/textview_key_%NUMBER%

${ID_BAccount_ViewBank_BottomSheet_PIN}         ${ID_SYSTEM_TEST}/pin_view

*** Keywords ***
Click Button Confirm Delete
    wait until element is visible               ${ID_BAccount_ViewBank_Popup_BtnDelete}
    click element                               ${ID_BAccount_ViewBank_Popup_BtnDelete}

Click Button Remove
    click element                               ${ID_BAccount_ViewBank_BtnRemove}

Verify Screen Bank Detail
    wait until element is visible               ${ID_BAccount_ViewBank_BtnRemove}

Verify Bottom Sheet Enter PIN
    wait until element is visible               ${ID_BAccount_ViewBank_BottomSheet_PIN}

Enter Keycode
    [Arguments]  ${number}
    ${number} =        convert to string        ${number}
    ${id_keycode} =    replace string           ${ID_BAccount_ViewBank_BottomSheet_Keycode}      %NUMBER%     ${number}
    click element                               ${id_keycode}
