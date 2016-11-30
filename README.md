# playersWebService
Simple web-service, made with WCF. Laboratory work.

Queries online - GET:

http://playerslab.cloudapp.net/Service1.svc/players - returns all players in JSON.
http://playerslab.cloudapp.net/Service1.svc/players?nameQuery={name} - returns all players with name.Contains({name}). 

POST:

http://playerslab.cloudapp.net/Service1.svc/addPlayer - inserts player into database. Requires json body with 3 string parameters: Name, Sports and Country. Returns result of insertion.
