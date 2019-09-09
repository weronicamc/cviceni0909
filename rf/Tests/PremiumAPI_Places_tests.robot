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

########## Places ##########
Places_TC_Get_Places_by_Conditions_App3
    [Documentation]  Vraci pobocky a bankomaty dle zadanych podminek
    [Tags]  Places
    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\Places-soapui-project.xml  TC_Get_Places_by_Conditions_App3

Places_TC_Get_Places_in_Rectangle_App3
    [Documentation]  Vraci pobocky a bankomaty v zadanem plosnem rozsahu
    [Tags]  Places
    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\Places-soapui-project.xml  TC_Get_Places_in_Rectangle_App3

Places_TC_Get_Places_in_Rectangle_App3_v3
    [Documentation]  Vraci pobocky a bankomaty v zadanem plosnem rozsahu, verze 3
    [Tags]  Places
    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\Places-soapui-project.xml  TC_Get_Places_in_Rectangle_App3_v3

Places_TC_Branches_by_ID_App1
    [Documentation]  Vraci pobocku dle ID
    [Tags]  Places
    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\Places-soapui-project.xml  TC_Branches_by_ID_App1

Places_TC_Branches_Outage_App1
    [Documentation]  Vraci seznam vypadku na pobockach
    [Tags]  Places
    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\Places-soapui-project.xml  TC_Branches_Outage_App1

Places_TC_Get_Branches_By_Conditions_App3
    [Documentation]  Vraci pobocky dle zadanych podminek
    [Tags]  Places
    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\Places-soapui-project.xml  TC_Get_Branches_By_Conditions_App3

Places_TC_Get_Branches_in_Rectangle_App3
    [Documentation]  Vraci pobocky v zadanem plosnem rozsahu
    [Tags]  Places
    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\Places-soapui-project.xml  TC_Get_Branches_in_Rectangle_App3

Places_TC_Get_ATM_by_id_App1
    [Documentation]  Vraci bankomat dle ID
    [Tags]  Places
    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\Places-soapui-project.xml  TC_Get_ATM_by_id_App1

Places_TC_Get_ATMs_by_Conditions_App1
    [Documentation]  Vraci bankomat dle zadanych podminek
    [Tags]  Places
    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\Places-soapui-project.xml  TC_Get_ATMs_by_Conditions_App1

Places_TC_Get_ATMs_in_Rectangle_App1
    [Documentation]  Vraci bankomaty v zadanem plosnem rozsahu
    [Tags]  Places
    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\Places-soapui-project.xml  TC_Get_ATMs_in_Rectangle_App1

Places_TC_Places_HealthCheckApp1
    [Documentation]  Vraci bankomat dle zadanych podminek
    [Tags]  Places  HealthChecks
    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\Places-soapui-project.xml  TC_Places_HealthCheckApp1

Places_TC_Places_HealthCheckApp1_v3
    [Documentation]  HealthCheck, verze 3
    [Tags]  Places  HealthChecks
    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\Places-soapui-project.xml  TC_Places_HealthCheckApp1_v3


Places_TC_Get_Places_by_Conditions_App3_Err
    [Documentation]  Vraci pobocky a bankomaty dle zadanych podminek, pouziva sadu neplatnych podminek
    [Tags]  Places
    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\Places-soapui-project.xml  TC_Get_Places_by_Conditions_App3_Err

Places_TC_Get_Places_in_Rectangle_App3_Err
    [Documentation]  Vraci pobocky a bankomaty v zadanem plosnem rozsahu, pouziva neplatne mesto
    [Tags]  Places
    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\Places-soapui-project.xml  TC_Get_Places_in_Rectangle_App3_Err

Places_TC_Branches_by_ID_App1_Err
    [Documentation]  Vraci pobocky dle zadaneho ID, pouziva neplatne ID
    [Tags]  Places
    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\Places-soapui-project.xml  TC_Branches_by_ID_App1_Err

Places_TC_Branches_Outage_App1_Err
    [Documentation]  Vraci seznam vypadku na pobockach, pouziva neplatne hodnoty
    [Tags]  Places
    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\Places-soapui-project.xml  TC_Branches_Outage_App1_Err

Places_TC_Get_Branches_By_Conditions_App3_Err
    [Documentation]  Vraci pobocky dle zadanych podminek, pouziva sadu neplatnych podminek
    [Tags]  Places
    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\Places-soapui-project.xml  TC_Get_Branches_By_Conditions_App3_Err

Places_TC_Get_Branches_in_Rectangle_App3_Err
    [Documentation]  Vraci pobocky v zadanem plosnem rozsahu, pouziva neplatne hodnoty
    [Tags]  Places
    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\Places-soapui-project.xml  TC_Get_Branches_in_Rectangle_App3_Err

Places_TC_Get_ATM_by_id_App1_Err
    [Documentation]  Vraci bankomaty dle ID, pouziva neplatne ID
    [Tags]  Places
    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\Places-soapui-project.xml  TC_Get_ATM_by_id_App1_Err

Places_TC_Get_ATMs_by_Conditions_App1_Err
    [Documentation]  Vraci bankomaty dle zadanych podminek, pouziva sadu neplatnych podminek
    [Tags]  Places
    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\Places-soapui-project.xml  TC_Get_ATMs_by_Conditions_App1_Err

Places_TC_Get_ATMs_in_Rectangle_App1_Err
    [Documentation]  Vraci bankomaty v zadanem plosnem rozsahu, pouziva neplatne hodnoty
    [Tags]  Places
    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\Places-soapui-project.xml  TC_Get_ATMs_in_Rectangle_App1_Err

