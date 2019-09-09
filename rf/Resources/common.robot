*** Settings ***
Library  Selenium2Library

*** Keywords ***
Closing the application
   close all browsers

Show access token
    log    Zjistene tokeny/cody ulozeny v adresari Common

Load data from JSON
    [Arguments]  ${set}   ${json_file}
    ${json}=     Get file    ${json_file}
    ${data_object}=      evaluate  json.loads('''${json}''')     json
    ${hex} 	 Evaluate  random.randint(1, 20)	      modules=random
    ${set}   set variable if    "${set}"=="random"    TCpoz${hex}
    ...                         "${set}"!="random"   ${set}
    ${test_data}  set variable   ${data_object["${set}"]}
    [Return]   ${test_data}

Open chrome in virtualmachine

    [Arguments]  ${START_URL}

   ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
   # use proxy for Firefox (zmena pro cviceni G5)
   ${proxy}=              Evaluate      sys.modules['selenium.webdriver'].Proxy()  sys, selenium.webdriver
   ${proxy.http_proxy}=   Set Variable  proxy.csin.cz:8080
   ${proxy.https_proxy}=  Set Variable  proxy.csin.cz:8080
   #Create Webdriver       Firefox       proxy=${proxy}
   Call Method    ${options}    add_argument    --start-maximized
   Call Method    ${options}    add_experimental_option  useAutomationExtension  ${False}
   Create WebDriver    Chrome    chrome_options=${options}  #proxy=${proxy}
   Go To  ${START_URL}