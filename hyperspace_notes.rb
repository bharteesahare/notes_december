EasyEcomService.get_order_details(User.find(21).ee_token,{order_id: "146888511"})

2.6.5 :034 > user = User.find(21)
  User Load (0.8ms)  SELECT "users".* FROM "users" WHERE "users"."id" = $1 LIMIT $2  [["id", 21], ["LIMIT", 1]]
 => #<User id: 21, email: "ps8179@gmail.com", name: "Mahindra Jayavaram", status: "Confirmed", mobile_number: "8109560498", country_code: "+91", full_mobile_number: "+918109560498", password_digest: [FILTERED], verification_id: "VEb09bc44e5aadaa962c20dbb3e5688801", service_sid: "VAbfaef3f1cd0ee6eeaaf7cc3c1666eb25", email_confirmation_otp: [FILTERED], email_verified: false, currency: "INR", country: "India", ee_token: [FILTERED], onboarding_done: true, ee_status: nil, c_id: nil, easy_ecom_password: [FILTERED], connect_brand: nil>
2.6.5 :035 > user = User.find(21).ee_token
  User Load (0.6ms)  SELECT "users".* FROM "users" WHERE "users"."id" = $1 LIMIT $2  [["id", 21], ["LIMIT", 1]]
 => "9d0b7c5ba4b2052fc2f0f65047b17a9b58d8f63fb1ff3fe9e71e9e7d68ffc593"

 https://api.easyecom.io/orders/V2/getOrderDetails?api_token=c44c852b0abcf2d7a9982a50e8144fffbd751e3f39b1bab4818f1618270a7d35&invoice_id=180258353

api_token = user.ee_token


task:
update the easycom data in ruby on rails.
https://api.easyecom.io/orders/V2/getAllOrders?api_token=c44c852b0abcf2d7a9982a50e8144fffbd751e3f39b1bab4818f1618270a7d35&start_date=2023-10-01&end_date=2023-10-07 00:00:00&limit=250

{{BaseURL}}/Credentials/addCarrierCredentials

Mandetory field
invoiceId	Integer	Enter invoice id of EasyEcom which will get in the response of "createorder" function.	Yes	NA
courier	String	Enter the Actual Courier Name	Yes	NA
awbNum	String	Enter AWB Number to be assigned	Yes	NA
companyCarrierId	Integer	Enter company carrier id received in the response of addCarrierCredentials API	Yes	NA


xpresspressbess webhook:

require 'openssl'
require 'base64'

data = '{ "awb_number": "123123123123", "status": "in transit(out for delivery)", "event_time": "2021-02-26 16:19:59", "location": "Hyderabad", "message": "Reached at nearest hub", "rto_awb": "" }'
secret_key = 'hyperspace'

# Calculate HMAC-SHA256 hash
digest = OpenSSL::HMAC.digest('sha256', secret_key, data)

# Encode the digest in Base64
hash = Base64.encode64(digest).strip

puts hash


s = Shipment.new(user_id: @current_user.id , awb_number: "11112222460" ,order_id: params[:client_order_id] ,  amount: order.total_amount , delivery_partner_id: partner_find.id , label_url: nil)


steps for test the hyperspace status update in xpressbess:
1. create the order in the easycom.
2. IN the mission go hyperspace do the assign to confirm.
3. call the assign partner apis assign the partner and update in the easycom as well as the our db.(update awb number)
4. For xpresswebhook controller hash purpose we run the base64 script and genrate the sha256 hash.
5. This hash need to pass in the call xpressbees_webhook api(based on the awb number, we update the status in our db as well as the easycom.)


Hyperspcece  task:
