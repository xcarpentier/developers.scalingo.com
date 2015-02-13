### Addons

#### Provision an addon

`POST https://api.scalingo.com/v1/apps/[:app]/addons`

Parameters:
  * `addon.addon_provider_id`
  * `addon.plan_id`

```sh
curl -H "Accept: application/json" -H "Content-Type: application/json" -u :$AUTH_TOKEN \
  -X POST https://api.scalingo.com/v1/apps/[:app]/addons \
  -d '{"addon":{"plan_id": "1234", "addon_provider_id": "1234"}}'
```

#### Upgrade an addon

`PATCH https://api.scalingo.com/v1/apps/[:app]/addons/[:addon_id]`

Parameters:
  * `addon.plan_id`

```sh
curl -H "Accept: application/json" -H "Content-Type: application/json" -u :$AUTH_TOKEN \
  -X POST https://api.scalingo.com/v1/apps/[:app]/addons/[:addon_id] \
  -d '{"addon": {"plan_id": "2"}}'
```

Response:

200 OK

```json
{
  "vars": ["VAR1", "VAR2"],
  "message": "<custom message from the addon provider>"
}
```

#### List app addons

`GET https://api.scalingo.com/v1/apps/[:app]/addons`

```sh
curl -H "Accept: application/json" -H "Content-Type: application/json" -u :$AUTH_TOKEN \
  https://api.scalingo.com/v1/apps/[:app]/addons
```

Returns 200 OK
```json
 "id" : "5415beca646173000b0b0000",
{
    "addons": [{
         "plan" : {
            "description" : "<description>",
            "display_name" : "64MB Free tier",
            "id" : "52fd2357356330200b315006",
            "name" : "free",
            "price" : 0
         },
         "resource_id" : "myapp_123",
         "addon_provider" : {
            "id" : "scalingo-redis",
            "name" : "scalingo-redis"
         }
    }]
}
```
