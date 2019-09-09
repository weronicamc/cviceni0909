*** Settings ***
Library     String
Library     Collections
Library   ../Libraries/csvLibrary.py

*** Keywords ***
Initializing token
    [Documentation]  Pripravi authToken pro zadaneho uzivatele a aplikaci
    [Arguments]  ${username}  ${app}
    Reading application credentials  ${app}
    Reading login credentials  ${username}

Reading application credentials
    [Arguments]  ${app}
    #@{data}=        read csv file  data/PremiumAPI_TestKYC2_application_credentials.csv  aisp
    @{data}=        read csv file  ../common/App_SystemTest_credentials.csv  ${app}
    ${WEB_API_KEY}=     get from list    @{data}    0
    ${CLIENT_ID}=       get from list    @{data}    1
    ${CLIENT_SECRET}=   get from list    @{data}    2
    ${REDIRECT_URI}=    get from list    @{data}    3
    ${REQ_SCOPE}=       get from list    @{data}    4
    ${APP_NUMBER}=       get from list    @{data}    5
    ${STATE}=          get from list    @{data}    6  #generate random string      10
    ${NOTE}=       get from list    @{data}    7
    log  ${APP_NUMBER}, ${WEB_API_KEY}, ${CLIENT_ID} , ${CLIENT_SECRET}, ${REDIRECT_URI}, ${REQ_SCOPE}, ${STATE}, pozn:${NOTE}
    set global variable   ${CLIENT_ID}
    set global variable   ${REDIRECT_URI}
    set global variable   ${REQ_SCOPE}
    set global variable   ${STATE}
    set global variable  ${app}

Reading login credentials
    [Arguments]  ${username}
    #@{data}=        read csv file  data/PremiumAPI_CUST_1_login_credentials.csv  davidpos
    @{data}=        read csv file  ../common/Cust_SystemTest_credentials.csv  ${username}
    ${LOGIN}=       get from list    @{data}[0]    0
    ${PASSWORD}=    get from list    @{data}[0]    1
    ${OTP_SMS}=     get from list    @{data}[0]    2
    ${NOTE}=       get from list    @{data}[0]    4

    set global variable  ${LOGIN}
    set global variable  ${PASSWORD}
    set global variable  ${OTP_SMS}
    set global variable  ${username}