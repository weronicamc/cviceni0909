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


########## Personal Accounts ##########
Accounts_TC_ListAccounts_Cust1_App1
    [Tags]  Accounts
    Initializing token  Cust1  App1
    Login and receive the access token  token  &
    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\Accounts-soapui-project.xml  TC_ListAccounts_Cust1_App1

Accounts_TC_ListAccounts_Cust5_App1
    [Tags]  Accounts
    Initializing token  Cust5  App1
    Login and receive the access token  token  &
    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\Accounts-soapui-project.xml  TC_ListAccounts_Cust5_App1


Accounts_TC_ListAccounts_Cust13_App1
    [Tags]  Accounts
    Initializing token  Cust13  App1
    Login and receive the access token  token  &
    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\Accounts-soapui-project.xml  TC_ListAccounts_Cust13_App1



Accounts_TC_ListAccounts_Cust2_App2
    [Tags]  Accounts
    Initializing token  Cust2  App2
    Login and receive the access token  token  &
    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\Accounts-soapui-project.xml  TC_ListAccounts_Cust2_App2

Accounts_TC_TransactionHistory_Cust2_App1
    [Tags]  Accounts  his
    Initializing token  Cust2  App1
    Login and receive the access token  token  &
    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\Accounts-soapui-project.xml  TC_TransactionHistory_Cust2_App1


Accounts_TC_ListAccounts_Cust1_App4
    [Tags]  Accounts
###    Initializing token  Cust4  App4
###    Login and receive the access token  code  &access_type=offline
    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}" -PMEP="${MEP}"  ..\\soapui\\Accounts-soapui-project.xml  TC_ListAccounts_Cust1_App4

##### this endpoint is not developed yet, may not be developed at all
#Accounts_TC_List_BuildingSavings_Cust11_App1
#    [Tags]  Accounts
#    Initializing token  Cust11  App1
#    Login and receive the access token  token  &
#    Run API test  ${SOAPUI_PATH}  ..\\soapui\\Accounts-soapui-project.xml  TC_List_BuildingSavings_Cust11_App1

Accounts_TC_Accounts_HealthCheck
    [Tags]  Accounts  HealthChecks
    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\Accounts-soapui-project.xml  TC_Accounts_HealthCheck

Accounts_TC_TransactionHistory_dateSelect_Cust1_App1
    [Tags]  Accounts  his
    Initializing token  Cust1  App1
    Login and receive the access token  token  &
    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\Accounts-soapui-project.xml  TC_TransactionHistory_dateSelect_Cust1_App1

Accounts_TC_TransactionHistory_OneDay_Cust3a_App1
    [Tags]  Accounts  his
    Initializing token  Cust3a  App1
    Login and receive the access token  token  &
    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\Accounts-soapui-project.xml  TC_TransactionHistory_OneDay_Cust3a_App1

Accounts_TC_TransactionHistory_sortBookingDate_Cust2_App1
    [Tags]  Accounts  his
    Initializing token  Cust2  App1
    Login and receive the access token  token  &
    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\Accounts-soapui-project.xml  TC_TransactionHistory_sortBookingDate_Cust2_App1

Accounts_TC_TransactionHistory_sortAmount_Cust1_App1
    [Tags]  Accounts  his
    Initializing token  Cust1  App1
    Login and receive the access token  token  &
    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\Accounts-soapui-project.xml  TC_TransactionHistory_sortAmount_Cust1_App1

Accounts_TC_TransactionHistory_invalidPage_Cust3a_App1
    [Tags]  Accounts  his
    Initializing token  Cust3a  App1
    Login and receive the access token  token  &
    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\Accounts-soapui-project.xml  TC_TransactionHistory_invalidPage_Cust3a_App1