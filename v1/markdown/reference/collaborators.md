### Collaborators

#### List collaborators of an app

```
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

#### Add collaborators to an app

`POST https://api.scalingo.com/v1/apps/[:app]/collaborators`

Parameters:

* `collaborator.email`: Email address of the collaborator to invite

```
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


