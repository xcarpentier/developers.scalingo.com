# Global information

--- row ---

## Introduction

The current API version is the __v1__. All the endpoints are prefixed by `/v1`. It's only available through HTTPS: it's TLS, or nothing.

||| col |||

Base URL:

```
https://api.scalingo.com/v1/
```

--- row ---

## Parameters

--- row ---

### GET and DELETE endpoints

Parameters for GET and DELETE requests are known as _query parameters_, they are declared in the resource URL.

||| col |||

Example:

```shell
curl -X GET https://api.scalingo.com/v1/apps/name/events?page=2
```

--- row ---

### POST/PUT/PATCH

For these types of request, parameters are not included as query parameters, they should be encoded as JSON with the following header: `Content-Type: 'application/json'.

||| col |||

Example:

```shell
curl -X POST -H 'Content-Type: application/json' https://api.scalingo.com/v1/apps -d '{"app": {"name": "a-new-app"}}'
```

--- row ---

## HTTP Verbs

The API is not perfectly RESTful, it is more REST-ish. It has been developed to
be easy to use and instinctive, we'll probably normalize in a second version.

* HEAD		Can be issued against any resource to get just the HTTP header info.
* GET		Get resources, nullipotent operation (no matter how many times you call it, there is no side effect).
* POST		Used for creating resources. (creation of a new app, or to create an environment variable)
* PATCH		Update part of resources, as the value of an environment variable.
* PUT		Update complete resources.
* DELETE	Used for deleting items. Nullipotent operation (as GET)

--- row ---

# Authentication

The authentication to the API is done thanks to an authentication token and
Basic HTTP Auth. The API is HTTPS only, so credentials are always sent encrypted.

--- row ---

## Get an authentication token

`POST https://api.scalingo.com/v1/users/sign_in`

Parameters:

* `user.login`: Email of your account
* `user.password`: Password or your account

||| col |||

Return 201 Created

```json
{
  "authentication_token":"abcdef0123456789-"
}
```

--- row ---

## Make an authenticated request

HTTP requests have to be authenticated with HTTP basic auth, with the authentication token as
password, the username can be empty.

||| col |||

Example:

```sh
curl -u ":$AUTH_TOKEN" -H "Accept: application/json" -H "Content-Type: application/json" https://api.scalingo.com/v1/apps
```

--- row ---

# Data format

--- row ---

## JSON

--- row ---

The API sends and receives JSON, XML is not accepted, please ensure JSON is used.

--- row ---

## Dates

All the dates are sent with the ISO 8601: YYYY-MM-DDThh:mm:ss.μμμZ

Example:

2015-01-13T09:20:31.123+01:00

This format is commonly understood here are some examples:

Javascript:

```js
var date = new Date("2015-01-13T09:20:31.123+01:00")
Tue Jan 13 2015 09:20:31 GMT+0100 (CET)
```

Ruby:

```ruby
require 'date'
DateTime.iso8601("2015-01-13T09:20:31.123+01:00")
=> #<DateTime: 2015-01-13T09:20:31+01:00 ((2457036j,30031s,123000000n),+3600s,2299161j)>
```

Go:

```go
date, _ := time.Parse(time.RFC3339Nano, "2015-01-13T09:20:31.123+01:00")
fmt.Println(date)

// go run iso8601.go
// 2015-01-13 09:20:31.123 +0100 CET
```

--- row ---

# Errors

## Client errors - Status codes: 4xx

* JSON is wrongly formatted - error 400:

  ```shell
  curl -X POST -H 'Content-Type: application/json' -H 'Accept: application/json' https://api.scalingo.com/v1/users/sign_in -d '{"user": {'
  ```

  ```
  HTTP/1.1 400 Bad Request

  { "error": "There was a problem in the JSON you submitted: 795: unexpected token at '{\"user\": {'" }
  ```

* Their is a missing field in JSON payload - error 422:

  ```shell
  curl -X POST -H 'Content-Type: application/json' -H 'Accept: application/json' https://api.scalingo.com/v1/apps -d '{}'
  ```

  ```
  HTTP/1.1 422 Unprocessable Entity

  { "errors": { "app": [ "missing field" ] } }
  ```

* Invalid data were sent in the payload - error 422:

  ```shell
  curl -X POST -H 'Content-Type: application/json' -H 'Accept: application/json' https://api.scalingo.com/v1/apps -d '{"app": {"name": "AnotherApp"}}'
  ```

  ```
  HTTP/1.1 422 Unprocessable Entity

  { "errors": { "name": [ "should contain only lowercap letters, digits and hyphens" ] } }
  ```

--- row ---

# Pagination

Some resources are paginated provided by the platform API are paginated.
To ensure you can correctly handle it, metadata are added to the JSON of
the response.

--- row ---

## Request parameters

* `page`: Requested page number
* `per_page`: Number of entries per page.
  Each resource has a maximum for this value to avoid oversized requests

--- row ---

## Response example

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
