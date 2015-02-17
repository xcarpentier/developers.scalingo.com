# SSH Keys

SSH keys allow you to deploy their applications and to build encrypted tunnels
to the application databases (command `db-tunnel` of our [CLI
Tool](http://cli.scalingo.com)).

--- row ---

**Keys attributes**

{:.table}
| field      | type                              |
| ---------- | --------------------------------- |
| id         | unique ID of the key              |
| name       | Given name to the key             |
| content    | Raw content of the SSH public key |

||| col |||

Example object:

```json
{
  "id" : "54dcde4a54636101231a0000",
  "name" : "Office Laptop",
  "content": "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCmlEXHPj43jNzIiFbFx0NlcZpsFQZUC4paVoDf1/VXeA4P5ld5YT5O4PQEwvx/V8HzQit0sXRgUSFcKgGlAs9b0ea/nzxov8b3kc+Z5Ak1aRSkXKYE30xW9ALag9Pdf1ejzUXMY3X4bltEsyx7wV5i1hkKzQPHrH4SjhcGv+ILAg4J9KDfyqQ2QmKzVA+Esbmg3RE0IGbZIoNBxBYbNejcaw8+lX7nLsqAP8fZ+dgFP3JYsOYuTibtM5s09Gw7c3oXLrRm6F5G/Au6HYqlNYEKUYgZ2UmXox2vK1ljOZYzcOGj9kGqJ5DQgn88cVPqbA73vAYKGY6WcZf2X+3JOTct example-user@scalingo.com"
}
```

--- row ---

## List all SSH keys

--- row ---

`GET https://api.scalingo.com/v1/account/keys`

Return the list of all the public keys which are able to connect to the
platform.

||| col |||

Example request

```
curl -H 'Accept: application/json' -H 'Content-Type: application/json' -u ":$AUTH_TOKEN" \
  -X GET https://api.scalingo.com/v1/account/keys
```

Returns 200 OK

```json
{
  "keys" : [
    {
      "id" : "54dcde4a54636101231a0000",
      "name" : "Office Laptop",
      "content": "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCmlEXHPj43jNzIiFbFx0NlcZpsFQZUC4paVoDf1/VXeA4P5ld5YT5O4PQEwvx/V8HzQit0sXRgUSFcKgGlAs9b0ea/nzxov8b3kc+Z5Ak1aRSkXKYE30xW9ALag9Pdf1ejzUXMY3X4bltEsyx7wV5i1hkKzQPHrH4SjhcGv+ILAg4J9KDfyqQ2QmKzVA+Esbmg3RE0IGbZIoNBxBYbNejcaw8+lX7nLsqAP8fZ+dgFP3JYsOYuTibtM5s09Gw7c3oXLrRm6F5G/Au6HYqlNYEKUYgZ2UmXox2vK1ljOZYzcOGj9kGqJ5DQgn88cVPqbA73vAYKGY6WcZf2X+3JOTct example-user@scalingo.com"
    }, {
      "id" : "54dcde4a54a36131231a0001",
      "name" : "Continuous Integration",
      "content" : "<Public SSH Key>"
    }
  ]
}
```

--- row ---

## Get a precise SSH key

--- row ---

`GET https://api.scalingo.com/v1/account/keys/[:key_id]`

Return a given public ssh key.

||| col |||

Example request

```
curl -H 'Accept: application/json' -H 'Content-Type: application/json' -u ":$AUTH_TOKEN" \
  -X GET https://api.scalingo.com/v1/account/keys/54dcde4a54636101231a0000
```

Returns 200 OK

```json
{
  "key" : [
    {
      "id" : "54dcde4a54636101231a0000",
      "name" : "Office Laptop",
      "content": "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCmlEXHPj43jNzIiFbFx0NlcZpsFQZUC4paVoDf1/VXeA4P5ld5YT5O4PQEwvx/V8HzQit0sXRgUSFcKgGlAs9b0ea/nzxov8b3kc+Z5Ak1aRSkXKYE30xW9ALag9Pdf1ejzUXMY3X4bltEsyx7wV5i1hkKzQPHrH4SjhcGv+ILAg4J9KDfyqQ2QmKzVA+Esbmg3RE0IGbZIoNBxBYbNejcaw8+lX7nLsqAP8fZ+dgFP3JYsOYuTibtM5s09Gw7c3oXLrRm6F5G/Au6HYqlNYEKUYgZ2UmXox2vK1ljOZYzcOGj9kGqJ5DQgn88cVPqbA73vAYKGY6WcZf2X+3JOTct example-user@scalingo.com"
    }
  ]
}
```

--- row ---

## Allow a new public SSH key

--- row ---

`POST https://api.scalingo.com/v1/account/keys`

Allow a new SSH key pair to deploy applications

Parameters:

* `key.name`: Name of the key you want to add
* `key.content`: Public SSH key content (ie. content of `~/.ssh/id_rsa.pub`)

||| col |||

Example request

```
curl -H 'Accept: application/json' -H 'Content-Type: application/json' -u ":$AUTH_TOKEN" \
  -X POST https://api.scalingo.com/v1/account/keys -d \
  '{
    "key" {
      "name" : "Office Laptop",
      "content" : "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCmlEXHPj43jNzIiFbFx0NlcZpsFQZUC4paVoDf1/VXeA4P5ld5YT5O4PQEwvx/V8HzQit0sXRgUSFcKgGlAs9b0ea/nzxov8b3kc+Z5Ak1aRSkXKYE30xW9ALag9Pdf1ejzUXMY3X4bltEsyx7wV5i1hkKzQPHrH4SjhcGv+ILAg4J9KDfyqQ2QmKzVA+Esbmg3RE0IGbZIoNBxBYbNejcaw8+lX7nLsqAP8fZ+dgFP3JYsOYuTibtM5s09Gw7c3oXLrRm6F5G/Au6HYqlNYEKUYgZ2UmXox2vK1ljOZYzcOGj9kGqJ5DQgn88cVPqbA73vAYKGY6WcZf2X+3JOTct example-user@scalingo.com"
    }
  }'
```

Returns 201 Created

```json
{
  "key" : [
    {
      "id" : "54dcde4a54636101231a0000",
      "name" : "Office Laptop",
      "content": "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCmlEXHPj43jNzIiFbFx0NlcZpsFQZUC4paVoDf1/VXeA4P5ld5YT5O4PQEwvx/V8HzQit0sXRgUSFcKgGlAs9b0ea/nzxov8b3kc+Z5Ak1aRSkXKYE30xW9ALag9Pdf1ejzUXMY3X4bltEsyx7wV5i1hkKzQPHrH4SjhcGv+ILAg4J9KDfyqQ2QmKzVA+Esbmg3RE0IGbZIoNBxBYbNejcaw8+lX7nLsqAP8fZ+dgFP3JYsOYuTibtM5s09Gw7c3oXLrRm6F5G/Au6HYqlNYEKUYgZ2UmXox2vK1ljOZYzcOGj9kGqJ5DQgn88cVPqbA73vAYKGY6WcZf2X+3JOTct example-user@scalingo.com"
    }
  ]
}
```

--- row ---

## Remove a SSH key from the account

--- row ---

`DELETE https://api.scalingo.com/v1/account/keys/[:key_id]`

The modification will take effect immediately, the usage of this key will result
in 'Unauthorized' errors.

||| col |||

Example request

```
curl -H 'Accept: application/json' -H 'Content-Type: application/json' -u ":$AUTH_TOKEN" \
  -X DELETE https://api.scalingo.com/v1/account/keys/54dcde4a54636101231a0000
```

Returns 204 No Content
