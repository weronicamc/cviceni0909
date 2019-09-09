*** Settings ***
Library  Selenium2Library
Library  String
Library  OperatingSystem
Library  Collections

*** Keywords ***
Run API test
    [Documentation]  Spusteni SoapuUI testu , potrebuje i konfiguracni soubor \\soapui\\soapui-settings.xml , ${PROJECT_PARAM} lze do SoapUI dostat další hodnoty. napr: 'jmenoPromenne="hodnota"'
    [Arguments]  ${SOAPUI_PATH}  ${PROJECT_PARAM}  ${project_XML}  ${TC_NAME}
    Create File   ..\\common\\${TC_NAME}.txt  Prazdny logovaci soubor
    ${output}=  run  call "${SOAPUI_PATH}" -a -j -I -f"..\\results" -c"${TC_NAME}" -P${PROJECT_PARAM} -t"..\\soapui\\soapui-settings.xml" ${project_XML}
    log  ${output}
    Get SoapUI logs  ${TC_NAME}
    ${output2}=  run  call cd .. && cd results && move TEST-*.xml ${TC_NAME}.xml
    should contain  ${output}  status: FINISHED

Run API test without SoapUI settings
    [Documentation]  Spusteni SoapuUI testu , neposílá konfiguracni soubor \\soapui\\soapui-settings.xml , ${PROJECT_PARAM} lze do SoapUI dostat další hodnoty. napr: 'jmenoPromenne="hodnota"'
    [Arguments]  ${SOAPUI_PATH}  ${PROJECT_PARAM}  ${project_XML}  ${TC_NAME}
    Create File   ..\\common\\${TC_NAME}.txt  Prazdny logovaci soubor

    ${output}=  run  call "${SOAPUI_PATH}" -a -j -I -f"..\\results" -c"${TC_NAME}" -P${PROJECT_PARAM} ${project_XML}
    log  ${output}
    Get SoapUI logs  ${TC_NAME}
    ${output2}=  run  call cd .. && cd results && move TEST-*.xml ${TC_NAME}.xml
    should contain  ${output}  status: FINISHED

Run API test with custom SoapUI settings
    [Documentation]  Spusteni SoapuUI testu , neposílá konfiguracni soubor \\soapui\\soapui-settings.xml , ${PROJECT_PARAM} lze do SoapUI dostat další hodnoty. napr: 'jmenoPromenne="hodnota"'
    [Arguments]  ${SOAPUI_PATH}  ${SOAPUI_SETTINGS}  ${PROJECT_PARAM}  ${project_XML}  ${TC_NAME}
    Create File   ..\\common\\${TC_NAME}.txt  Prazdny logovaci soubor

    ${output}=  run  call "${SOAPUI_PATH}" -a -j -I -f"..\\results" -c"${TC_NAME}" -P${PROJECT_PARAM} -t"${SOAPUI_SETTINGS}" ${project_XML}
    log  ${output}
    Get SoapUI logs  ${TC_NAME}
    ${output2}=  run  call cd .. && cd results && move TEST-*.xml ${TC_NAME}.xml
    should contain  ${output}  status: FINISHED


Get SoapUI logs
    [Documentation]  subrutina pro zpracovani TXT souboru, ktere jsou vysledkem behu SOAPUI testu
    [Arguments]  ${TC_NAME}
    ${TextFileContent}=    Get File    ..\\common\\${TC_NAME}.txt  encoding=UTF-8    encoding_errors=replace
    Log    ${TextFileContent}
    @{files}=	List Files In Directory	 ..\\results	*${TC_NAME}*.txt	absolute
    :FOR   ${file}  IN  @{files}
    \   ${TextFileContent}=    Get File    ${file}  encoding=UTF-8  encoding_errors=replace
    \   Log    ${TextFileContent}


Get URL auth page for aggr api
    [Documentation]  SOAPUI test pro aggr api ulozi do souboru auth_url.txt  URL, co nam vrati AUTH endpoint
    ${TextFileContent}=    Get File    ..\\common\\auth_url.txt  encoding=UTF-8    encoding_errors=replace
    Log    ${TextFileContent}
    [return]  ${TextFileContent}

Get AccessToken for aggr api
    [Documentation]  SOAPUI test pro aggr api ulozi do souboru token.txt  AccessToken, co se vrátil po swapu z codu
    ${TextFileContent}=    Get File    ..\\common\\token.txt  encoding=UTF-8    encoding_errors=replace
    Log    ${TextFileContent}
    [return]  ${TextFileContent}