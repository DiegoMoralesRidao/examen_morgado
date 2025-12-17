#!/bin/bash

configurar_ssh() {

  # Deshabilitar el login de root
  sed -i 's/#PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/sshd_config
  # Cambiar el puerto de SSH
  sed -i 's/#Port.*/Port '$PORT_SSH'/' /etc/ssh/sshd_config

  mkdir -p /run/sshd
  mkdir /home/${USUARIO}/.ssh
  cat /root/admin/ubbase/common/id_rsa.pub >> /home/${USUARIO}/.ssh/authorized_keys
  #service ssh restart
  #exec /usr/sbin/sshd -D & # dejar el ssh en background
  exec /usr/sbin/sshd -D &
}