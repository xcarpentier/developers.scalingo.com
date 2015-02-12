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
