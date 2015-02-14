# Deployments

--- row ---

**Deployment attributes**

{:.table}
| field          | type                                          |
| -------------- | --------------------------------------------- |
| id | unique ID |
| app_id | unique ID referencing the app this deployment belongs to |
| created_at | date of creation |
| git_ref | git SHA |
| pusher | embedded user who pushed the GIT reference |

**Deployment pusher attributes**

{:.table}
| field          | type                                          |
| -------------- | --------------------------------------------- |
| id | unique ID |
| email | email of user who pushed |
| username | username on Scalingo's platform |

--- row ---

## List the deployments of an app

--- row ---

`GET https://api.scalingo.com/v1/apps/[:app]/deployments`

> Feature: pagination

||| col |||

Example

```shell
curl -H "Accept: application/json" -H "Content-Type: application/json" -u ":$AUTH_TOKEN" https://api.scalingo.com/v1/apps/[:app]/deployments
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
            "total_entries": 1
        }
    }
}

```

