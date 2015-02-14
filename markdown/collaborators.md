# Collaborators

--- row ---

**Collaborator attributes**

{:.table}
| field          | type                                          |
| -------------- | --------------------------------------------- |
| id           | unique ID           |
| email    | email address                            |
| username | username ("N/A" if user has not chosen username yet or if invitation is still pending)  |
| status | status of the collaborator (pending: invitation not yet accepted, accepted: invitation has been accepted and collaborator is *active*) |

--- row ---

## List collaborators of an app

--- row ---

`GET https://api.scalingo.com/v1/apps/[:app]/collaborators`

||| col |||

Example

```shell
curl -H "Accept: application/json" -H "Content-Type: application/json" -X GET -u :$AUTH_TOKEN https://api.scalingo.com/v1/apps/[:app]/collaborators
```

Returns 200 OK

```json
{
    "collaborators": [
        {
            "email": "foo@example.com",
            "id": "54101e25736f7563d5060000",
            "status": "accepted",
            "username": "soulou"
        },
        {
            "email": "bar@example.com",
            "id": "54102274736f7563d5070000",
            "status": "pending",
            "username": "n/a"
        }
    ]
}
```

--- row ---

## Add collaborators to an app

--- row ---

`POST https://api.scalingo.com/v1/apps/[:app]/collaborators`

Parameters:

* `collaborator.email`: Email address of the collaborator to invite

||| col |||

```shell
curl -H "Accept: application/json" -H "Content-Type: application/json" -X POST -d '{"collaborator": {"email":"test@test.com"}}' -u :$AUTH_TOKEN https://api.scalingo.com/v1/apps/[:app]/collaborators
```

Returns 201 Created

```json
{
    "collaborators": [
        {
            "email": "foo@example.com",
            "id": "54101e25736f7563d5060000",
            "status": "pending",
            "username": "n/a"
        }
    ]
}
```

Notes: Send an email to the invited collaborator

