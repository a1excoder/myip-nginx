server {
  	listen 0.0.0.0:80;
  	listen [::]:80;
	
	  server_name myip.example.com;

  	access_log /var/log/nginx/myip.example.com.access.log;
  	error_log /var/log/nginx/myip.example.com.error.log;

    location / {
    	add_header Cache-Control "no-store, no-cache, must-revalidate, max-age=0";
  		root /var/www/http.myip.example.com;
  		proxy_set_header Host $host;
  		proxy_set_header X-Real-IP $remote_addr;
  		proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    }

}


server {
	listen 0.0.0.0:443 ssl;
	listen [::]:443 ssl;
	http2 on;
	
	server_name myip.example.com;

	access_log /var/log/nginx/myip.example.com.access.log;
	error_log /var/log/nginx/myip.example.com.error.log;

	ssl_certificate	/etc/letsencrypt/live/myip.example.com/fullchain.pem;
	ssl_certificate_key /etc/letsencrypt/live/myip.example.com/privkey.pem;
	
  location / {
    add_header Cache-Control "no-store, no-cache, must-revalidate, max-age=0";
  	root /var/www/myip.example.com;
  	proxy_set_header Host $host;
  	proxy_set_header X-Real-IP $remote_addr;
  	proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
  }
}
