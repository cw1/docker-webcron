# docker-webcron

Simple and small webcron docker container based an alpine linux with curl. Ideal for updating your DynDNS or triggering a website on a regular basis.

## Usage
Simple run the following command:
```
docker run --name "webcron" -e INTERVAL_TIME="300" -e URL="https://example.com/cron.php" -e CURL_PARAM="--insecure" cw1900/docker-webcron
```
 
## Parameters

### URL (required):
The URL which getting pulled by curl.

### INTERVAL_TIME (optional):
Set the interval time between polling in seconds. Default is 300.
 
### CURL_PARAM (optional):
Optional parameters for cURL.
