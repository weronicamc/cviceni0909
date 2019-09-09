*** Settings ***
Resource  ../Resources/readingCredentials.robot
Resource  ../Resources/login.robot
Resource  ../Resources/fetchingFromUrl.robot
Resource  ../Resources/common.robot
Resource  ../Resources/soapui.robot
Resource  ../Resources/variables.robot


Library   ../Libraries/csvLibrary.py

# for run on local pc (via VPN) use:
# robot -i %TAGS% -d Results --logtitle "Results - Premium API - AggrAPI" --variable SOAPUI_PATH:"C:\Program Files (x86)\SmartBear\SoapUI-5.4.0\bin\testrunner.bat" --variable MEP:"https://bezpecnost.csast.csas.cz" --variable SOAPUI_SETTINGS:"..\\soapui\\soapui-settings-with-proxy.xml" Tests

# robot -i %TAGS% -d Results --variable SOAPUI_PATH:"C:\Program Files (x86)\SmartBear\SoapUI-5.3.0\bin\testrunner.bat" Tests/PremiumAPI_tests.robot

# robot -i Moneta -d Results --logtitle "Results - Premium API" --variable SOAPUI_PATH:"C:\Program Files (x86)\SmartBear\SoapUI-5.4.0\bin\testrunner.bat" Tests


Test Teardown     Closing the application
Suite Teardown    Show access token

*** Variables ***
${SOAPUI_PATH}=  C:\\Program Files (x86)\\SmartBear\\SoapUI-5.4.0\\bin\\testrunner.bat
${SOAPUI_SETTINGS}=  ..\\soapui\\soapui-settings.xml
${MEP}=  http://int-mep.csint.cz:18080
${accessToken}=  N/A
${replace_code}=  N/A

*** Test Cases ***



########## Aggregation API / AISP + PISP ##########
TC_Aggr_Api_SLSP_Cust2_AISP
    [Tags]  Aggr
    Initializing token  Cust2  App9
    Login and receive the access token  code  &access_type=offline&approval_prompt=force
    Run API test with custom SoapUI settings  ${SOAPUI_PATH}  ${SOAPUI_SETTINGS}  code="${replace_code}" -Pbank="0800" -Pscope="aisp,pisp" -PMEP="${MEP}"  ..\\soapui\\Aggregation-API-soapui-project.xml  AggrApiAuth
    ${afterAuthURL}=  Get URL auth page for aggr api
    ${accessToken}=  Get AccessToken for aggr api
    set global variable                 ${accessToken}
    Second login aggrApi     ${afterAuthURL}    0800   Cust2
    #aggr api zaregistrovano, muzeme provolavat AISP/PISP
    Run API test with custom SoapUI settings  ${SOAPUI_PATH}  ${SOAPUI_SETTINGS}  accessToken="${accessToken}" -Pbank="0800" -Pscope="aisp,pisp" -PMEP="${MEP}"  ..\\soapui\\Aggregation-API-soapui-project.xml  AggrApiAISP


TC_Aggr_Api_SLSP_Cust2_PISP
    [Tags]  Aggr
    Initializing token  Cust2  App9
    Login and receive the access token  code  &access_type=offline&approval_prompt=force
    Run API test with custom SoapUI settings  ${SOAPUI_PATH}  ${SOAPUI_SETTINGS}  code="${replace_code}" -Pbank="0800" -Pscope="aisp,pisp" -PMEP="${MEP}"  ..\\soapui\\Aggregation-API-soapui-project.xml  AggrApiAuth
    ${afterAuthURL}=  Get URL auth page for aggr api
    ${accessToken}=  Get AccessToken for aggr api
    set global variable                 ${accessToken}
    Second login aggrApi     ${afterAuthURL}    0800   Cust2
    #aggr api zaregistrovano, muzeme provolavat AISP/PISP
    Run API test with custom SoapUI settings  ${SOAPUI_PATH}  ${SOAPUI_SETTINGS}  accessToken="${accessToken}" -Pbank="0800" -Pscope="aisp,pisp" -PMEP="${MEP}"  ..\\soapui\\Aggregation-API-soapui-project.xml  AggrApiPISP


