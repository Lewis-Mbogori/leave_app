# Comprehensive Guide to HTTP Headers
## Introduction to HTTP Headers
HTTP headers are key-value pairs sent between the client and server. They provide additional information about the request or response, such as content type, authentication details, and more. Understanding headers is crucial for making authenticated requests and handling data correctly.

## Common HTTP Headers
- Authorization: Used for authentication purposes.

```
 "Authorization": "Bearer your_token_here"
 ```
- Content-Type: Indicates the media type of the resource.

````
 "Content-Type": "application/json"
 ```
User-Agent: Contains information about the client making the request.

````
 "User-Agent": "YourAppName/1.0"
 ```
Accept: Informs the server about the types of data the client can process.

````
 "Accept": "application/json"
 ```
Origin: Specifies the origin of the request, used in CORS.

````
 "Origin": "http://example.com"
 ```
Access-Control-Allow-Origin: Specifies the origins allowed to access the resource, used in CORS responses.

````
 "Access-Control-Allow-Origin": "*"
 ```