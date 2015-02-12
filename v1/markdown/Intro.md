## Global information

### API Versionning

The current API version is the __v1__. All the endpoints are prefixed by `/v1`.

> Example: `curl -X GET https://api.scalingo.com/v1/apps`

### HTTP vs HTTPS

Our API is only available through HTTPS: it's TLS, or nothing.

### Data format

#### JSON

The API sends and receives JSON, XML is not accepted, please ensure JSON is used.

#### Dates

All the dates are sent with the ISO 8601: YYYY-MM-DDThh:mm:ss.μμμZ

> Example: 2015-01-13T09:20:31.123+01:00

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

### Parameters

#### GET and DELETE endpoints

Parameters for GET and DELETE requests are known as _query parameters_, they are declared in the resource URL

> Example: `curl -X GET https://api.scalingo.com/v1/apps/name/events?page=2`

#### POST/PUT/PATCH

For these types of request, parameters are not included as query parameters, they should be encoded as JSON with the following header:

* `Content-Type: 'application/json'`

> Example: `curl -X POST -H 'Content-Type: application/json' https://api.scalingo.com/v1/apps -d '{"app": {"name": "a-new-app"}}'`

### Errors

#### Client errors - Status codes: 4xx

* JSON is wrongly formatted - error 400:

  ```
  curl -X POST -H 'Content-Type: application/json' -H 'Accept: application/json' https://api.scalingo.com/v1/users/sign_in -d '{"user": {'
  ```

  ```
  HTTP/1.1 400 Bad Request

  { "error": "There was a problem in the JSON you submitted: 795: unexpected token at '{\"user\": {'" }
  ```

* Their is a missing field in JSON payload - error 422:

  ```
  curl -X POST -H 'Content-Type: application/json' -H 'Accept: application/json' https://api.scalingo.com/v1/apps -d '{}'
  ```

  ```
  HTTP/1.1 422 Unprocessable Entity

  { "errors": { "app": [ "missing field" ] } }
  ```

* Invalid data were sent in the payload - error 422:

  ```
  curl -X POST -H 'Content-Type: application/json' -H 'Accept: application/json' https://api.scalingo.com/v1/apps -d '{"app": {"name": "AnotherApp"}}'
  ```
  
  ```
  HTTP/1.1 422 Unprocessable Entity

  { "errors": { "name": [ "should contain only lowercap letters, digits and hyphens" ] } }
  ```

### HTTP Verbs

The API is not perfectly RESTful, it is more REST-ish. It has been developed to
be easy to use and instinctive, we'll probably normalize in a second version.

* HEAD		Can be issued against any resource to get just the HTTP header info.
* GET		Get resources, nullipotent operation (no matter how many times you call it, there is no side effect).
* POST		Used for creating resources. (creation of a new app, or to create an environment variable)
* PATCH		Update part of resources, as the value of an environment variable.
* PUT		Update complete resources.
* DELETE	Used for deleting items. Nullipotent operation (as GET)

### Authentication

The authentication to the API is done thanks to an authentication token and
Basic HTTP Auth. The API is HTTPS only, so credentials are always sent encrypted.

#### Get an authentication token

`POST https://api.scalingo.com/v1/users/sign_in`

Parameters:
* `user.login`: Email of your account
* `user.password`: Password or your account

Return 201 Created
```json
{
  "authentication_token":"abcdef0123456789-"
}
```

#### Make an authenticated request

HTTP requests have to be authenticated with HTTP basic auth, with the authentication token as
password, the username can be empty.

Example:

```sh
curl -u ":$AUTH_TOKEN" -H "Accept: application/json" -H "Content-Type: application/json" https://api.scalingo.com/v1/apps
```
