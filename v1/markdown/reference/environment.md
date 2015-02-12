### Environment

#### List environment variables of an app

```
curl -H "Accept: application/json" -H "Content-Type: application/json" -X GET -u :$AUTH_TOKEN https://api.scalingo.com/v1/apps/[:app]/variables
```

Returns 200 OK 
```
{
    "variables": [
        {
            "id": "541013a9736f7563d5050000",
            "name": "MONGO_URL",
            "value": "mongodb://user:password@host:port/db"
        },
        {
            "id": "54101384736f7563d5040000",
            "name": "RAILS_PRODUCTION",
            "value": "production"
        }
    ]
}
```

#### Add environment variables to an app

```
curl -H "Accept: application/json" -H "Content-Type: application/json" -X POST -d '{"variable": {"name":"RAILS_ENV", "value":"production"}}' -u :$AUTH_TOKEN https://api.scalingo.com/v1/apps/[:app]/variables
```

Returns 201 Created
```json
{
    "variable": {
        "id": "541013a9736f7563d5050000",
        "name": "MONGO_URL",
        "value": "mongodb://user:password@host:port/db"
    }
}
```

#### Update an environment variable

```
curl -H "Accept: application/json" -H "Content-Type: application/json" -X PATCH -d '{"variable": {"value":"staging"}}' -u :$AUTH_TOKEN https://api.scalingo.com/v1/apps/[:app]/variables/[:variable_id]
```

Returns 200 OK
```json
{
    "variable": {
        "id": "54101384736f7563d5040000",
        "name": "RAILS_PRODUCTION",
        "value": "staging"
    }
}
```

#### Delete an environment variable

```
curl -H "Accept: application/json" -H "Content-Type: application/json" -X DELETE -u :$AUTH_TOKEN https://api.scalingo.com/v1/apps/[:app]/variables/[:variable_id]
```

Returns 204 No Content

