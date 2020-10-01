tetra-help(){
  echo "
Tetra is a collection of shell functions for creating a service mesh
supported by nginx server.  Config begins in /var/tetra/

config  -- systemwide config
paths   -- contains files named by app.example.com-IP-PORT

Example pathway app.example.com-12.34.567-8-2200:

    server {
        listen 80;
        server_name app.example.com;
        location / {
            proxy_pass http://IP:PORT;
        }
    }

To add a pathway to the /var/tetra/pathway:
   tetra-path app.example.com 12.34.567.8 2200

To compile all paths to nginx config:
   tetra-paths-to-nginx /etc/nginx/sites-enabled

To restart server:
   tetra-restart

To query network and nginx server status
    tetra-status
"
}
tetra-reload(){
  systemctl restart nginx 
}

tetra-restart(){
  systemctl restart nginx 
}

 tetra-status(){
 networkctl status
 systemctl status nginx 
}

tetra-path(){
printf "%s" "server {
        listen 80;
        server_name $1;
        location / {
            proxy_pass http://$2:$3;
        }
    }
"
}
