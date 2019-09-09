*** Settings ***
Resource  ../Resources/readingCredentials.robot
Resource  ../Resources/login.robot
Resource  ../Resources/fetchingFromUrl.robot
Resource  ../Resources/common.robot
Resource  ../Resources/soapui.robot


Library   ../Libraries/csvLibrary.py

# robot -i %TAGS% -d Results --variable SOAPUI_PATH:"C:\Program Files (x86)\SmartBear\SoapUI-5.3.0\bin\testrunner.bat" Tests/PremiumAPI_tests.robot



Test Teardown     Closing the application

*** Variables ***
${SOAPUI_PATH}=  C:\\Program Files (x86)\\SmartBear\\SoapUI-5.4.0\\bin\\testrunner.bat
${accessToken}=  N/A


*** Test Cases ***

########## Mock Tests ##########
Transparent_Accounts_Mock_Tests
    [Tags]  Mock
    Run API test without SoapUI settings  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\ErsteApiHub-FAT-Mock-Testing-soapui-project.xml  TC_Transparent_Account_Mock_Testing

Personal_Accounts_Mock_Tests
    [Tags]  Mock
    Run API test without SoapUI settings  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\ErsteApiHub-FAT-Mock-Testing-soapui-project.xml  TC_Personal_Accounts_Mock_Testing

Exchange_Rates_Mock_Tests
    [Tags]  Mock
    Run API test without SoapUI settings  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\ErsteApiHub-FAT-Mock-Testing-soapui-project.xml  TC_Exchange_Rates_Mock_Testing

Know_Your_Customer_Mock_Tests
    [Tags]  Mock
    Run API test without SoapUI settings  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\ErsteApiHub-FAT-Mock-Testing-soapui-project.xml  TC_Know_Your_Customer_Mock_Testing

Mortgage_Calculator_Mock_Tests
    [Tags]  Mock
    Run API test without SoapUI settings  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\ErsteApiHub-FAT-Mock-Testing-soapui-project.xml  TC_Mortgage_Calculator_Mock_Testing

Corporate_Accounts_Mock_Tests
    [Tags]  Mock
    Run API test without SoapUI settings  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\ErsteApiHub-FAT-Mock-Testing-soapui-project.xml  TC_Corporate_Accounts_Mock_Testing

Personal_Payments_Mock_Tests
    [Tags]  Mock
    Run API test without SoapUI settings  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\ErsteApiHub-FAT-Mock-Testing-soapui-project.xml  TC_Personal_Payments_Mock_Testing

Places_Mock_Tests
    [Tags]  Mock
    Run API test without SoapUI settings  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\ErsteApiHub-FAT-Mock-Testing-soapui-project.xml  TC_Places_Mock_Testing



