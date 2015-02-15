# Applications

--- row ---

## Create an application

--- row ---

`POST https://api.scalingo.com/apps`

Parameters:

* `app.name`: Should have between 6 and 32 lower case alphanumerical characters and hyphens,
  it can't have an hyphen at the beginning or at the end, nor two hyphens in a row.

||| col |||

Example

```sh
curl -H "Accept: application/json" -H "Content-Type: application/json" -u :$AUTH_TOKEN \
  -X POST https://api.scalingo.com/v1/apps -d \
  '{
    "app": {
      "name": "example-app"
    }
  }'
```

Returns 201 Created

```json
{
    "app": {
        "created_at": "2014-09-10T10:17:52.690+02:00",
        "git_url": "git@scalingo.com:example-app.git",
        "id": "54100930736f7563d5030000",
        "name": "example-app",
        "owner": {
            "username": "john",
            "email": "user@example.com",
            "id": "54100245736f7563d5000000"
        },
        "updated_at": "2014-09-10T10:17:52.690+02:00",
        "urls": [
            "example-app.scalingo.io"
        ]
    }
}
```

--- row ---

## List your applications

`GET https://api.scalingo.com/apps`

||| col |||

Example

```shell
curl -H "Accept: application/json" -H "Content-Type: application/json" -u :$AUTH_TOKEN \
  -X GET https://api.scalingo.com/v1/apps
```

Returns 200 OK

```json
{
  "apps": [
    {
      "name": "example-app",
      …
    }, {
      "name": "another-app",
      …
    }, …
  ]
}
```

--- row ---

## Delete an application

`DELETE https://api.scalingo.com/v1/apps/[:app]`

Parameters:

* `current_name`: As validation, should equal the name of the app

||| col |||

Example request

```sh
curl -H "Accept: application/json" -H "Content-Type: application/json" -u :$AUTH_TOKEN \
  -X DELETE 'https://api.scalingo.com/v1/apps/example-app?current_name=example-app'
```

Returns 204 No Content

--- row ---

## Rename an application

`POST https://api.scalingo.com/v1/apps/[:app]/rename`

Parameters:

* `current_name`: As validation, should equal the name of the app
* `new_name`: Target name of rename operation

||| col |||

Example request

```sh
curl -H "Accept: application/json" -H "Content-Type: application/json" -u :$AUTH_TOKEN \
  -X POST 'https://api.scalingo.com/v1/apps/example-app' -d \
  '{
    "current_name": "example-app",
    "new_name": "renamed-example-app"
  }'
```

Returns 200 OK

```json
{
  "app": {
    "name": "renamed_example-app",
    ...
  }
}
```

--- row ---

## Transfer ownership of an app

`PATCH https://api.scalingo.com/v1/apps/[:app]`

Parameters

* `app.owner.email`: email of the new owner of the app, should be part of the collaborators

||| col |||

Example request

```sh
curl -H "Accept: application/json" -H "Content-Type: application/json" -u :$AUTH_TOKEN \
  -X PATCH 'https://api.scalingo.com/v1/apps/example-app' -d \
  '{
    "app": {
      "owner": {
        "email": "user2@example.com"
      }
    }
  }'
```

Returns 200 OK

```json
{
  "app": {
    "name": "example-app",
    ...
  }
}
```
