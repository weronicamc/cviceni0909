*** Settings ***
Resource  ../Resources/readingCredentials.robot
Resource  ../Resources/login.robot
Resource  ../Resources/fetchingFromUrl.robot
Resource  ../Resources/common.robot
Resource  ../Resources/soapui.robot
Resource  ../Resources/variables.robot
Resource  ../Resources/res_PaymentButton360_FE.robot



*** Test Cases ***

TC_PaymentButton360_KB_HappyPath

    [Documentation]  Happypath - is possible to pay an amount. Confirm the transastion and check all values
    [Tags]  happypath  P360  kb

    Create link and open browser  Happypath
    Choose the bank  0100
    Reading login credentials  Cust3a
    Logging into the application  0800

    Check amount  ${amount}
    Check number of order  ${order}

    Choose account  2739150073/0800
    Check enough money on account
    Agree with permissions

    Choose option button  Potvrdit
    Check confirmation page

TC_PaymentButton360_KB_NotEnoughMoney

    [Documentation]   NotEnoughMoney - it is not possible to pay, really big amount. Cancel the transaction.
    [Tags]  notenough  P360

    Create link and open browser  NotEnoughMoney
    Choose the bank  0100
    Reading login credentials  Cust3a
    Logging into the application  0800

    Choose account  2739150073/0800
    Check not enough money on account

    Choose option button  Zrušit

TC_PaymentButton360_KB_TwoAccounts

    [Documentation]  User has two accounts - it is possible to pay from one of them
    [Tags]  twoacc  P360  ok

    Create link and open browser  TwoAccounts
    Choose the bank  0100
    Reading login credentials  Cust3a
    Logging into the application  0800

    Check enough money on account
    Choose account  2739150073/0800
    Check not enough money on account

    Choose account  1000708003/0800
    Agree with permissions

    Choose option button  Potvrdit

    Check confirmation page

TC_PaymentButton360_Moneta_HappyPath

    [Documentation]  Happypath - is possible to pay an amount. Confirm the transastion and check all values
    [Tags]  happypath  P360  moneta

    Create link and open browser  Happypath
    Choose the bank  0600

#    ZDE JE POTREBA SE PRIHLASIT PRES PROXY


    Check amount  ${amount}
    Check number of order  ${order}

    Choose account  1019382023/0800
    Check enough money on account
    Agree with permissions

    Choose option button  Potvrdit
    Check moneta login


TC_PaymentButton360_CSOB_HappyPath

    [Documentation]  Happypath - is possible to pay an amount. Confirm the transastion and check all values
    [Tags]  happypath  P360  csob  xxx

    Create link and open browser  Happypath
    Choose the bank  0300
#    Reading login credentials  Cust3a
#    Logging into the application  0800

    Check amount  ${amount}
    Check number of order  ${order}

    Choose account  10385565/0300
    Check enough money on account
    Agree with permissions

    Choose option button  Potvrdit
    Check confirmation page

