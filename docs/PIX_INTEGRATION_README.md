# How to create a pix with MP (Mercado Pago) using it's REST-API

### Backend Goal's:
1. Return the string with the `identification of the pix intention` in Central Bank of Brazil.
2. Check periodically if the payment has been done and, if done, register in own database the name of the user that made the donation. This information will be used be used by the front-end later to display the name of the contributors of the crowdfunding.

### Frontend Goal's:
1. Display the `identification of the pix intention` in a QR CODE so the user can scan it in his bank app.
2. Give the option to copy the `identification of the pix intention` so the user can paste it in his bank app.

### Implementation:

> Note: All parametters are `required`. Only required fields are listed bellow.

First request:
The back end will need to made 2 request to MP api;
The first one is to create a pix payment intention in the Central Bank of Brazil. To do that, we will call the route: `https://api.mercadopago.com/v1/payments`

# Headers
In the header of this request we need to pass the Authorization token as a 
`Bearer ACCESS_TOKEN`
I have generated a Token for me, you can use if for testing if you want 
@shotaro:
TEST-2835172033649619-110612-
a807b51c073a1f9e71a17abc840013a8-201143787
But @marcelo needs to create an account in mercado pago and give a 
production access token.
Also, using my test access token you will not be able to see the payments in the 
mercado panel.
Other header we need to pass is the `X-Idempotency-Key`. This is to avoid 
duplication of transactions. 
This string can be any text, but this has to be a unique text and has to be 
different for each transaction.
I suggestion using a UUID v4 - example: 0d5020ed-1af6-469c-ae06-
c3bec19954bb

