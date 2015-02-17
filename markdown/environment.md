# Environment variables

We do not automatically restart your application when you create/update/delete
an environment variable, you have to do it yourself when all the modifications
have been done. Look at the ['restart
application'](/apps.html#restart-an-application) endpoint.

--- row ---

**Environment variable attributes**

{:.table}
| field      | type   | description           |
| ---------- | ------ | --------------------- |
| id         | string | unique ID of variable |
| name       | string | name                  |
| value      | string | value                 |

||| col |||

Example object:

```json
{
  "id": "541013a9736f7563d5050000",
  "name": "MONGO_URL",
  "value": "mongodb://user:password@host:port/db"
}
```

--- row ---

## List environment variables of an app

--- row ---

`GET https://api.scalingo.com/v1/apps/[:app]/variables`

All the variables are returned, without interpolating anything.

Parameters:

* `aliases`: (default: `true`)
  
  true:

  ```
  SCALINGO_MONGO_URL=mongodb://user:password@host:port/db
  DATABASE_URL=$SCALINGO_MONGO_URL
  ```

  `false`:

  ```
  SCALINGO_MONGO_URL=mongodb://user:password@host:port/db
  DATABASE_URL=mongodb://user:password@host:port/db
  ```

||| col |||

Example request

```shell
curl -H "Accept: application/json" -H "Content-Type: application/json" \
  -X GET -u :$AUTH_TOKEN https://api.scalingo.com/v1/apps/example-app/variables
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

Example request

```shell
curl -H "Accept: application/json" -H "Content-Type: application/json" \
  -X POST -u :$AUTH_TOKEN https://api.scalingo.com/v1/apps/example-app/variables -d \
  '{
    "variable": {
      "name":"RAILS_ENV",
      "value":"production"
    }
  }'
```

Returns 201 Created

Response

```json
{
    "variable": {
        "id": "541013a9736f7563d5050000",
        "name": "RAILS_ENV",
        "value": "production"
    }
}
```

--- row ---

## Update an environment variable

--- row ---

`PATCH https://api.scalingo.com/v1/apps/[:app]/variables/[:variable_id]`

Update an environment variable, only the value can be updated, if your want to
change the name, create a new one.

||| col |||

Example request

```shell
curl -H "Accept: application/json" -H "Content-Type: application/json" -u :$AUTH_TOKEN \
  -X PATCH https://api.scalingo.com/v1/apps/example-app/variables/54101384736f7563d5040000 -d \
  '{
     "variable": {
       "value":"staging"
     }
  }'
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

Delete definitively an environment variable of an app.

||| col |||

Example request

```shell
curl -H "Accept: application/json" -H "Content-Type: application/json" -u :$AUTH_TOKEN \
  -X DELETE https://api.scalingo.com/v1/apps/example-app/variables/54101384736f7563d5040000
```

Returns 204 No Content
