*** Settings ***
Library  AppiumLibrary
#Library  ../../Libraries/String.py
Library  Dialogs

*** Variables ***
${ID_SYSTEM_TEST}                       vn.payoo.demo.debug:id

${ID_Navigation_Item_Home}              ${ID_SYSTEM_TEST}/item_home
${ID_Navigation_Item_History}           ${ID_SYSTEM_TEST}/item_history
${ID_Navigation_Item_Payoo}             ${ID_SYSTEM_TEST}/item_payoo
${ID_Navigation_Item_Account}           ${ID_SYSTEM_TEST}/item_account

*** Keywords ***
Click Tab Home
    wait until element is visible       ${ID_Navigation_Item_Home}              timeout=20s
    click element                       ${ID_Navigation_Item_Home}

Click Tab History
    wait until element is visible       ${ID_Navigation_Item_History}           timeout=20s
    click element                       ${ID_Navigation_Item_History}

Click Tab Ewallet Payoo
    wait until element is visible       ${ID_Navigation_Item_Payoo}             timeout=20s
    click element                       ${ID_Navigation_Item_Payoo}

Click Tab Account
    wait until element is visible       ${ID_Navigation_Item_Account}           timeout=20s
    click element                       ${ID_Navigation_Item_Account}