![x idempotency key](https://github.com/igormidev/dsfcrowdfunding.github.io/blob/master/docs/images/x_idempotency_key.png?raw=true)

# Body (json)
* transaction_amount: <br>
The price of the pix in Brazilian Real ( R$ ).
* payment_method_id: <br>
Hardcoded string `pix`.
* payer:<br>
a model with data of the payer (all of it will be gived by the frontend)
* payer.email:<br>
The email of the user. The front end will give this data to the api. The user will 
type this data.
* payer.first_name:<br>
The first name of the user. The front end will give this data to the api. The user 
will type this data.
* payer.last_name:<br>
The first name of the user. The front end will give this data to the api. The user 
will type this data.
* payer.identification:<br>
The identification that the Central Bank of Brazil will use to know who is the 
payment beeing created for.
* payer.identification.type:<br>
Fixed hardcoded text with "CPF". This is the type of the documentation. In 
Brazil, CPF is a document that identifies a person in Brazil.
* payer.identification.number:<br>
The name of the CPF documentation. The front end will give this data to the 
api. The user will type this data.
* payer.date_of_expiration:<br>
I did not test this, but i think you can put a maximum that the user can pay. For example, limit of 5 minutes.

* description:<br>
![description](https://github.com/igormidev/dsfcrowdfunding.github.io/blob/master/docs/images/description.png?raw=true)

## Response:
Of response, we will use the field transaction_data => qr_code.
Example of `qr_code` text:
00020126580014br.gov.bcb.pix0136b76aa9c2-2ec4-4110-954e-
ebfe34f05b61520400005303986540510.905802BR5916WQeDgIUxgfUL
UBcI6009Sao Paulo62230519mpqrinter13158058466304CDD0
Now you will return this text to the front-end. And the front-end will display this 
exact string in the QR Code and to give the option of the user to copy and 
paste in it's bank app.
Also, we will use the field id to later on verify the status of the payment.
Example of id: 1315805846

## ℹ️ Generating a pix payment intent EXAMPLE
I wan't to attach some examples here<br>
So here is a REAL example of http request in a curl format

```curl
curl --request POST \
  --url https://api.mercadopago.com/v1/payments \
  --header 'Authorization: Bearer TEST-2835172033649619-110612-a807b51c073a1f9e71a17abc840013a8-201143787' \
  --header 'Content-Type: application/json' \
  --header 'X-Idempotency-Key: 0d5020edabc-1af6-469c-ae06-c33bec19954bb' \
  --data '{
	"transaction_amount": 10.9,
  "description": "Sucesso, sobrinho!",
	"payment_method_id": "pix", 
  "payer": { 
    "email": "test_user_123@testuser.com",
		"first_name": "Igor",
		"last_name": "Miranda Souza",
    "identification": {
      "type": "CPF",
      "number": "95749019047"
    }
  }
}'
```

> You can se a example of a response of this url by [clicking here](https://github.com/igormidev/dsfcrowdfunding.github.io/blob/master/docs/json_examples/pix_payment_check_example.json)

## Backend-frontend integration proposal
We can create a POST route like, for example:<br>
payment/get-pix-qrcode-text
> full route in api:<br>https://api.dsfootball.dev/payment/get-pix-qrcode-text

Response will be the string of the pix identifier we talked above.<br>
The body will be:
```
{
  "transaction_amount":  20,
  "description": "Sucesso, sobrinho!",
  "email": "test_user_123@testuser.com",
  "fullname": "Igor Miranda Souza",
  "document": "95749019047"
}
```
With this you will have all data needed from front-end to generate the pix payment intention.<br>
The amount can bee 5, 10, 20, 50, 100 or 200.<br>
Those are the values the designer putted so we will only work with them.<br>
Print of the design bellow:<br>
![quantity selection](https://github.com/igormidev/dsfcrowdfunding.github.io/blob/master/docs/images/quantity_selection.png?raw=true)

### Second request:
This will not envolve front-end.<br>
After creating the qr code, the user will need to open the bank's app and scan the qr code or paste the payment identifier.<br>
That can take a while. So the API can verify if the payment has been done.<br>
This can be done, for exemple, after 5 minutes. And if the payment is aproved, we will add in own database the name of the user that made the donation.<br>
This information will be used be used by the front-end later to display the name of the contributors of the crowdfunding as you can see in the print bellow:<br>
![donaters](https://github.com/igormidev/dsfcrowdfunding.github.io/blob/master/docs/images/donaters.png?raw=true)

### How to verify the status?
We will use the id field that we got from the previous to get the status of that transaction<br>
To do that, we will call the GET route:
`https://api.mercadopago.com/v1/payments/:id`

Replace `":id"` with the id of the field.
Remember to use Authorization Bearer
Then, you will look to the field "status"
If it's "pending", the user did not made the payment yet.
If it's "approved", you can save the name of the user as a contributor of the 
crowdfunding.<br>

To be honest there is a lot of status... But I think that the only status that really 
matters for us is if the payment is approved. As curiosity I will put a print bellow 
of the other status...

![payment status](https://github.com/igormidev/dsfcrowdfunding.github.io/blob/master/docs/images/payment_status.png?raw=true)

reference:<br>
https://www.mercadopago.com.br/developers/en/docs/prestashop/sales-processing/go-to-production

PS: Maybe the user will never make the payment, that's why I mentioned the field date_of_expiration in the body of the create payment intent request.<br>
You can put the limit of 5 minutes and after 5 minutes check if the user had 
paid or not. In the front-end I can put a timer of 5 minutes to indicate the user 
that he have a period of time to pay that QR Code.

## Checking a pix payment intent status EXAMPLE
About checking a pix payment intent status: I wan't to attach some examples here.<br>
So here is a REAL example of http request in a curl format

```curl
curl --request GET \
  --url https://api.mercadopago.com/v1/payments/1315805140 \
  --header 'Authorization: Bearer TEST-2835172033649619-110612-a807b51c073a1f9e71a17abc840013a8-201143787' \
  --header 'Content-Type: application/json'
```
> You can se a example of a response of this url by [clicking here](https://github.com/igormidev/dsfcrowdfunding.github.io/blob/master/docs/json_examples/pix_intent_status_example.json)