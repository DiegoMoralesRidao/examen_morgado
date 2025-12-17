#!/bin/bash
set -e

source /root/admin/ubbase/usuarios/mainuser.sh
source /root/admin/ubbase/ssh/mainssh.sh
source /root/admin/ubbase/sudo/mainsudo.sh

main(){
    # Gestión de usuario --> getuser.sh
    # Gestión del sudo --> getsudo.sh
    # ...
    mkdir -p /root/logs
    touch /root/logs/informe.log
    newUser
    resuser=$?
    configurar_sudo
    configurar_ssh

    # Encargada de mantener el contenedor en ejecución de Background
    #tail -f /dev/null   
}

main