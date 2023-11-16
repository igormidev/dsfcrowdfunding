# Systems integration to make pix donation
Quick flowchart documentation about how a pix donation will work and all participants of this operation and there respective function in the flow.

## Coverage of how crowdfunding screen will work.
This is the same flow in the web and mobile. Since this crowdfunding page package will be is in the app as a package dependency and in the web version app as well.

```mermaid 
sequenceDiagram  
    participant UBA as User bank app
    actor USER as Donor
    participant CR as Crowdfunding Page (in web or app)
    link CR: Source @ https://github.com/dreamstock/dsf-web-v3
    participant API as API (API v3) 
    participant MP as Mercadopago API
    participant DB as Database

    USER->>CR: User enters crowdfunding page
    CR->>API: Request json data of crowdfunding at route:<br>https://api.dsfootball.io/v2/crowdfunding/:id
    API-->>CR: Required data to build screen
    CR->>USER: Build screen with<br>crowdfunding data
    USER->>USER: User selects a value to donate
    USER->>USER: User type all required textfields with<br>- name<br>- email<br>- description<br>-document (CPF)
    USER-->>CR: User click in donate with pix button
    CR->>CR: Transform the data that the user inputed<br>to a json that the api will use to <br>build it's request to mercado pago api
    CR->>API: Request the pix qrcode text at route:<br>https://api.dsfootball.io/v2/crowdfunding/:id/pay
    API->>MP: Create pix intent at route:<br>https://api.mercadopago.com/v1/payments<br>The pix intent is created with 5<br>minutes of time to expirate
    MP-->>API: Return full json with payment intent
    API-->>API: Will save the "id" of this<br>payment intent to check<br>later it's status 
    par Flow of user macking payment in it's personal bank app by scaning the QR Code
        API-->>CR: Return's only transaction_data.qr_code field<br>from json. That is the Pix QRCode intent text.
        CR->>USER: Display to the user an QR Code<br>with the pix intent string and<br>option to copy pix intent string.
        USER->>UBA: User open's the bank<br>app and go to pix section
        UBA->>CR: App bank scan the QR code or paste<br>the pix intent string in pix payment section
        CR-->>UBA: Retrives the pix payment intent text string
        UBA->>USER: Ask the user password<br>to make payment
        USER-->>UBA: User types the screen
        UBA-->>UBA: Process payment
        UBA-->>UBA: Transfer user money<br>to the pix intent owner
        UBA->>USER: Returns a "Success"<br>message to the user
        UBA->>USER: User wait's a little so hes name<br>appears as a donater in the<br>crowdfunding page in app/site
    and Flow of api 
        API->>API: API wait 5 minutes to<br>finalize the maximum time that<br>the user has to pay<br>(after that time the pix<br>intent text will expire)
        API->>MP: Will check payment status<br>with the saved "id" of the<br>payment intent at route:<br>https://api.mercadopago.com/v1/payments
        MP-->>API: Returns the status of the payment
        alt User had paid and payment intent is "aproved" 
            API-->>DB: Save donater info in database
            Note over API,DB: This data is necessesary<br>to be saved by the api<br>because the frontend will need<br>this data to build a widget that<br>will show who already had<br>donated to that crowdfunding.<br>This data will be obtained<br>by the frontend in the route:<br>https://api.dsfootball.io/v2/crowdfunding/:id
            API->>API: Finalize execution
        else User DID NOT paid and payment intent is "aproved"
            API->>API: Do nothing and finalize execution
        end
    end 
    API->>API: Do nothing and finalize execution
```

### Useful resources:
[Click here](https://github.com/igormidev/dsfcrowdfunding.github.io/blob/master/docs/json_examples/crowdfunding_data_example.json) to see a example of `https://api.dsfootball.io/v2/crowdfunding/:id`` response.