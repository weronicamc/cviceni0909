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


########## Mortgage Calculator ##########
Mortgage-Calculator_TC_Mortgage_Calculator_Info_App1
    [Documentation]  Vraci obecne info o poskytovani hypotek
    [Tags]  Mortgage-Calculator
    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\Mortgage-Calculator-soapui-project.xml  TC_Mortgage_Calculator_Info_App1

Mortgage-Calculator_TC_Mortgage_Calculator_Info_App1_v2
    [Documentation]  Vraci obecne info o poskytovani hypotek, verze 2
    [Tags]  Mortgage-Calculator
    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\Mortgage-Calculator-soapui-project.xml  TC_Mortgage_Calculator_Info_App1_v2

Mortgage-Calculator_TC_Calculate_Mortgage_Loan_App3
    [Documentation]  Vypocet hypoteky dle zadanych hodnot
    [Tags]  Mortgage-Calculator
    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\Mortgage-Calculator-soapui-project.xml  TC_Calculate_Mortgage_Loan_App3

Mortgage-Calculator_TC_Calculate_Mortgage_Loan_App3_v2
    [Documentation]  Vypocet hypoteky dle zadanych hodnot, verze 2
    [Tags]  Mortgage-Calculator
    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\Mortgage-Calculator-soapui-project.xml  TC_Calculate_Mortgage_Loan_App3_v2

Mortgage-Calculator_TC_Mortgage_Calc_Loans_HealthCheck_App1
    [Documentation]  HealthCheck, verze 1
    [Tags]  Mortgage-Calculator  HealthChecks
    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\Mortgage-Calculator-soapui-project.xml  TC_Mortgage_Calc_Loans_HealthCheck_App1

Mortgage-Calculator_TC_Mortgage_Calc_Loans_HealthCheck_App1_v2
    [Documentation]  HealthCheck, verze 2
    [Tags]  Mortgage-Calculator  HealthChecks
    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\Mortgage-Calculator-soapui-project.xml  TC_Mortgage_Calc_Loans_HealthCheck_App1_v2


Mortgage-Calculator_TC_Mortgage_Loan_App3_Err_BadAmount
    [Documentation]  Vypocet hypoteky, neplatny obnos
    [Tags]  Mortgage-Calculator
    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\Mortgage-Calculator-soapui-project.xml  TC_Calculate_Mortgage_Loan_App3_Err_BadAmount

Mortgage-Calculator_TC_Mortgage_Loan_App3_Err_BadYear
    [Documentation]  Vypocet hypoteky, neplatny pocet let
    [Tags]  Mortgage-Calculator
    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\Mortgage-Calculator-soapui-project.xml  TC_Calculate_Mortgage_Loan_App3_Err_BadYear

Mortgage-Calculator_TC_Mortgage_Loan_App3_Err_BadFixation
    [Documentation]  Vypocet hypoteky, neplatna fixace
    [Tags]  Mortgage-Calculator
    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\Mortgage-Calculator-soapui-project.xml  TC_Calculate_Mortgage_Loan_App3_Err_BadFixation

Mortgage-Calculator_TC_Mortgage_Loan_App3_Err_BadPercentage
    [Documentation]  Vypocet hypoteky, neplatna procenta
    [Tags]  Mortgage-Calculator
    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\Mortgage-Calculator-soapui-project.xml  TC_Calculate_Mortgage_Loan_App3_Err_BadPercentage

Mortgage-Calculator_TC_Mortgage_Loan_App3_Err_BadLoanType
    [Documentation]  Vypocet hypoteky, neplatny typ pujcky
    [Tags]  Mortgage-Calculator
    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\Mortgage-Calculator-soapui-project.xml  TC_Calculate_Mortgage_Loan_App3_Err_BadLoanType

Mortgage-Calculator_TC_Mortgage_Loan_App3_Err_BadApiKey
    [Documentation]  Vypocet hypoteky, neplatny apikey
    [Tags]  Mortgage-Calculator
    Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\Mortgage-Calculator-soapui-project.xml  TC_Calculate_Mortgage_Loan_App3_Err_BadApiKey


