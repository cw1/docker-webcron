# docker-webcron

Simple and small webcron docker container based an alpine linux with curl. Ideal for updating your DynDNS or triggering a website on a regular basis.

## Usage
Simply run the following command:
```
docker run --name "webcron" -e INTERVAL_TIME="300" -e URL="https://example.com/cron.php" -e CURL_PARAM="--insecure" cw1900/docker-webcron
```
### docker-compose

Include docker-webcron in a docker-compose.yaml file:

```
version: '3.8'
services:
    webcron:
    image: cw1900/docker-webcron
    restart: always
    environment:
      - INTERVAL_TIME=300
      - URL=https://example.com/cron.php
```
 
## Parameters

### URL (required):
The URL which getting pulled by curl.

### INTERVAL_TIME (optional):
Set the interval time between polling in seconds. Default is 300.
 
### CURL_PARAM (optional):
Optional parameters for cURL.

### MATCHING_DAY, MATCHING_HOUR, MATCHING_MINUTE (optional):
Only execute curl if the DATETIME matches all set `MATCHING_*` variables.
The allowed variable values are defined according to `date`:

* `MATCHING_DATE`: Day of week (0..6); 0 is Sunday
* `MATCHING_HOUR`: Hour (00..23)
* `MATCHING_MINUTE`: Minute (00..59)

Usage examples:

1. `MATCHING_DAY=0` executes curl only on sundays according to `INTERVAL_TIME`
2. `MATCHING_DAY=0 MATCHING_HOUR=12` executes curl only on sundays between 12:00 and 12:59 according to `INTERVALL_TIME`
3. `MATCHING_DAY=0 MATCHING_HOUR=12 MATCHING_MINUTE=15` executes curl only on sundays between 12:15:00 and 12:15:59 according to `INTERVALL_TIME`

Be sure that your `INTERVAL_TIME` allows for execution within the `MATCHING_*` time window.
E.g. `INTERVALL_TIME=300` could cause no execution to be triggered in the third example.
