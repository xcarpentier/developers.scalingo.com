# Environment variable

--- row ---

**Environment variable attributes**

{:.table}
| field      | type                  |
| ---------- | --------------------- |
| id         | unique ID of variable |
| name       | name                  |
| value      | value                  |

--- row ---

## List environment variables of an app

--- row ---

`GET https://api.scalingo.com/v1/apps/[:app]/variables`

||| col |||

Example

```shell
curl -H "Accept: application/json" -H "Content-Type: application/json" -X GET -u :$AUTH_TOKEN https://api.scalingo.com/v1/apps/[:app]/variables
```

Returns 200 OK

Response

```json
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

--- row ---

## Add environment variables to an app

--- row ---

`POST https://api.scalingo.com/v1/apps/[:app]/variables`

||| col |||

Example

```shell
curl -H "Accept: application/json" -H "Content-Type: application/json" -X POST -d '{"variable": {"name":"RAILS_ENV", "value":"production"}}' -u :$AUTH_TOKEN https://api.scalingo.com/v1/apps/[:app]/variables
```

Returns 201 Created

Response

```json
{
    "variable": {
        "id": "541013a9736f7563d5050000",
        "name": "MONGO_URL",
        "value": "mongodb://user:password@host:port/db"
    }
}
```

--- row ---

## Update an environment variable

--- row ---

`PATCH https://api.scalingo.com/v1/apps/[:app]/variables/[:variable_id]`

||| col |||

Example

```shell
curl -H "Accept: application/json" -H "Content-Type: application/json" -X PATCH -d '{"variable": {"value":"staging"}}' -u :$AUTH_TOKEN https://api.scalingo.com/v1/apps/[:app]/variables/[:variable_id]
```

Returns 200 OK

Reponse

```json
{
    "variable": {
        "id": "54101384736f7563d5040000",
        "name": "RAILS_PRODUCTION",
        "value": "staging"
    }
}
```

--- row ---

## Delete an environment variable

--- row ---

`DELETE https://api.scalingo.com/v1/apps/[:app]/variables/[:variable_id]`

||| col |||

Example

```shell
curl -H "Accept: application/json" -H "Content-Type: application/json" -X DELETE -u :$AUTH_TOKEN https://api.scalingo.com/v1/apps/[:app]/variables/[:variable_id]
```

Returns 204 No Content
