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
${MEP}=  http://int-mep.csint.cz:18080

*** Test Cases ***
########## Know Your Customer ##########
KYC_TC_KYC_Cust1_App5
    [Tags]  KYC  ukazka
    Initializing token  Cust1  App5
    Login and receive the access token  token  &
    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\KYC-soapui-project.xml  TC_KYC_Cust1_App5

KYC_TC_KYC_Cust1_App5_v2
    [Tags]  KYC
    Initializing token  Cust1  App5
    Login and receive the access token  token  &
    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\KYC-soapui-project.xml  TC_KYC_Cust1_App5_v2


KYC_TC_KYC_Cust11_App5_v2
    [Tags]  KYC
    Initializing token  Cust11  App5
    Login and receive the access token  token  &
    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\KYC-soapui-project.xml  TC_KYC_Cust11_App5_v2


KYC_TC_KYC_Cust13_App5_v2
    [Tags]  KYC
	[Documentation]  AP-11 , u cizince se nevrací rodne cislo
    Initializing token  Cust13  App5
    Login and receive the access token  token  &
    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\KYC-soapui-project.xml  TC_KYC_Cust13_App5_v2

KYC_TC_KYC_Cust2_App7
    [Tags]  KYC
###neni nutno po 90 dnu    Initializing token  Cust2  App7
###neni nutno po 90 dnu    Login and receive the access token  code  &access_type=offline
    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}" -PMEP="${MEP}"  ..\\soapui\\KYC-soapui-project.xml  TC_KYC_Cust2_App7

KYC_TC_KYC_Cust2_App7_v2
    [Tags]  KYC
###neni nutno po 90 dnu    Initializing token  Cust2  App7
###neni nutno po 90 dnu    Login and receive the access token  code  &access_type=offline
    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}" -PMEP="${MEP}"  ..\\soapui\\KYC-soapui-project.xml  TC_KYC_Cust2_App7_v2

KYC_TC_KYC_Cust2_App7_err_badApiKey
    [Tags]  KYC
###neni nutno po 90 dnu    Initializing token  Cust2  App7
###neni nutno po 90 dnu    Login and receive the access token  code  &access_type=offline
    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}" -PMEP="${MEP}"  ..\\soapui\\KYC-soapui-project.xml  TC_KYC_Cust2_App7_err_badApiKey

KYC_TC_KYC_Cust3a_App5
    [Tags]  KYC
    Initializing token  Cust3a  App5
    Login and receive the access token  token  &
    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\KYC-soapui-project.xml  TC_KYC_Cust3a_App5

KYC_TC_KYC_Cust4_App6
    [Tags]  KYC
    Initializing token  Cust4  App6
    Login and receive the access token  token  &
    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\KYC-soapui-project.xml  TC_KYC_Cust4_App6

KYC_TC_KYC_Cust2_App5
    [Tags]  KYC
    Initializing token  Cust2  App5
    Login and receive the access token  token  &
    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\KYC-soapui-project.xml  TC_KYC_Cust2_App5

KYC_TC_KYC_Cust5_App5
    [Tags]  KYC
    Initializing token  Cust5  App5
    Login and receive the access token  token  &
    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\KYC-soapui-project.xml  TC_KYC_Cust5_App5


KYC_TC_KYC_Cust6_App5
    [Documentation]  Call KYC for user without global aggr. in TPP
    [Tags]  KYC
    Initializing token  Cust6  App5
    Login and receive the access token  token  &
    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\KYC-soapui-project.xml  TC_KYC_Cust6_App5

KYC_TC_KYC_Cust9_App5_v2
    [Documentation]  Call KYC for user without global aggr. in TPP
    [Tags]  KYC
    Initializing token  Cust9  App5
    Login and receive the access token  token  &
    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\KYC-soapui-project.xml  TC_KYC_Cust9_App5_v2




KYC_TC_KYC_HealthCheck_Cust1_App5
    [Tags]  KYC  HealthChecks
    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\KYC-soapui-project.xml  TC_KYC_HealthCheck_Cust1_App5
