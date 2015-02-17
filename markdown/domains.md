# Domains

The domains represent the custom domain names defined for your applications.
For instance, the alias `www.example.com` of `example-app.scalingo.io` will
result in the presence of one resource domain.

--- row ---

**Keys attributes**

{:.table}
| field                | type                                                              |
| -------------------- | ----------------------------------------------------------------- |
| id                   | unique ID of the domain                                           |
| name                 | hostname your want to associate with the app                      |
| tlscert (read)       | subject of the submitted certificate                              |
| tlscert (write)      | content of the SSL certificate you want to use                    |
| tlskey (read)        | private key type and length                                       |
| tlskey (write)       | content of the private key used to generate the certificate       |
| ssl (read-only)      | flag if SSL with a custom certificate is enabled                  |
| validity (read-only) | once a certificate has been submitted, display the validity of it |

||| col |||

Example object

```json
{
  "id": "541067ec736f7504a5110000",
  "name": "example.com",
  "ssl": true,
  "tlscert": "/C=FR/ST=Some-State/O=Internet Widgits Pty Ltd/CN=example.com",
  "tlskey": "RSA private key - 2048 bytes",
  "validity": "2015-08-05T19:57:21.000+02:00"
}
```

--- row ---

## List all the domains of an application

--- row ---

`GET https://api.scalingo.com/v1/apps/[:app]/domains`

||| col |||

Example request

```sh
curl -H "Accept: application/json" -H "Content-Type: application/json" -u :$AUTH_TOKEN \ 
 -X GET https://api.scalingo.com/v1/apps/example-app/domains
```

Returns 200 OK

```json
{
    "domains": [
        {
            "id": "541067f7736f7504a5140000",
            "name": "example2.com",
            "ssl": false
        },
        {
            "id": "541067ec736f7504a5110000",
            "name": "example.com",
            "ssl": true,
            "tlscert": "/C=FR/ST=Some-State/O=Internet Widgits Pty Ltd/CN=example.com",
            "tlskey": "RSA private key - 2048 bytes",
            "validity": "2015-08-05T19:57:21.000+02:00"
        }
    ]
}
```

--- row ---

## Show a specific domain of an application

--- row ---

`GET https://api.scalingo.com/v1/apps/[:app]/domains/[:domain_id]`

||| col |||

Example request

```sh
curl -H "Accept: application/json" -H "Content-Type: application/json" -u :$AUTH_TOKEN \
 -X GET https://api.scalingo.com/v1/apps/example-app/domains/541067ec736f7504a5110000
```

Returns 200 OK

```json
{
    "domain": {
        "id": "541067ec736f7504a5110000",
        "name": "example.com",
        "ssl": false
    }
}
```

--- row ---

## Unlink a domain name from an application

--- row ---

`DELETE https://api.scalingo.com/v1/apps/[:app]/domains/[:domain_id]`

Disassociate instantly a domain name with an app. If the domain is still
[CNAME-ed](http://doc.scalingo.com/app/domain), it will respond with a 404 error.

||| col |||

Example request

```sh
curl -H "Accept: application/json" -H "Content-Type: application/json" -u :$AUTH_TOKEN \
  -X DELETE https://api.scalingo.com/v1/apps/example-app/domains/541067ec736f7504a5110000
```

Returns 204 No Content

--- row ---

## Link a domain name to an application

`POST https://api.scalingo.com/v1/apps/[:app]/domains`

Parameters

* `domain.name`: Hostname you want to add
* `domain.tlscert` - optional: SSL Certificate you want to associate with the domain
* `domain.tlskey` - optional: Private key used to create the SSL certificate

If the certificate or the key is not valid, a 422 "unprocessable entity" is returned
Otherwise return 201

||| col |||

Request example (without SSL):

```sh
curl -H "Accept: application/json" -H "Content-Type: application/json" -u :$AUTH_TOKEN \
  -X POST https://api.scalingo.com/v1/apps/example-app/domains -d \
  '{
    "domain" : {
      "name" : "example.com"
    }
  }'
```

Returns 201 Created

```json
{
    "domain": {
        "id": "541067ec736f7504a5110000",
        "name": "example.com",
        "ssl": false
    }
}
```

Request example (with SSL):

```sh
curl -H "Accept: application/json" -H "Content-Type: application/json" -u :$AUTH_TOKEN \
  -X POST https://api.scalingo.com/v1/apps/example-app/domains -d \
  '{
    "domain" : {
      "name" : "example.com",
      "tlscert" : "<cert>",
      "tlskey" : "<key>"
     }
   }'
```

Returns 201 Created

```json
{
    "domain": {
        "id": "541067ec736f7504a5110000",
        "name": "example.com",
        "ssl": true,
        "tlscert": "/C=FR/ST=Some-State/O=Internet Widgits Pty Ltd/CN=example.com",
        "tlskey": "RSA private key - 2048 bytes",
        "validity": "2015-08-05T19:57:21.000+02:00"
    }
}
```

--- row ---

## Update a domain name

--- row ---

`PATCH https://api.scalingo.com/v1/apps/[:app]/domains/[:domain_id]`

Parameters

* `domain.tlscert` - optional: SSL Certificate you want to associate with the domain
* `domain.tlskey` - optional: Private key used to create the SSL certificate

As you may have noticed you can't update the name itself, instead of modifying it juste
create another Domain and delete the one you wanted to modify.

||| col |||

Example request

```sh
curl -H "Accept: application/json" -H "Content-Type: application/json" -u :$AUTH_TOKEN \
  -X PATCH https://api.scalingo.com/v1/apps/example-app/domains/541067ec736f7504a5110000 -d \
  '{
    "domain" : {
      "tlscert" : "<cert>",
      "tlskey" : "<key>"
    }
  }' 
```

Returns 200 OK

```json
{
    "domain": {
        "id": "541067ec736f7504a5110000",
        "name": "example.com",
        "ssl": true,
        "tlscert": "/C=FR/ST=Some-State/O=Internet Widgits Pty Ltd/CN=example.com",
        "tlskey": "RSA private key - 2048 bytes",
        "validity": "2015-08-05T19:57:21.000+02:00"
    }
}
```
