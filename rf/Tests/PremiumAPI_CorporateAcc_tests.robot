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



########## Corporate Accounts ##########


TC_Companies_Cust20_App4
    [Tags]  CorpAccounts
    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}" -PMEP="${MEP}"  ..\\soapui\\Corporate-Accounts-soapui-project.xml  TC_Companies_Cust20_App4

TC_Company_Accounts_Cust20_App4
    [Tags]  CorpAccounts
    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}" -PMEP="${MEP}"  ..\\soapui\\Corporate-Accounts-soapui-project.xml  TC_Company_Accounts_Cust20_App4

#TC_Company_Rltnshp_Mngrs Cust20 App4
#    [Tags]  CorpAccounts
#    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\Corporate-Accounts-soapui-project.xml  TC_Company_Rltnshp_Mngrs_Cust20_App4


#TC_Companies_HealthCheck_App2
#    [Tags]  CorpAccounts  HealthChecks
#    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\Corporate-Accounts-soapui-project.xml  TC_Companies_HealthCheck_App2

