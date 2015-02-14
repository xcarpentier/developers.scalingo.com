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
curl -k -H "Accept: application/json" -H "Content-Type: application/json" -u :$AUTH_TOKEN POST https://api.scalingo.com/v1/apps -d '{ "app": {"name": "testapp"}}'
```

Returns 201 Created

```json
{
    "app": {
        "created_at": "2014-09-10T10:17:52.690+02:00",
        "git_url": "git@appsdeck.dev:testapp.git",
        "id": "54100930736f7563d5030000",
        "name": "testapp",
        "owner": {
            "username": "john",
            "email": "user@example.com",
            "id": "54100245736f7563d5000000"
        },
        "updated_at": "2014-09-10T10:17:52.690+02:00",
        "urls": [
            "testapp.appsdeck.dev"
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
curl -k -H "Accept: application/json" -H "Content-Type: application/json" -X GET -u :$AUTH_TOKEN https://api.scalingo.com/v1/apps

http --auth :$AUTH_TOKEN https://api.scalingo.com/v1/apps
```

Returns 200 OK

```json
{
  "apps": [
    {
      "name": "myapp1",
      …
    }, {
      "name": "myapp2",
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

--- row ---

## Rename an application

`POST https://api.scalingo.com/v1/apps/[:app]/rename`

Parameters:

* `current_name`: As validation, should equal the name of the app
* `new_name`: Target name of rename operation

--- row ---

## Transfer ownership of an app

`PATCH https://api.scalingo.com/v1/apps/[:app]`

Parameters

* `app.owner.email`: email of the new owner of the app, should be part of the collaborators
