# Deployments

The deployments information are available in read-only. They are populated when
application are deployed.

--- row ---

**Deployment attributes**

{:.table}
| field          | type   | description                                              |
| -------------- | ------ | -------------------------------------------------------- |
| id             | string | unique ID                                                |
| app_id         | string | unique ID referencing the app this deployment belongs to |
| created_at     | date   | date of creation                                         |
| git_ref        | string | git SHA                                                  |
| pusher         | object | embedded user who pushed the GIT reference               |

**Deployment pusher attributes**

{:.table}
| field          | type   | description                     |
| -------------- | ------ | ------------------------------- |
| id             | string | unique ID                       |
| email          | string | email of user who pushed        |
| username       | string | username on Scalingo's platform |

||| col |||

Example object:

```json
{
  "app_id": "54100930736f7563d5030000",
  "created_at": "2014-09-10T10:49:42.390+02:00",
  "git_ref": "abcdef1234567890",
  "id": "541010a6736f756f0a000000",
  "pusher": {
    "email": "user@example.com",
    "id": "54100245736f7563d5000000",
    "username": "john"
  }
}
```

--- row ---

## List the deployments of an app

--- row ---

`GET https://api.scalingo.com/v1/apps/[:app]/deployments`

This endpoint returns data of several deployments

> Feature: pagination

||| col |||

Example request

```shell
curl -H "Accept: application/json" -H "Content-Type: application/json" -u ":$AUTH_TOKEN" \
  -X GET https://api.scalingo.com/v1/apps/example-app/deployments
```

Returns 200 OK

```json
{
    "deployments": [
        {
            "app_id": "54100930736f7563d5030000",
            "created_at": "2014-09-10T10:49:42.390+02:00",
            "git_ref": "abcdef1234567890",
            "id": "541010a6736f756f0a000000",
            "pusher": {
                "email": "user@example.com",
                "id": "54100245736f7563d5000000",
                "username": "john"
            }
        }
    ]
    "meta": {
        "pagination": {
            "current_page": 1,
            "prev_page": null,
            "next_page": null,
            "total_pages": 1,
            "total_count": 1
        }
    }
}
```

--- row ---

## Get a particular deployment

--- row ---

`GET https://api.scalingo.com/v1/apps/[:app]/deployments/[:deployment_id]`

This endpoint returns data of a given deployment from its ID

||| col |||

Example request

```shell
curl -H "Accept: application/json" -H "Content-Type: application/json" -u ":$AUTH_TOKEN" \
  -X GET https://api.scalingo.com/v1/apps/example-app/deployments/54100930736f7563d5030000
```

Returns 200 OK

```json
{
    "deployment": {
        "app_id": "54100930736f7563d5030000",
        "created_at": "2014-09-10T10:49:42.390+02:00",
        "git_ref": "abcdef1234567890",
        "id": "541010a6736f756f0a000000",
        "pusher": {
            "email": "user@example.com",
            "id": "54100245736f7563d5000000",
            "username": "john"
        }
   }
}
```