TC_Aggr_Api_Moneta_Cust2_AISP
    [Tags]  Aggr  Moneta
    Initializing token  Cust2  App9
    Login and receive the access token  code  &access_type=offline&approval_prompt=force
    Run API test without SoapUI settings  ${SOAPUI_PATH}  code="${replace_code}" -Pbank="0600" -PappToUse="10" -Pscope="aisp" -PMEP="${MEP}"  ..\\soapui\\Aggregation-API-soapui-project.xml  AggrApiAuth
    ${afterAuthURL}=  Get URL auth page for aggr api
    ${accessToken}=  Get AccessToken for aggr api
    set global variable                 ${accessToken}
    Second login aggrApi     ${afterAuthURL}    0600   Cust2
    #aggr api zaregistrovano, muzeme provolavat AISP/PISP
    Run API test without SoapUI settings  ${SOAPUI_PATH}  accessToken="${accessToken}" -Pbank="0600" -PappToUse="10" -Pscope="aisp" -PMEP="${MEP}"  ..\\soapui\\Aggregation-API-soapui-project.xml  AggrApiAISP


TC_Aggr_Api_Moneta_Cust1_PISP
    [Tags]  Aggr
    Initializing token  Cust2  App9
    Login and receive the access token  code  &access_type=offline&approval_prompt=force
    Run API test without SoapUI settings  ${SOAPUI_PATH}  code="${replace_code}" -Pbank="0600" -PappToUse="10" -Pscope="pisp" -PMEP="${MEP}"  ..\\soapui\\Aggregation-API-soapui-project.xml  AggrApiAuth
    ${afterAuthURL}=  Get URL auth page for aggr api
    ${accessToken}=  Get AccessToken for aggr api
    set global variable                 ${accessToken}
    Second login aggrApi     ${afterAuthURL}    0600   Cust2
    #aggr api zaregistrovano, muzeme provolavat AISP/PISP
    Run API test without SoapUI settings  ${SOAPUI_PATH}  accessToken="${accessToken}" -Pbank="0600" -PappToUse="10" -Pscope="pisp" -PMEP="${MEP}"  ..\\soapui\\Aggregation-API-soapui-project.xml  AggrApiAISP



TC_Aggr_Api_RB_Cust2_AISP
    [Tags]  Aggr  Raifka  debug
    Initializing token  Cust2  App9
    Login and receive the access token  code  &access_type=offline&approval_prompt=force
    Run API test with custom SoapUI settings  ${SOAPUI_PATH}  ${SOAPUI_SETTINGS}  code="${replace_code}" -Pbank="5500" -Pscope="aisp" -PMEP="${MEP}"  ..\\soapui\\Aggregation-API-soapui-project.xml  AggrApiAuth
    ${afterAuthURL}=  Get URL auth page for aggr api
    ${accessToken}=  Get AccessToken for aggr api
    set global variable                 ${accessToken}
    Second login aggrApi     ${afterAuthURL}    5500   CustAispRB
    #aggr api zaregistrovano, muzeme provolavat AISP/PISP
    Run API test with custom SoapUI settings  ${SOAPUI_PATH}  ${SOAPUI_SETTINGS}  accessToken="${accessToken}" -Pbank="5500" -Pscope="aisp" -PMEP="${MEP}"  ..\\soapui\\Aggregation-API-soapui-project.xml  AggrApiAISP

TC_Aggr_Api_CSOB_Cust2_AISP
    [Tags]  Aggr  csob
    Initializing token  Cust2  App9
    Login and receive the access token  code  &access_type=offline&approval_prompt=force
    Run API test with custom SoapUI settings  ${SOAPUI_PATH}  ${SOAPUI_SETTINGS}  code="${replace_code}" -Pbank="0300" -PappToUse="10" -Pscope="aisp" -PMEP="${MEP}"  ..\\soapui\\Aggregation-API-soapui-project.xml  AggrApiAuth
    ${afterAuthURL}=  Get URL auth page for aggr api
    ${accessToken}=  Get AccessToken for aggr api
    set global variable                 ${accessToken}
    Second login aggrApi     ${afterAuthURL}    0300   CustAispRB
    #aggr api zaregistrovano, muzeme provolavat AISP/PISP
    Run API test with custom SoapUI settings  ${SOAPUI_PATH}  ${SOAPUI_SETTINGS}  accessToken="${accessToken}" -Pbank="0300" -PappToUse="10" -Pscope="aisp" -PMEP="${MEP}"  ..\\soapui\\Aggregation-API-soapui-project.xml  AggrApiAISP

