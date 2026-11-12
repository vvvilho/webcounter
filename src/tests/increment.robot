*** Settings ***
Resource  resource.robot
Suite Setup  Open And Configure Browser
Suite Teardown  Close Browser

*** Test Cases ***
At start the counter is zero
    Go To  ${HOME_URL}
    Get Title  ==  Laskuri
    Get Text  body  *=  nappia painettu 0 kertaa

When button pressed twice the counter is two
    Go To  ${HOME_URL}
    click  button >> text=Nollaa
    Click  button >> text=Paina
    Click  button >> text=Paina
    Get Text  body  *=  nappia painettu 2 kertaa

When reset button pressed the counter is zero
    Go To  ${HOME_URL}
    click  button >> text=Nollaa
    Click  button >> text=Paina
    Click  button >> text=Paina
    Click  button >> text=Nollaa
    Get Text  body  *=  nappia painettu 0 kertaa

When set button pressed the counter is set to the given value
    Go To  ${HOME_URL}
    click  button >> text=Nollaa
    Fill Text  input[name="new_value"]  10
    Click  button >> text=Aseta
    Get Text  body  *=  nappia painettu 10 kertaa
