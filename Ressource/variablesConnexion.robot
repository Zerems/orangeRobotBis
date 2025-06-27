*** Variables ***
#Connexions
${LOGIN_URL}    https://www.saucedemo.com/
${BROWSER}    firefox
${WELCOME_URL}    https://www.saucedemo.com/inventory.html
${INPUT_USERNAME}    xpath://*[@id="user-name"] 
${INPUT_PASSWORD}    xpath://*[@id="password"]     
${SUBMIT_BUTTON}    xpath://*[@id="login-button"]
${VALID_USER}    standard_user
${INVALID_USER}    locked_out_user
${VALID_PASSWORD}      secret_sauce 
${ERROR_WINDOW}    css=[data-test="error-button"]