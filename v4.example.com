server {
	listen 0.0.0.0:80;
	
	server_name v4.example.com;

	access_log /var/log/nginx/v4.example.com.access.log;
	error_log /var/log/nginx/v4.example.com.error.log;

  location / {
   	add_header Access-Control-Allow-Origin "http://myip.example.com";
   	add_header Vary "Origin";
   	add_header Content-Type application/json always;

	  return 200 '{"ip": "$remote_addr", "port": "$remote_port"}';
	  try_files $uri $uri/ =404;
  }

}


server {
	listen 0.0.0.0:443 ssl;
	http2 on;
	
	server_name v4.example.com;

	access_log /var/log/nginx/v4.example.com.access.log;
	error_log /var/log/nginx/v4.example.com.error.log;

	ssl_certificate	/etc/letsencrypt/live/v4.example.com/fullchain.pem;
	ssl_certificate_key /etc/letsencrypt/live/v4.example.com/privkey.pem;
	
  location / {
    add_header Access-Control-Allow-Origin "https://myip.example.com";
    add_header Vary "Origin";
    add_header Content-Type application/json always;

		return 200 '{"ip": "$remote_addr", "port": "$remote_port"}';
		try_files $uri $uri/ =404;
  }
}
