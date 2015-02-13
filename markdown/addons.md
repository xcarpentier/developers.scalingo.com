# Addons

--- row ---

## List app addons

--- row ---

**App addon**

| field          | type                                          |
| -------------- | --------------------------------------------- |
| plan           | embedded reference to Plan resource           |
| resource_id    | resource reference                            |
| addon_provider | embedded reference to AddonProvider resource  |

||| col |||

`GET https://api.scalingo.com/v1/apps/[:app]/addons`

```
curl -H "Accept: application/json" -H "Content-Type: application/json" -u :$AUTH_TOKEN https://api.scalingo.com/v1/apps/[:app]/addons
```

Returns 200 Created
```json
 "id" : "5415beca646173000b0b0000",
{
    "addons": [{
         "plan" : {
            "description" : "* Free plan\r\n* No backups (you can do it yourself)\r\n* 64MB RAM\r\n* 64MB disk space (hard limit)\r\n* Multiple Users\r\n* Community Support\r\n* Ideal for non critical cache or queueing system",
            "display_name" : "64MB Free tier",
            "id" : "52fd2357356330000b080000",
            "name" : "free",
            "price" : 0
         },
         "resource_id" : "dashboard_3083",
         "addon_provider" : {
            "id" : "scalingo-redis",
            "name" : "scalingo-redis"
         }
    }]
}
```
