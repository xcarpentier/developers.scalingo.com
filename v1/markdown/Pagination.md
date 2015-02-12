### Pagination

Some resources are paginated provided by the platform API are paginated.
To ensure you can correctly handle it, metadata are added to the JSON of 
the response.

#### Request parameters

* `page`: Requested page number
* `per_page`: Number of entries per page.
  Each resource has a maximum for this value to avoid oversized requests

#### Response example

`GET https://api.scalingo.com/v1/apps/[:app]/events?page=4&per_page=20`

```json
{
	"events": [
		{ ... }
	],
	"meta": {
		"current_page": 4,
		"prev_page": 3,
		"next_page": 5,
		"total_pages": 12,
		"total_entries": 240
	}
}
```

> `prev_page` and/or `next_page` are equal to `null` if there is no previous
> or next page.

This request returns the events 40 to 60.
