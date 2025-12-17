#!/bin/bash

set -e 

load_entrypoint_nginx(){
    bash /root/admin/nginx/admin/start.sh
}

workdir(){
    cd /root/admin/node/proyecto/pproyecto
}

dependencias(){
    npm install
    npm run dev -- --host 0.0.0.0 --port 3000
}

construir_copiar(){
    npm run build
    cp -r dist/* /var/www/html/
}
config_nginx(){
    nginx -g 'daemon off;'
}
main(){
    load_entrypoint_nginx
    workdir
    dependencias
    workdir
    construir_copiar
    config_nginx
}

main