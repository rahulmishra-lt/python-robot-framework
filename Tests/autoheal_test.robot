*** Settings ***

Resource  ../Resources/AutoHealCommon.robot

*** Variables ***
${TIMEOUT}    3000

*** Test Cases ***

AutoHeal Base Test Without Changed DOM
    [Documentation]    Test login form without changing DOM IDs - AutoHeal enabled but not triggered
    [Timeout]    ${TIMEOUT}
    [Setup]    Open AutoHeal Browser With AutoHeal Enabled    AutoHeal Base Test Without Changed DOM
    [Teardown]    Close AutoHeal Browser
    
    Execute Step Context    AutoHealWithoutDomChanged-Login Case    info
    
    Fill Login Form    test@gmail.com    password
    Click Submit Button

AutoHeal False With Changed DOM
    [Documentation]    Test login form after changing DOM IDs - AutoHeal DISABLED (test will fail to find elements)
    [Timeout]    ${TIMEOUT}
    [Setup]    Open AutoHeal Browser With AutoHeal Disabled    AutoHeal False With Changed DOM
    [Teardown]    Close AutoHeal Browser
    
    Execute Step Context    AutoHealFalse-DomChanged-Login Case    info
    
    Click Change DOM ID Button
    
    Fill Login Form    test@gmail.com    password
    Click Submit Button

AutoHealed With Changed DOM
    [Documentation]    Test login form after changing DOM IDs - AutoHeal ENABLED (test will pass due to auto-healing)
    [Timeout]    ${TIMEOUT}
    [Setup]    Open AutoHeal Browser With AutoHeal Enabled    AutoHealed With Changed DOM
    [Teardown]    Close AutoHeal Browser
    
    Execute Step Context    AutoHealDomChanged-Login Case    info
    
    Click Change DOM ID Button
    
    Fill Login Form    test@gmail.com    password
    Click Submit Button
