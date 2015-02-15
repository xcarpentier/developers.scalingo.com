# Addons

--- row ---

**App addon attributes**

{:.table}
| field          | type                                          |
| -------------- | --------------------------------------------- |
| plan           | embedded reference to Plan resource           |
| resource_id    | resource reference                            |
| addon_provider | embedded reference to AddonProvider resource  |

--- row ---

## List app addons

--- row ---

`GET https://api.scalingo.com/v1/apps/[:app]/addons`

List all the provisionned addons for a given application.

||| col |||

Example

```shell
curl -H "Accept: application/json" -H "Content-Type: application/json" -u :$AUTH_TOKEN \ 
  -X GET https://api.scalingo.com/v1/apps/example-app/addons
```

Returns 201 Created

```json
{
    "addons": [{
	 "id" : "5415beca646173000b015000",
         "plan" : {
            "description" : "[Markdown description]",
            "display_name" : "64MB Free tier",
            "id" : "52fd2357356330032b080000",
            "name" : "free",
            "price" : 0
         },
         "resource_id" : "example_app_3083",
         "addon_provider" : {
            "id" : "scalingo-redis",
            "name" : "Scalingo Redis"
         }
    }]
}
```

--- row ---

## Provision an addon

`POST https://api.scalingo.com/v1/apps/[:app]/addons`

Parameters:

* `addon.addon_provider_id`
* `addon.plan_id`

||| col |||

```shell
curl -H "Accept: application/json" -H "Content-Type: application/json" -u :$AUTH_TOKEN \
  -X POST https://api.scalingo.com/v1/apps/[:app]/addons \
  -d '{"addon":{"plan_id": "1234", "addon_provider_id": "1234"}}'
```

--- row ---

## Upgrade an addon

`PATCH https://api.scalingo.com/v1/apps/[:app]/addons/[:addon_id]`

Parameters:

* `addon.plan_id`

||| col |||

```shell
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
