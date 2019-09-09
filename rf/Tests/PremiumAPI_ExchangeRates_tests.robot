*** Settings ***
Resource  ../Resources/readingCredentials.robot
Resource  ../Resources/login.robot
Resource  ../Resources/fetchingFromUrl.robot
Resource  ../Resources/common.robot
Resource  ../Resources/soapui.robot
Resource  ../Resources/variables.robot


Library   ../Libraries/csvLibrary.py

# robot -i %TAGS% -d Results --variable SOAPUI_PATH:"C:\Program Files (x86)\SmartBear\SoapUI-5.3.0\bin\testrunner.bat" Tests/PremiumAPI_tests.robot





Test Teardown     Closing the application
Suite Teardown    Show access token

*** Variables ***
${SOAPUI_PATH}=  C:\\Program Files (x86)\\SmartBear\\SoapUI-5.4.0\\bin\\testrunner.bat
${accessToken}=  N/A
${replace_code}=  N/A



*** Test Cases ***

########## Exchange Rates ##########
Exchange-rates_TC_Exchange_Rts_Lst_All_Currencies_App1
    [Documentation]  Kurzovni listek, vypsani vsech men
    [Tags]  Exchange-rates
    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\Exchange-Rates-soapui-project.xml  TC_Exchange_Rts_Lst_All_Currencies_App1

Exchange-rates_TC_Exchange_Rts_Lst_All_Currencies_App1_v2
    [Documentation]  Kurzovni listek, vypsani vsech men, verze 2
    [Tags]  Exchange-rates
    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\Exchange-Rates-soapui-project.xml  TC_Exchange_Rts_Lst_All_Currencies_App1_v2

Exchange-rates_TC_Exchange_Rts_List_Exchange_Rates_App3
    [Documentation]  Vypsani vsech kurzu pro danou menu
    [Tags]  Exchange-rates
    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\Exchange-Rates-soapui-project.xml  TC_Exchange_Rts_List_Exchange_Rates_App3

Exchange-rates_TC_Exchange_Rts_List_Exchange_Rates_App3_v2
    [Documentation]  Vypsani vsech kurzu pro danou menu, verze 2
    [Tags]  Exchange-rates
    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\Exchange-Rates-soapui-project.xml  TC_Exchange_Rts_List_Exchange_Rates_App3_v2

Exchange-rates_TC_Exchange_Rts_Convert_Two_Currencies_App3
    [Documentation]  Konverze dvou zadanych men a zadane hodnoty
    [Tags]  Exchange-rates
    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\Exchange-Rates-soapui-project.xml  TC_Exchange_Rts_Convert_Two_Currencies_App3

Exchange-rates_TC_Exchange_Rts_Convert_Two_Currencies_App3_v2
    [Documentation]  Konverze dvou zadanych men a zadane hodnoty, verze 2
    [Tags]  Exchange-rates
    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\Exchange-Rates-soapui-project.xml  TC_Exchange_Rts_Convert_Two_Currencies_App3_v2

Exchange-rates_TC_Exchange_Rts_List_Exchange_Rates_Cross_App3
    [Documentation]  Test krizoveho kurzovniho listku
    [Tags]  Exchange-rates
    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\Exchange-Rates-soapui-project.xml  TC_Exchange_Rts_List_Exchange_Rates_Cross_App3

Exchange-rates_TC_Exchange_Rts_List_Exchange_Rates_Cross_App3_v2
    [Documentation]  Test krizoveho kurzovniho listku, verze 2
    [Tags]  Exchange-rates
    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\Exchange-Rates-soapui-project.xml  TC_Exchange_Rts_List_Exchange_Rates_Cross_App3_v2

Exchange-rates_TC_Exchange_Rates_HealthCheck_App1
    [Documentation]  Healthcheck, verze 1
    [Tags]  Exchange-rates  HealthChecks
    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\Exchange-Rates-soapui-project.xml  TC_Exchange_Rates_HealthCheck_App1

Exchange-rates_TC_Exchange_Rates_HealthCheck_App1_v2
    [Documentation]  Healthcheck, verze 2
    [Tags]  Exchange-rates  HealthChecks
    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\Exchange-Rates-soapui-project.xml  TC_Exchange_Rates_HealthCheck_App1_v2

Exchange-rates_TC_Exchange_Rts_Lst_All_Currencies_App1_Err
    [Documentation]  Kurzovni listek, vypsani vsech men, neplatny webapikey
    [Tags]  Exchange-rates
    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\Exchange-Rates-soapui-project.xml  TC_Exchange_Rts_Lst_All_Currencies_App1_Err

Exchange-rates_TC_Exchange_Rts_List_Exchange_Rates_App3_Err
    [Documentation]  Vypsani vsech kurzu pro danou menu, neplatne hodnoty
    [Tags]  Exchange-rates
    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\Exchange-Rates-soapui-project.xml  TC_Exchange_Rts_List_Exchange_Rates_App3_Err

Exchange-rates_TC_Exchange_Rts_Convert_Two_Currencies_App3_Err
    [Documentation]  Konverze dvou zadanych men a zadane hodnoty, neplatne hodnoty
    [Tags]  Exchange-rates
    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\Exchange-Rates-soapui-project.xml  TC_Exchange_Rts_Convert_Two_Currencies_App3_Err

Exchange-rates_TC_Exchange_Rts_List_Exchange_Rates_Cross_App3_Err
    [Documentation]  Test krizoveho kurzovniho listku, neplatne hodnoty
    [Tags]  Exchange-rates
    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\Exchange-Rates-soapui-project.xml  TC_Exchange_Rts_List_Exchange_Rates_Cross_App3_Err
