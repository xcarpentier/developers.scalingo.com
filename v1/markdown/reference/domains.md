### Domains

#### List domain names for an app

```
curl -k -H "Accept: application/json" -H "Content-Type: application/json" -u :$AUTH_TOKEN https://api.scalingo.com/v1/apps/[:app_id]/urls

http --auth :$AUTH_TOKEN https://api.scalingo.com/v1/apps/[:app_id]/urls
```

Returns 200 OK

```json
{
    "urls": [
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

#### Show a specific domain name of an app

```
curl -k -H "Accept: application/json" -u :$AUTH_TOKEN https://api.scalingo.com/v1/apps/[:app_id]/urls/[:url_id]
curl -k -H "Accept: application/json" -H "Content-Type: application/json" -u :$AUTH_TOKEN https://api.scalingo.com/v1/apps/[:app_id]/urls/[:url_id]

http --auth :$AUTH_TOKEN https://api.scalingo.com/v1/apps/[:app_id]/urls/[:url_id]
```

Returns 200 OK

```json
{
    "url": {
        "id": "541067ec736f7504a5110000",
        "name": "example.com",
        "ssl": false
    }
}
```

#### Unlink a domain name from an app

```
curl -k -H "Accept: application/json" -H "Content-Type: application/json" -X DELETE -u :$AUTH_TOKEN https://api.scalingo.com/v1/apps/[:app_id]/urls/[:url_id]

http --auth :$AUTH_TOKEN DELETE https://api.scalingo.com/v1/apps/[:app_id]/urls/[:url_id]
```

Returns 204 No Content

#### Create a domain name for an app __without__ SSL

```
curl -k -H "Accept: application/json" -H "Content-Type: application/json" -X POST -d '{"url": {"name": "example.com"}}' -u :$AUTH_TOKEN https://api.scalingo.com/v1/apps/[:app_id]/urls

http --auth :$AUTH_TOKEN POST https://api.scalingo.com/v1/apps/[:app_id]/urls 'url:={"name":"example.com"}
```

Returns 200 OK

```json
{
    "url": {
        "id": "541067ec736f7504a5110000",
        "name": "example.com",
        "ssl": false
    }
}
```

#### Create a domain name for an app __with__ SSL

```
curl -k -H "Accept: application/json" -H "Content-Type: application/json" -X POST -d '{"url": {"name": "example.com", "tlscert": "<cert>", tlskey: "<key>"}}' -u :$AUTH_TOKEN https://api.scalingo.com/v1/apps/[:app_id]/urls

http --auth :$AUTH_TOKEN POST https://api.scalingo.com/v1/apps/[:app_id]/urls 'url:={"name":"example.com", "tlscert":"<cert>", "tlskey":"<key>"}'
```

If the certificate or the key is not valid, a 422 "unprocessable entity" is returned
Otherwise return 201

```json
{
    "url": {
        "id": "541067ec736f7504a5110000",
        "name": "example.com",
        "ssl": true,
        "tlscert": "/C=FR/ST=Some-State/O=Internet Widgits Pty Ltd/CN=example.com",
        "tlskey": "RSA private key - 2048 bytes",
        "validity": "2015-08-05T19:57:21.000+02:00"
    }
}
```

#### Update a domain name (SSL certificate only, no update of name)

```
curl -k -H "Accept: application/json" -H "Content-Type: application/json" -X PATCH -d '{"url": { "tlscert": "<cert>", "tlskey": "<key>"}}' -u :$AUTH_TOKEN https://api.scalingo.com/v1/apps/[:app_id]/urls/[:url_id]

http --auth :$AUTH_TOKEN PATCH https://api.scalingo.com/v1/apps/[:app_id]/urls/[:url_id] 'url:={"tlscert": "<cert>", "tlskey":"<key>"}'
```

Returns 200 OK

```json
{
    "url": {
        "id": "541067ec736f7504a5110000",
        "name": "example.com",
        "ssl": true,
        "tlscert": "/C=FR/ST=Some-State/O=Internet Widgits Pty Ltd/CN=example.com",
        "tlskey": "RSA private key - 2048 bytes",
        "validity": "2015-08-05T19:57:21.000+02:00"
    }
}
```



