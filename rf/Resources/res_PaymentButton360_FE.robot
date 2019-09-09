*** Settings ***
Resource  ../Resources/common.robot

*** Keywords ***

Create link and open browser
    [Arguments]  ${dataset}
    ${testdata}  Load data from JSON  ${dataset}  ./Resources/link_testdata.json
    set test variable  ${amount}  ${test_data["amount"]}
    set test variable  ${order}   ${test_data["varsymbol"]}
    ${link}  Create the link  ${testdata}
    Log   ${link}

   ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
   Call Method    ${options}    add_argument    --start-maximized
   Call Method    ${options}    add_experimental_option  useAutomationExtension  ${False}
   Create WebDriver    Chrome    chrome_options=${options}
   Go To  ${link}


#   open browser  ${link}  chrome

Create the link
    [Arguments]  ${testdata}

    ${link}  set variable  ${test_data["payment_url"]}?shopid=${test_data["shopid"]}&amount=${test_data["amount"]}&varsymbol=${test_data["varsymbol"]}&priority=${test_data["priority"]}&url=${test_data["app_url"]}&sign=${test_data["sign"]}
    [Return]  ${link}

Choose the bank
     [Arguments]  ${bankId}
     wait until page contains element  //img[contains(@src,${bankId})]  timeout=15s
     click element  //img[contains(@src,${bankId})]

Check amount
    [Arguments]  ${amount}
    wait until page contains  ${amount},- CZK  timeout=30s

Check number of order
    [Arguments]  ${num}
    wait until page contains  ${num}

Choose account
    [Arguments]  ${accNum}
    wait until page contains element  //div[contains(@class,"select-form")]
    click element  //div[contains(@class,"select-form")]
    wait until keyword succeeds  10  1s  click element  //small[contains(text(),"${accNum}")]

Check enough money on account
    Wait until page contains  dostatek finančních prostředků

Check not enough money on account
    Wait until page contains  nemáte dostatek finančních prostředků

Agree with permissions
    click element  //input[@id="agreementChboxDesktop"]
    wait until keyword succeeds  10  1s  page should not contain element  //div[contains(@class,"disabled")]

Choose option button
    [Documentation]  Ovládání výběrových tlačítek na stránce platby
    ...              Možnosti: Zrušit/Zvolit/Potvrdit

    [Arguments]  ${label}
    wait until page contains element  //div[contains(text(),"${label}")]
    click element  //div[contains(text(),"${label}")]

Check confirmation page
    wait until page contains  Založení domácí platby  timeout=20s
    wait until page contains  ${amount}
    wait until page contains  ${order}

Check moneta login
    wait until page contains  Pro potvrzení platebního příkazu je nutné se nejprve přihlásit



