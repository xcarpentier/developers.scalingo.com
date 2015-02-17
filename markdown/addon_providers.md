# Addon providers

--- row ---

**Addon provider attributes**

{:.table}
| field             | type   | description                            |
| ----------------- | ------ | -------------------------------------- |
| id                | string | unique ID                              |
| name              | string | name                                   |
| logo_url          | string | URL of the addon logo                  |
| short_description | string | short description                      |
| description       | string | description                            |
| category          | object | embedded category object               |
| provider_name     | string | name of company offering this addon    |
| provider_url      | string | URL of company offering this addon     |
| plans             | array  | embedded array of plans for this addon |

||| col |||

Example object:

```json
{
  "name": "Scalingo PostgreSQL",
  "logo_url": "https://lb1047.pcs.ovh.net/v1/AUTH_c91a9132e4f149809d23b20b6de57161/appsdeck/postgresql.png",
  "id": "scalingo-postgresql",
  "short_description": "Scalingo's PostgreSQL Database as a Service",
  "description": "[HTML Description]",
  "category": {
    "id": "54c6909b61646d0001000000",
    "name": "Data stores"
  },
  "provider_name": "Scalingo",
  "provider_url": "https://scalingo.com",
  "plans": [{
    "id": "54071fa5646173000b010000",
    "name": "free",
    "display_name": "512MB Free Tier",
    "price": 0.0,
    "description": "[Markdown Description]"
  }, {
    "id": "5474a6c66461730001010000",
    "name": "1g",
    "display_name": "1G Database",
    "price": 14.4,
    "description": "[Markdown Description]"
  }]
}
```

--- row ---

**Addon plan attributes**

{:.table}
| field        | type   | description               |
| ------------ | ------ | ------------------------- |
| id           | string | unique ID                 |
| name         | string | name (internal reference) |
| display_name | string | user friendly name        |
| price        | float  | in euros                  |
| description  | string | description of this plan  |

||| col |||

Example object:

```json
{
  "id": "54071fa5646173000b010000",
  "name": "free",
  "display_name": "512MB Free Tier",
  "price": 0.0,
  "description": "[Markdown Description]"
}
```

--- row ---

**Addon category attributes**

{:.table}
| field       | type   | description                 |
| ----------- | ------ | --------------------------- |
| id          | string | unique ID                   |
| description | string | description of the category |
| name        | string | name                        |

||| col |||

Example object:

```json
{
  "id": "54c6909b61646d0001000000",
  "description": "[Markdown description]"
  "name": "Data stores"
}
```

--- row ---

## List addon providers

--- row ---

`GET https://api.scalingo.com/v1/addon_providers`

The endpoint return the list of the addons you can provision for your app,
including the different available plans.

Parameters:

* `category_id`: Filter the addon providers per category

||| col |||

Example request

```sh
curl -H "Accept: application/json" -H "Content-Type: application/json" \
 -X GET https://api.scalingo.com/v1/addon_providers

curl -H "Accept: application/json" -H "Content-Type: application/json" \
 -X GET https://api.scalingo.com/v1/addon_providers?category_id=54c6909b61646d0001000000
```

Returns 200 OK

```json
{
    "addon_providers": [{
        "name": "Scalingo PostgreSQL",
        "logo_url": "https://lb1047.pcs.ovh.net/v1/AUTH_c91a9132e4f149809d23b20b6de57161/appsdeck/postgresql.png",
        "id": "scalingo-postgresql",
        "short_description": "Scalingo's PostgreSQL Database as a Service",
        "description": "[HTML Description]",
        "category": {
            "id": "54c6909b61646d0001000000",
            "name": "Data stores"
        },
        "provider_name": "Scalingo",
        "provider_url": "https://scalingo.com",
        "plans": [{
            "id": "54071fa5646173000b010000",
            "name": "free",
            "display_name": "512MB Free Tier",
            "price": 0.0,
            "description": "[Markdown Description]"
        }, {
            "id": "5474a6c66461730001010000",
            "name": "1g",
            "display_name": "1G Database",
            "price": 14.4,
            "description": "[Markdown Description]"
        }, ... ]
    }, {
        "name": "Scalingo MySQL",
        "logo_url": "https://lb1047.pcs.ovh.net/v1/AUTH_c91a9132e4f149809d23b20b6de57161/appsdeck/mysql.png",
        "id": "scalingo-mysql",
        "short_description": "Scalingo's MySQL Database as a Service",
        "description": "[HTML Description]",
        "category": {
            "id": "54c6909b61646d0001000000",
            "name": "Data stores"
        },
        "provider_name": "Scalingo",
        "provider_url": "https://scalingo.com",
        "plans": [ ... ]
    }, ...]
}
```

--- row ---

## List addon categories

--- row ---

`GET https://api.scalingo.com/v1/addon_categories`

Return the different categories of the available addons

||| col |||

Example request

```sh
curl -H "Accept: application/json" -H "Content-Type: application/json" \
 -X GET https://api.scalingo.com/v1/addon_categories
```

Returns 200 OK

```json
{
    "addon_categories": [
        "category": {
            "id": "54c6909b61646d0001000000",
            "description": "[Markdown description]"
            "name": "Data stores"
        }, ...
    ]
}
```
