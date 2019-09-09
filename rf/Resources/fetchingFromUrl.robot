*** Settings ***
Library     Selenium2Library
Library     String
Library     OperatingSystem


*** Keywords ***

Getting Parameter Value From URL
    [Arguments]           ${parameterName}
    log  ${parameterName}
    ${currentURL}=        get location
    Fetching URL to get parameter value     ${parameterName}
    ## disable / problem with MEP
    ## Checking the parameter value            ${parameterName}
    run keyword if   '${parameterName}'== 'access_token'   Save access token to csv file
    run keyword if   '${parameterName}'== 'code'   Save code to csv file

Fetching URL to get parameter value
    [Arguments]  ${parameterName}
    log  ${parameterName}
    ${currentURL}=        get location
    log  ${currentURL}
    should start with     ${currentURL}     ${REDIRECT_URI}
    ${currentURL}=        fetch from right  ${currentURL}    ${parameterName}=
    ${currentURL}=        fetch from left   ${currentURL}   &
    ${parameterValue}=    fetch from left   ${currentURL}   redirect_uri
    set global variable                     ${parameterValue}

Checking the parameter value
    [Arguments]  ${parameterName}
    ${REQ_SCOPE_low}=   convert to lowercase  ${REQ_SCOPE}
    run keyword if   '${parameterName}'== 'scope'        should be equal  ${parameterValue}     ${REQ_SCOPE_low}
    run keyword if   '${parameterName}'== 'state'        should be equal  ${parameterValue}     ${STATE}
    #run keyword if   '${parameterName}'== 'token_type'   should be equal  ${parameterValue}     bearer

Save access token to csv file
     ${accessToken}=    set variable     ${parameterValue}
     set global variable                 ${accessToken}

Save code to csv file
     ${code}=    set variable     ${parameterValue}
     ${replace_code}=  Replace String  ${code}  %2F  /
     set global variable                 ${code}
     set global variable                 ${replace_code}






