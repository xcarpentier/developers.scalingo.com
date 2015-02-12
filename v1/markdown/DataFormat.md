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

