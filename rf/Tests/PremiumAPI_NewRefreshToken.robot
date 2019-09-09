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

########## Get New Refresh Tokens - Runs Quarterly ##########
Get new refresh tokens
    [Tags]  RefreshTokens
    [Documentation]  Projde soubor refreshTokens.csv a pro každou nalezenou kombinaci app-cust ziska code a nasledne refreshtoken
    @{data} =   read csv file all rows  ..\\common\\refreshTokens.csv

    :FOR    ${row}    IN    @{data}
    \  ${str}  convert to string  ${row}
    \  ${str}  get substring  ${str}  2
    \  @{values}  Split string  ${str}  ;
    \  Log to console  Cust: ${values[0]}, App: ${values[1]}

    #Initializing token  Cust1  App4
    #Login and receive the access token  code  &access_type=offline
    #Run API test  ${SOAPUI_PATH}  accessToken="${accessToken}"  ..\\soapui\\Using-Code-to-get-Access-and-Refresh-Token-soapui-project.xml  TC_Swap_Code_for_Access_and_Refresh_Tokens_Cust1App4

