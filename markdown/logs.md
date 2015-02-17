# Application Logs

## Dump and stream logs

`GET https://logs.scalingo.com/apps/[:app]/logs?token=[:token]`

To get an authenticated URL, see [Application#logs](/apps.html#access-to-the-application-logs)

Parameters:

* `n`: How many lines of the history should be returned
* `stream` (default false): toggle streaming

--- row ---

### Dump logs

If `stream=false` or is not set, the response will be simple text containing
the logs.

||| col |||

Example request:

```sh
curl -X GET 'https://logs.scalingo.com/apps/example-app/logs?n=10'
```

Response 200 OK

Content-Type: text/plain

```
2015-02-16 02:02:43.930163178 +0000 UTC [web-1] [martini] Started GET / for [filtered IP]
2015-02-16 02:02:43.930366145 +0000 UTC [web-1] [martini] Completed 200 OK in 706.641us
2015-02-16 14:47:03.193533257 +0000 UTC [web-1] [martini] Started GET / for [filtered IP]
2015-02-16 14:47:03.193707764 +0000 UTC [web-1] [martini] Completed 200 OK in 726.31us
2015-02-17 03:40:14.075695384 +0000 UTC [web-1] [martini] Started GET /robots.txt for [filtered IP]
2015-02-17 03:40:14.075881300 +0000 UTC [web-1] [martini] Completed 404 Not Found in 490.714us
2015-02-17 03:40:14.137580886 +0000 UTC [web-2] [martini] Started GET / for [filtered IP]
2015-02-17 03:40:14.137823473 +0000 UTC [web-2] [martini] Completed 200 OK in 479.471us
2015-02-17 16:49:08.560437937 +0000 UTC [web-1] [martini] Started GET / for [filtered IP]
2015-02-17 16:49:08.560662564 +0000 UTC [web-1] [martini] Completed 200 OK in 685.771us
```


--- row ---

### Stream logs

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
  "timestamp": "<date>"
}
```

