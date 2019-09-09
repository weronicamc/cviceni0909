*** Settings ***
Resource  ../Resources/readingCredentials.robot
Resource  ../Resources/login.robot
Resource  ../Resources/fetchingFromUrl.robot
Resource  ../Resources/common.robot
Resource  ../Resources/soapui.robot


Library   ../Libraries/csvLibrary.py

# robot -i %TAGS% -d Results --variable SOAPUI_PATH:"C:\Program Files (x86)\SmartBear\SoapUI-5.3.0\bin\testrunner.bat" Tests/PremiumAPI_tests.robot





Test Teardown     Closing the application
Suite Teardown    Show access token

*** Variables ***
${SOAPUI_PATH}=  C:\\Program Files (x86)\\SmartBear\\SoapUI-5.4.0\\bin\\testrunner.bat
${ENDPOINT}=  http://st2-cic-wbl.vs.csin.cz:5001


*** Test Cases ***
P360_Initialization_2x_with_same_muid
    [Tags]  P360_Init
    Run API test with custom endpoint  ${SOAPUI_PATH}  ..\\soapui\\ecom-module-pbutton-rest-service-system-test-soapui-project.xml  Initialization 2x_with same muid  ${ENDPOINT}

P360_InitPayment + getPayment
    [Tags]  P360_Init
    Run API test with custom endpoint  ${SOAPUI_PATH}  ..\\soapui\\ecom-module-pbutton-rest-service-system-test-soapui-project.xml  InitPayment + getPayment  ${ENDPOINT}

P360_getTransactionStatus no transaction found
    [Tags]  P360_Init
    Run API test with custom endpoint  ${SOAPUI_PATH}  ..\\soapui\\ecom-module-pbutton-rest-service-system-test-soapui-project.xml  getTransactionStatus no transaction found  ${ENDPOINT}

P360_InitPayment + putBankId CSAS
    [Tags]  P360_Init
    Run API test with custom endpoint  ${SOAPUI_PATH}  ..\\soapui\\ecom-module-pbutton-rest-service-system-test-soapui-project.xml  InitPayment + putBankId CSAS  ${ENDPOINT}

P360_flow when bank is CSAS
    [Tags]  P360_Init
    Run API test with custom endpoint  ${SOAPUI_PATH}  ..\\soapui\\ecom-module-pbutton-rest-service-system-test-soapui-project.xml  flow when bank is CSAS  ${ENDPOINT}

P360_flow when bank is NOT CSAS
    [Tags]  P360_Init
    Run API test with custom endpoint  ${SOAPUI_PATH}  ..\\soapui\\ecom-module-pbutton-rest-service-system-test-soapui-project.xml  flow when bank is NOT CSAS  ${ENDPOINT}

P360_flow when bank is NOT CSAS and was changed
    [Tags]  P360_Init
    Run API test with custom endpoint  ${SOAPUI_PATH}  ..\\soapui\\ecom-module-pbutton-rest-service-system-test-soapui-project.xml  flow when bank is NOT CSAS and was changed  ${ENDPOINT}


P360_invalid_data
    [Tags]  P360_Invalid
    Run API test with custom endpoint  ${SOAPUI_PATH}  ..\\soapui\\ecom-module-pbutton-rest-service-system-test-soapui-project.xml  invalid_data  ${ENDPOINT}
