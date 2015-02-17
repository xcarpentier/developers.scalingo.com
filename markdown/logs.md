# Application Logs

## Dump and stream logs

`GET https://logs.scalingo.com/apps/[:app]/logs?token=[:token]`

To get an authenticated URL, see [Application#logs](/apps.html#access-to-the-application-logs)

Parameters:

* `n`: How many lines of the history should be returned
* `stream` (default false): toggle streaming

When `stream=true` two ways to fetch logs are possible

* Websocket
  If your request contains the following headers:
  * Upgrade: websocket
  * Connection: Upgrade
  An attempt to communicate through websocket will be done.

* Server Sent-Events (SSE)
  If websocket is not required, it will fallback on SSE

If you are not familiar with these technologies, here is a [nice
intro to them](http://enterprisewebbook.com/ch8_websockets.html).

If `stream=false` the result is in `plain/text` and is directly the logs data.

||| col |||

Websocket example:

```sh
curl -H "Connection: Upgrade" -H "Upgrade: websocket" -v \
 -X GET 'https://logs.scalingo.com/apps/example-app/logs?n=0&stream=true'
```

Return 101 Switching Protocol

Each event:
```json
{
   "name": "log",
   "log": "<log content>"
}
```

--- row ---

### Keepalive events to avoid connection timeout

Our frontal servers disallow inactive connections. To avoid websockets or SSE
connections to be cut after 30 seconds of inactivity, both methods are send
keepalive data.

These events don't expect any responser, they just ensure the connection is not
closed.

||| col |||

Exemple of keepalive event

```json
{
  "name": "ping",
  "timestamp": <date>
}
```

