# Events

--- row ---

## List the events of an app

--- row ---

With this list of events, you can reconstruct the timeline of an application.

`GET https://api.scalingo.com/v1/apps/[:app]/events`

{:.table}
| field      | type                                  |
| ---------- | ------------------------------------- |
| id         | unique ID of event                    |
| created_at | date of creation                      |
| user       | embedded user who generated the event |
| type       | type of event (can be among delete_variable deployment edit_variable new_variable restart run scale) |
| app_id     | unique ID of app the event belongs to |

> Feature: pagination

||| col |||

Example

```shell
curl -H "Accept: application/json" -H "Content-Type: application/json" -u :$AUTH_TOKEN https://api.scalingo.com/v1/apps/[:app]/events
```

Response

```json
{
    "events": [
    {
        "id": "54dcdd4a73636100011a0000",
        "created_at": "2015-02-12T18:05:14.226+01:00",
        "user": {
            "username": "johndoe",
            "email": "john@doe.com",
            "id": "51e6bc626edfe40bbb000001"
        },
        "type": "run",
        "app_id": "5343eccd646173000a140000",
        "command": "rake db:migrate"
    }, {
        "id": "54dcdc0073636100011b0000",
        "created_at": "2015-02-12T17:59:44.962+01:00",
        "user": {
            "username": "johndoe",
            "email": "john@doe.com",
            "id": "51e6bc626edfe40bbb000001"
        },
        "type": "deployment",
        "app_id": "5343eccd646173000a140000",
        "deployment": {
            "id": "54dcdc0073636100011a0000",
            "pusher": "johndoe",
            "git_ref": "737c22bde6b05d3262d9908727c54c7692888eef"
        }
    }, (...)],
    "meta": {
        "pagination": {
            "current_page": 1,
            "next_page": 2,
            "prev_page": null,
            "total_pages": 4,
            "total_count": 61
        }
    }
}
```



