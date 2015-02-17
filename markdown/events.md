# Events

Events are generated automatically according to your actions,
thanks to them, you can have an overview of the activity of your
applications.

--- row ---

**Event attributes**

{:.table}
| field      | type   | description                              |
| ---------- | ------ | ---------------------------------------- |
| id         | string | unique ID of event                       |
| created_at | date   | date of creation                         |
| user       | object | embedded user who generated the event    |
| type       | string | type of event (see below for the values) |
| app_id     | string | unique ID of app the event belongs to    |

According to the `type` field, extra data will be included
in the structure:

||| col |||

Example object:

* Base event

```json
{
  "id": "54dcdd4a73636100011a0000",
  "created_at": "2015-02-12T18:05:14.226+01:00",
  "user": {
      "username": "johndoe",
      "email": "john@doe.com",
      "id": "51e6bc626edfe40bbb000001"
  },
  "app_id": "5343eccd646173000a140000"
}
```

--- row ---

* **Restart event**

_When:_ The application or some containers have been restarted
`type=restart`

{:.table}
| field      | type  | description                           |
| ---------- | ----- | ------------------------------------- |
| scope      | array | The scope of the restart, null is all |

||| col |||

Example object:

```json
{
  "id": "54dcdd4a73636100011a0000",
  "created_at" : "2015-02-12T18:05:14.226+01:00",
  "user" : {
      "username" : "johndoe",
      "email" : "john@doe.com",
      "id" : "51e6bc626edfe40bbb000001"
  },
  "app_id" : "5343eccd646173000a140000",
  "scope" : ["web", "worker"]
}
```

--- row ---

* **Scale event**

_When:_ The application has been scaled out 
`type=scale`

{:.table}
| field               | type   | description                        |
| ------------------- | ------ | ---------------------------------- |
| previous_containers | object | The formation before the operation |
| containers          | object | The formation after the request    |

||| col |||

Example object:

```json
{
  "id": "54dcdd4a73636100011a0000",
  "created_at" : "2015-02-12T18:05:14.226+01:00",
  "user" : {
      "username" : "johndoe",
      "email" : "john@doe.com",
      "id" : "51e6bc626edfe40bbb000001"
  },
  "app_id" : "5343eccd646173000a140000",
  "previous_containers" : {
    "web" : 1,
    "worker": 0
  },
  "containers" : {
    "web" : 2,
    "worker" : 1 
  }
}
```
--- row ---

* **Deployment event**

_When:_ A deployment has been done
`type=deployment`

{:.table}
| field      | type   | description                                                |
| ---------- | -------| ---------------------------------------------------------- |
| deployment | object | The [Deployment](/deployment.html) associated to the event |

||| col |||

Example object:

```json
{
  "id": "54dcdd4a73636100011a0000",
  "created_at" : "2015-02-12T18:05:14.226+01:00",
  "user" : {
      "username" : "johndoe",
      "email" : "john@doe.com",
      "id" : "51e6bc626edfe40bbb000001"
  },
  "app_id" : "5343eccd646173000a140000",
  "deployment" : {
    "id" : "5343eccd646aa3012a140230",
    "push": "johndoe",
    "git_ref" : "0123456789abcdef"
  }
}
```

--- row ---

* **Run event**

_When:_ Someone runs `scalingo run` from the [CLI](http://cli.scalingo.com)
`type=run`

{:.table}
| field      | type   | description                           |
| ---------- | ------ | ------------------------------------- |
| command    | string | The command run by the user           |

||| col |||

Example object:

```json
{
  "id": "54dcdd4a73636100011a0000",
  "created_at": "2015-02-12T18:05:14.226+01:00",
  "user": {
      "username": "johndoe",
      "email": "john@doe.com",
      "id": "51e6bc626edfe40bbb000001"
  },
  "app_id": "5343eccd646173000a140000",
  "command": "bundle exec rake db:migrate"
}
```

--- row ---

* **New Variable event**

_When:_ Each time a variable is added to the application
`type=new_variable`

{:.table}
| field     | type   | description                        |
| --------- | ------ | ---------------------------------- |
| name      | string | Name of the newly created variable |
| value     | string | Value of the new variable          |

||| col |||

Example object:

```json
{
  "id": "54dcdd4a73636100011a0000",
  "created_at": "2015-02-12T18:05:14.226+01:00",
  "user": {
      "username": "johndoe",
      "email": "john@doe.com",
      "id": "51e6bc626edfe40bbb000001"
  },
  "app_id": "5343eccd646173000a140000",
  "name" : "VAR1",
  "value" : "VAL1"
}
```

--- row ---

* **Edit Variable event**

_When:_ Each time a variable is modified
`type=edit_variable`

{:.table}
| field     | type   | description                             |
| --------- | ------ | --------------------------------------- |
| name      | string | Name of the modified variable           |
| value     | string | New value of the modified variable      |
| old_value | string | Previous value of the modified variable |

||| col |||

Example object:

```json
{
  "id": "54dcdd4a73636100011a0000",
  "created_at": "2015-02-12T18:05:14.226+01:00",
  "user": {
      "username": "johndoe",
      "email": "john@doe.com",
      "id": "51e6bc626edfe40bbb000001"
  },
  "app_id": "5343eccd646173000a140000",
  "name" : "VAR1",
  "old_value" : "VAL1",
  "value" : "VAL2"
}
```

* --- row ---

**Delete variable event**

_When:_ Each time a variable is deleted
`type=delete_variable`

{:.table}
| field | type   | description                   |
| ----- | ------ | ----------------------------- |
| name  | string | Name of the deleted variable  |
| value | string | Value of the deleted variable |

||| col |||

Example object:

```json
{
  "id": "54dcdd4a73636100011a0000",
  "created_at": "2015-02-12T18:05:14.226+01:00",
  "user": {
      "username": "johndoe",
      "email": "john@doe.com",
      "id": "51e6bc626edfe40bbb000001"
  },
  "app_id": "5343eccd646173000a140000",
  "name" : "VAR1",
  "value" : "VAL2"
}
```

--- row ---

## List the events of an app

--- row ---

With this list of events, you can reconstruct the timeline of an application.

`GET https://api.scalingo.com/v1/apps/[:app]/events`

> Feature: pagination

||| col |||

Example

```shell
curl -H "Accept: application/json" -H "Content-Type: application/json" -u :$AUTH_TOKEN https://api.scalingo.com/v1/apps/[:app]/events
```

Returns 200 OK

Response

```json
{
    "events": [
    {
        "id": "54dcdd4a73636100011a0000",
        "created_at": "2015-02-12T18:05:14.226+01:00",
        "user": {
            "username": "johndoe",
            "email": "john@doe.com",
            "id": "51e6bc626edfe40bbb000001"
        },
        "type": "run",
        "app_id": "5343eccd646173000a140000",
        "command": "rake db:migrate"
    }, {
        "id": "54dcdc0073636100011b0000",
        "created_at": "2015-02-12T17:59:44.962+01:00",
        "user": {
            "username": "johndoe",
            "email": "john@doe.com",
            "id": "51e6bc626edfe40bbb000001"
        },
        "type": "deployment",
        "app_id": "5343eccd646173000a140000",
        "deployment": {
            "id": "54dcdc0073636100011a0000",
            "pusher": "johndoe",
            "git_ref": "737c22bde6b05d3262d9908727c54c7692888eef"
        }
    }, (...)],
    "meta": {
        "pagination": {
            "current_page": 1,
            "next_page": 2,
            "prev_page": null,
            "total_pages": 4,
            "total_count": 61
        }
    }
}
```



