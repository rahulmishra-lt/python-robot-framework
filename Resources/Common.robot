*** Settings ***
Library  SeleniumLibrary
Library  LambdaTestStatus.py

*** Variables ***
${BROWSER}          ${ROBOT_BROWSER}
&{options}          browserName=${browserName}     platformName=${platform}       browserVersion=${version}       
${REMOTE_URL}       http://%{LT_USERNAME}:%{LT_ACCESS_KEY}@hub.lambdatest.com/wd/hub
${TIMEOUT}          3000
${LT_OPTIONS}       { "LT:Options": {"visual": "${visual}", "network": "${network}", "console": "${console}", "name": "RobotFramework Lambda Test"} }

*** Keywords ***
Open test browser
    [Timeout]   ${TIMEOUT}
    Open browser  https://lambdatest.github.io/sample-todo-app/  browser=${BROWSER}
    ...  remote_url=${REMOTE_URL}
    ...  options=${LT_OPTIONS}

Close test browser
    Run keyword if  '${REMOTE_URL}' != ''
    ...  Report Lambdatest Status
    ...  ${TEST_NAME}
    ...  ${TEST_STATUS}
    Close all browsers
