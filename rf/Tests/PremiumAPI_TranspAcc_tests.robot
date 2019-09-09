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

########## Transparent Accounts ##########
Transparent-Accounts_TC_Transp_Accnts_Lst_All_TrnspAcc_App1
    [Documentation]  Vraci informace o vsech transparentnich uctech, App1
    [Tags]  Transparent-Accounts
    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\Transparent-Accounts-soapui-project.xml  TC_Transp_Accnts_Lst_All_TrnspAcc_App1

Transparent-Accounts_TC_Transp_Accnts_Lst_All_TrnspAcc_App1_v3
    [Documentation]  Vraci informace o vsech transparentnich uctech, App1, verze 3
    [Tags]  Transparent-Accounts
    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\Transparent-Accounts-soapui-project.xml  TC_Transp_Accnts_Lst_All_TrnspAcc_App1_v3

Transparent-Accounts_TC_Transp_Accnts_TrnspAccDetails_App1
    [Documentation]  Vraci detail vybraneho transparentniho uctu, App1
    [Tags]  Transparent-Accounts
    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\Transparent-Accounts-soapui-project.xml  TC_Transp_Accnts_TrnspAccDetails_App1

#Transparent-Accounts_TC_Transp_Accnts_Lst_All_TrnspAccTransactions_App1
#    [Tags]  Transparent-Accounts
#    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\Transparent-Accounts-soapui-project.xml  TC_Transp_Accnts_Lst_All_TrnspAccTransactions_App1

Transparent-Accounts_TC_Transp_Accnts_Lst_All_TrnspAcc_App3
    [Documentation]  Vraci informace o vsech transparentnich uctech, App3
    [Tags]  Transparent-Accounts
    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\Transparent-Accounts-soapui-project.xml  TC_Transp_Accnts_Lst_All_TrnspAcc_App3

Transparent-Accounts_TC_Transp_Accnts_TrnspAccDetails_App3
    [Documentation]  Vraci detail vybraneho transparentniho uctu, App3
    [Tags]  Transparent-Accounts
    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\Transparent-Accounts-soapui-project.xml  TC_Transp_Accnts_TrnspAccDetails_App3

Transparent-Accounts_TC_Transp_Accnts_Lst_All_TrnspAccTransactions_App3
    [Documentation]  Vraci vsechny transakce vybraneho transparentniho uctu, App3
    [Tags]  Transparent-Accounts
    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\Transparent-Accounts-soapui-project.xml  TC_Transp_Accnts_Lst_All_TrnspAccTransactions_App3

Transparent-Accounts_TC_Transp_Accnts_Lst_All_TrnspAcc_Negative_App3
    [Documentation]  Negativni scenar, hledani neexistujiciho uctu, vraci 404, App3
    [Tags]  Transparent-Accounts
    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\Transparent-Accounts-soapui-project.xml  TC_Transp_Accnts_Lst_All_TrnspAcc_Negative_App3

Transparent-Accounts_TC_Transp_Accnts_HealthCheckApp1
    [Documentation]  HealthCheck App1, verze 1
    [Tags]  Transparent-Accounts  HealthChecks
    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\Transparent-Accounts-soapui-project.xml  TC_Transp_Accnts_HealthCheckApp1

Transparent-Accounts_TC_Transp_Accnts_HealthCheckApp1_v3
    [Documentation]  HealthCheck App1, verze 3
    [Tags]  Transparent-Accounts  HealthChecks
    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\Transparent-Accounts-soapui-project.xml  TC_Transp_Accnts_HealthCheckApp1_v3

Transparent-Accounts_TC_Transp_Accnts_Lst_All_TrnspAcc_ErrCode
    [Documentation]  Vypsat vsechny transparentni ucty, spatny webapikey
    [Tags]  Transparent-Accounts
    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\Transparent-Accounts-soapui-project.xml  TC_Transp_Accnts_Lst_All_TrnspAcc_ErrCode

Transparent-Accounts_TC_Transp_Accnts_Lst_All_TrnspAcc_Pagination_ErrCode
    [Documentation]  Vratit vsechny transparentni ucty, spatne nastaveni strankovani
    [Tags]  Transparent-Accounts
    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\Transparent-Accounts-soapui-project.xml  TC_Transp_Accnts_Lst_All_TrnspAcc_Pagination_ErrCode

Transparent-Accounts_TC_Transp_Accnts_TrnspAccDetails_ErrCode_BadIDAcc
    [Documentation]  Vratit detail vybraneho transparentniho uctu, spatne cislo uctu
    [Tags]  Transparent-Accounts
    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\Transparent-Accounts-soapui-project.xml  TC_Transp_Accnts_TrnspAccDetails_ErrCode_BadIDAcc

