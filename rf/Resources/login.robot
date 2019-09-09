*** Settings ***
Resource    variables.robot
Library     Selenium2Library

Resource  ../Resources/readingCredentials.robot
Resource  ../Resources/login.robot
Resource  ../Resources/fetchingFromUrl.robot
Resource  ../Resources/common.robot




*** Keywords ***

Login and receive the access token
    [Documentation]  Prihlaseni do aplikace pomoci udaju uzivatele a ziskani tokenu
    [Arguments]  ${response_type}  ${next_url_param}
    Navigate to login page  ${response_type}  ${next_url_param}
    Logging into the application  0800
    Check Content Screen  0800
    Execute Javascript    return window.stop();
    capture page screenshot
    run keyword if   '${response_type}'== 'token'   Getting Parameter Value From URL  access_token
    run keyword if   '${response_type}'== 'code'   Getting Parameter Value From URL  code
    Getting Parameter Value From URL  state
    Getting Parameter Value From URL  token_type


Navigate to login page
    [Documentation]  Jdu na prihlasovaci stranku, kde v url poslu zjistene udaje pres API
    [Arguments]  ${response_type}  ${next_url_param}

    #open browser        https://bezpecnost.csast.csas.cz/mep/fs/fl/oauth2/auth?client_id=${CLIENT_ID}&response_type=${response_type}&scope=${REQ_SCOPE}&state=${STATE}&redirect_uri=${REDIRECT_URI}${next_url_param}        ${BROWSER}
    open chrome in virtualmachine  https://bezpecnost.csast.csas.cz/mep/fs/fl/oauth2/auth?client_id=${CLIENT_ID}&response_type=${response_type}&scope=${REQ_SCOPE}&state=${STATE}&redirect_uri=${REDIRECT_URI}${next_url_param}
    sleep  2
    capture page screenshot
    Page Should Not Contain  Přihlášení nedostupné
    wait until element is visible   ${usernameField}   timeout=20s

Logging into the application
    [Documentation]  Kazda banka ma jiny formular pro prihlaseni.
    [Arguments]  ${code}
    Run keyword if  '${code}'=='0800'   Login into CSAS
    Run keyword if  '${code}'=='5500'   Login into RB
    Run keyword if  '${code}'=='0600'   log  Do Monety se na sandboxu neprihlasujeme.
    Run keyword if  '${code}'=='0300'   log  Do CSOB se na sandboxu neprihlasujeme.

Second login aggrApi
    [Documentation]  Jdeme na druhe prihlaseni, URL dostaneme z volani AUTH endpointu aggr api
    [Arguments]  ${afterAuthURL}  ${code}  ${cust}
    Go To  ${afterAuthURL}
    sleep  2
    Page Should Not Contain  Přihlášení nedostupné
    capture page screenshot
    Initializing token  ${cust}  App9
    Logging into the application  ${code}

Login into CSAS
    wait until element is visible   ${usernameField}   timeout=20s
    CS Enter login values
    CS Enter password values
    capture page screenshot
    CS Enter SMS code
    capture page screenshot

CS Enter login values
    wait until page contains element  ${usernameField}
    input text      ${usernameField}        ${LOGIN}
    click element   ${loginBtn}

CS Enter password values
    wait until element is visible           ${passwordField}    timeout=15s
    input password  ${passwordField}        ${PASSWORD}
    click element   ${loginBtn}

CS Enter SMS code
    Page Should Not Contain  Váš požadavek se nepodařilo dokončit.
    wait until element is visible           ${smsCodeField}     timeout=15s
    wait until keyword succeeds   10s    2s      input text      ${smsCodeField}         ${OTP_SMS}
    click element   ${loginBtn}
    sleep  2s
    wait until keyword succeeds  10s  2s  Page Should Not Contain Element  ${loginBtn}
    #wait until element is not visible   ${loginBtn}

Login into RB
    RB Enter login values
    RB Enter password values
    RB Confirm login

RB Enter login values
    wait until element is visible           ${RB_usernameField}    timeout=15s
    input text      ${RB_usernameField}        ${LOGIN}

RB Enter password values
    wait until element is visible           ${RB_passwordField}    timeout=15s
    input password  ${RB_passwordField}        ${PASSWORD}

RB Confirm login
    click element   ${RB_loginBtn}

Check Content Screen
    [Documentation]  Zjisti, zda nejsme na content screen , pokud ano, tak ji odsouhlasi

    [Arguments]  ${code}

    Run keyword if  '${code}'=='0800'   Check Content Screen CSAS
    Run keyword if  '${code}'=='5500'   Check Content Screen RB

Check Content Screen CSAS
    sleep  2s
    ${actualTitle}=  get title
    log  ${actualTitle}
    capture page screenshot
    run keyword if   '${actualTitle}'== 'Česká spořitelna - přihlášení'  CS Click Allow Button on Content Screen

CS Click Allow Button on Content Screen
    [Documentation]  klikne na tlacitko Povolit na content screen
    sleep  3s
    wait until page contains element  ${btnAllow}
    click element  ${btnAllow}
    sleep  3s

Check Content Screen RB
    sleep  2s
    ${actualTitle}=  get title
    log  ${actualTitle}
    capture page screenshot
    page should contain  Raiffeisen Online
    run keyword if   '${actualTitle}'== 'Request for permission'  RB Allow permission


RB Allow permission
    wait until element is visible  ${RB_allowBtn}
    Click element  ${RB_allowBtn}
    RB Check page after login

RB Check page after login
    Page should not contain  error