# myip-nginx
Simple myip service for check client ip(v4/v6), only nginx &amp; html/js on client

```conf
return 200 '{"ip": "$remote_addr", "port": "$remote_port"}';
```
