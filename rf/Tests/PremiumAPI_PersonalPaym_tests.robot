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

########## Personal Payments ##########
Payments_TC_PrsnlPaym_Domestic_WithinOwnCSAS_Cust2App2
    [Tags]  Payments
    Initializing token  Cust2  App2
    Login and receive the access token  token  &
    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\Personal-Payments-soapui-project.xml  TC_PrsnlPaym_Domestic_WithinOwnCSAS_Cust2App2


#####  Authorizations are not developed yet, they change authorization endpoints
#Payments_TC_PrsnlPaym_Domestic_WithinOwnCSAS_Authorization_Cust2App2
#    [Tags]  Payments
#    Initializing token  Cust2  App2
#    Login and receive the access token  token  &
#    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\Personal-Payments-soapui-project.xml  TC_PrsnlPaym_Domestic_WithinOwnCSAS_Authorization_Cust2App2

Payments_TC_PrsnlPaym_Domestic_WithinCSAS_Cust1App1
    [Tags]  Payments
    Initializing token  Cust1  App1
    Login and receive the access token  token  &
    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\Personal-Payments-soapui-project.xml  TC_PrsnlPaym_Domestic_WithinCSAS_Cust1App1

#Payments_TC_PrsnlPaym_Domestic_WithinCSAS_Authorization_Cust1App1
#    [Tags]  Payments
#    Initializing token  Cust1  App1
#    Login and receive the access token  token  &
#    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\Personal-Payments-soapui-project.xml  TC_PrsnlPaym_Domestic_WithinCSAS_Authorization_Cust1App1

Payments_TC_PrsnlPaym_Domestic_OutsideCSAS_Cust1App1
    [Tags]  Payments
    Initializing token  Cust1  App1
    Login and receive the access token  token  &
    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\Personal-Payments-soapui-project.xml  TC_PrsnlPaym_Domestic_OutsideCSAS_Cust1App1

#Payments_TC_PrsnlPaym_Domestic_OutsideCSAS_Authorization_Cust1App1
#    [Tags]  Payments
#    Initializing token  Cust1  App1
#    Login and receive the access token  token  &
#    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\Personal-Payments-soapui-project.xml  TC_PrsnlPaym_Domestic_OutsideCSAS_Authorization_Cust1App1

Payments_TC_PrsnlPaym_International_Cust2App2
    [Tags]  Payments
    Initializing token  Cust2  App2
    Login and receive the access token  token  &
    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\Personal-Payments-soapui-project.xml  TC_PrsnlPaym_International_Cust2App2

#Payments_TC_PrsnlPaym_International_Authorization_Cust2App2
#    [Tags]  Payments
#    Initializing token  Cust2  App2
#    Login and receive the access token  token  &
#    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\Personal-Payments-soapui-project.xml  TC_PrsnlPaym_International_Authorization_Cust2App2

Payments_TC_PrsnlPaym_SEPA_Cust2App1
    [Tags]  Payments
    Initializing token  Cust2  App1
    Login and receive the access token  token  &
    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\Personal-Payments-soapui-project.xml  TC_PrsnlPaym_SEPA_Cust2App1

#Payments_TC_PrsnlPaym_SEPA_Authorization_Cust2App1
#    [Tags]  Payments
#    Initializing token  Cust1  App1
#    Login and receive the access token  token  &
#    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\Personal-Payments-soapui-project.xml  TC_PrsnlPaym_SEPA_Authorization_Cust2App1

Payments_TC_PrsnlPaym_Bundles_Domestic_Payments_Cust2App2
    [Tags]  Payments
    Initializing token  Cust2  App2
    Login and receive the access token  token  &
    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\Personal-Payments-soapui-project.xml  TC_PrsnlPaym_Bundles_Domestic_Payments_Cust2App2

Payments_TC_PrsnlPaym_Bundles_Domestic_Bundle_Creation_Cust2App2
    [Tags]  Payments
    Initializing token  Cust2  App2
    Login and receive the access token  token  &
    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\Personal-Payments-soapui-project.xml  TC_PrsnlPaym_Bundles_Domestic_Bundle_Creation_Cust2App2

#Payments_TC_PrsnlPaym_Bundles_Domestic_Bundle_Authorization_Cust2App2
#    [Tags]  Payments
#    Initializing token  Cust2  App2
#    Login and receive the access token  token  &
#    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\Personal-Payments-soapui-project.xml  TC_PrsnlPaym_Bundles_Domestic_Bundle_Authorization_Cust2App2

Payments_TC_PrsnlPaym_Bundles_Dmstc_And_Intl_Payments_Cust2App2_NEGATIVE
    [Tags]  Payments
    Initializing token  Cust2  App2
    Login and receive the access token  token  &
    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\Personal-Payments-soapui-project.xml  TC_PrsnlPaym_Bundles_Dmstc_And_Intl_Payments_Cust2App2_NEGATIVE

Payments_TC_PrsnlPaym_Bundles_Dmstc_And_Intl_Bundle_Creation_Cust2App2_NEGATIVE
    [Tags]  Payments
    Initializing token  Cust2  App2
    Login and receive the access token  token  &
    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\Personal-Payments-soapui-project.xml  TC_PrsnlPaym_Bundles_Dmstc_And_Intl_Bundle_Creation_Cust2App2_NEGATIVE

#Payments_TC_PrsnlPaym_Bundles_Dmstc_And_Intl_Bundle_Authorization_Cust2App2_NEGATIVE
#    [Tags]  Payments
#    Initializing token  Cust2  App2
#    Login and receive the access token  token  &
#    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\Personal-Payments-soapui-project.xml  TC_PrsnlPaym_Bundles_Dmstc_And_Intl_Bundle_Authorization_Cust2App2_NEGATIVE


Payments_TC_PrsnlPaym_HealthCheck_App1
    [Tags]  Payments  HealthChecks
    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\Personal-Payments-soapui-project.xml  TC_PrsnlPaym_HealthCheck_App1


