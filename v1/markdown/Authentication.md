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
