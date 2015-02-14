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

List all the collabors of an app, except the owner. It also displays
the state of the invitation of thoses collaborators.

||| col |||

Example Request

```shell
curl -H "Accept: application/json" -H "Content-Type: application/json" \
  -X GET -u :$AUTH_TOKEN https://api.scalingo.com/v1/apps/[:app]/collaborators
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

This action will create an invitation to the given person. You can invite either
someone with an account on Scalingo or someone new. In the second case, they will
be able to access the application after creating their account.

> Note: An email will be sent to the invited user.

Parameters:

* `collaborator.email`: Email address of the collaborator to invite

||| col |||

```shell

Example Request

curl -H "Accept: application/json" -H "Content-Type: application/json" \
  -X POST -u :$AUTH_TOKEN https://api.scalingo.com/v1/apps/[:app]/collaborators -d \
  '{
     "collaborator": {
       "email":"test@test.com"
      }
   }' 
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

--- row ---

## Delete a collaborator

--- row ---

`DELETE https://api.scalingo.com/v1/apps/[:app]/collaborators/[:collaborator_id]`

This action completely remove a collaborator from an app. Only the owner of the app
can execute it. The user won't be able to access, nor to deploy it.

||| col |||

```shell

Example Request

curl -H "Accept: application/json" -H "Content-Type: application/json" \
  -X DELETE -u :$AUTH_TOKEN https://api.scalingo.com/v1/apps/[:app]/collaborators/54101e25736f7563d5060000
```

Returns 204 No Content
