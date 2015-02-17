# Applications

--- row ---

**Application attributes**

{:.table}
| field          | type   | description                                      |
| -------------- | ------ | ------------------------------------------------ |
| id             | string | unique ID                                        |
| name           | string | name of the application, can substitute the ID   | 
| created_at     | date   | creation date of the application                 |
| updated_at     | date   | last time the application has been updated       |
| git_url        | string | URL to the GIT remote to access your application |
| owner          | object | information about the owner of the application   |
| urls           | array  | list of custom domains to access to your project |

||| col |||

Example object:

```json
{
  "id": "54100930736f7563d5030000",
  "name": "example-app",
  "created_at": "2014-09-10T10:17:52.690+02:00",
  "updated_at": "2014-09-10T10:17:52.690+02:00",
  "git_url": "git@scalingo.com:example-app.git",
  "owner": {
    "username": "john",
    "email": "user@example.com",
    "id": "54100245736f7563d5000000"
  },
  "urls": [
    "example-app.scalingo.io"
  ]
}
```

--- row ---

## Create an application

--- row ---

`POST https://api.scalingo.com/apps`

Parameters:

* `app.name`: Should have between 6 and 32 lower case alphanumerical characters
  and hyphens, it can't have an hyphen at the beginning or at the end, nor two
  hyphens in a row.

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

List all your applications and the one your are collaborator for.

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

## Get a precise application

--- row ---

`GET https://api.scalingo.com/v1/apps/[:app]`

Display a precise application

||| col |||

Example request

```shell
curl -H "Accept: application/json" -H "Content-Type: application/json" -u :$AUTH_TOKEN \
  -X GET https://api.scalingo.com/v1/apps/example-app
```

Returns 200 OK

```json
{
  "app": {
    "id" : "51e938266edff4fac9100005",
    "name" : "example-app",
    "owner" : {
       "email" : "user@example.com",
       "id" : "51d73c1e6edfeab537000001",
       "username" : "example-user"
    },
    "git_url" : "git@scalingo.com:example-app.git",
    "last_deployed_at" : "2014-11-16T12:17:16.137+01:00",
    "status" : "running",
    "updated_at" : "2015-02-02T18:00:18.041+01:00",
    "created_at" : "2013-07-19T14:59:18.329+02:00",
    "last_deployed_by" : "example-user",
    "domains" : [
      {
        "id" : "53e4a2ef7f784210ea000123",
        "name" : "www.example.com",
        "ssl" : false
      }
    ]
  }
}
```

--- row ---

## Scale an application

--- row ---

`POST https://api.scalingo.com/v1/apps/[:app]/scale`

Send a scaling request, the status of the application will be changed to
'scaling' for the scaling duration. No other operation is doable until the app
status has switched to "running" again.  

You can follow the operation progress by following the `Location` header,
pointing to an `operation` resource.

The request returns the complete formation of containers event those which are
not currently scaled.

Parameters:

* `containers`: Array of the containers you want to scale.
  Each `containers`:
  * `container.name`: Name of the container you want to scale
  * `container.amount`: Final amount of container of this type

||| col |||

Example request

```sh
curl -H "Accept: application/json" -H "Content-Type: application/json" -u :$AUTH_TOKEN \
  -X POST 'https://api.scalingo.com/v1/apps/example-app/scale' -d \
  '{
    "containers": [
      {
        "name": "web",
        "amount": 2
      }
    ]
  }'
```

Returns 202 Accepted (Asynchronous task)
Headers:
  * `Location`: 'https://api.scalingo.com/v1/apps/example-app/operations/52fd2357356330032b080000'

```json
{
  "containers": [
    {
      "id": "52fd2457356330032b020000",
      "name": "web",
      "amount": 2
    }, {
      "id": "52fd235735633003210a0001",
      "name": "worker",
      "amount": 1
    }
  ]
}
```

--- row ---

## Restart an application

--- row ---

`POST https://api.scalingo.com/v1/apps/[:app]/restart`

In the same spirit than the 'scale' operation, the restart is an asynchronous
operation

Send a restart request, the status of the application will be changed to
'restarting' for the operation duration. No other operation is doable until the
app status has switched to "running" again.

You can follow the operation progress by following the `Location` header,
pointing to an `operation` resource.

Parameters:

* `scope`: Array of containers you want to restart.
  * If empty or nil: restart everything
  * Should fit the container types of the application: `["web", "worker"]` or `["web-1"]`

||| col |||

Example request

```sh
curl -H "Accept: application/json" -H "Content-Type: application/json" -u :$AUTH_TOKEN \
  -X POST 'https://api.scalingo.com/v1/apps/example-app/restart' -d \
  '{
    "scope": ["web"]
   }'
```

Return 202 Accepted (Asynchronous task) - Empty body

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

## Transfer ownership of an application

`PATCH https://api.scalingo.com/v1/apps/[:app]`

Parameters

* `app.owner.email`: email of the new owner of the app, should be part of the
  collaborators

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

--- row ---

## Access to the application logs

--- row ---

`POST https://api.scalingo.com/v1/apps/[:app]/logs`

The request will generate an URL you can use to access the logs of your application.

How to use this endpoint: [more information here](/logs.html)

||| col |||

Example request:

```sh
curl -H "Accept: application/json" -H "Content-Type: application/json" -u :$AUTH_TOKEN \
  -X POST 'https://api.scalingo.com/v1/apps/example-app/logs'
```

Returns 200 OK

```json
{
  "app": { … },
  "logs_url": "https://logs.scalingo.com/apps/example-app/logs?token=0123456789"
}
```

--- row ---

## Run a container in the environment of your application

Similar to `scalingo run`

--- row ---

`POST https://api.scalingo.com/v1/apps/[:app]/run`

||| col |||

Example request:

```sh
curl -H "Accept: application/json" -H "Content-Type: application/json" -u :$AUTH_TOKEN \
  -X POST 'https://api.scalingo.com/v1/apps/example-app/run -d \
  '{
    "command": "bundle exec rails console"
  }'

Returns 200 OK

```json
{
  "container": {
    "id" : "5250424112dba4edf0000024",
    "type" : "job",
    "type_index" : 0,
    "created_at" : "2015-02-17T22:10:32.692+01:00",
    "memory" : 5.36870912e+08,
    "state" : "booting",
    "app" : { "name": "example-app", ... }
  },
  "attach_url": "http://run-1.scalingo.com:5000/f15d8c7fb4170c4ef14b63b2b265c8fa3dbf4a5882de19682a21f6243ae332c6"
}
```
