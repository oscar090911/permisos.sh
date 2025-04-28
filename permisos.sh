#!/bin/bash

# Pregunta al usuario si se trata de Plesk o DirectAdmin
echo "¿El sistema es 'plesk' o 'directadmin'?"
read -r SISTEMA

# Valida la respuesta del usuario
if [[ "$SISTEMA" != "plesk" && "$SISTEMA" != "directadmin" ]]; then
    echo "Error: Sistema inválido. Debes escribir exactamente 'plesk' o 'directadmin'."
    exit 1
fi

# Pregunta al usuario la ruta del dominio
echo "Proporciona la ruta del dominio (por ejemplo, /var/www/vhosts/DOMINIO/httpdocs o /home/USUARIO/domains/DOMINIO/public_html):"
read -r DIRECTORIO

# Verifica si el directorio existe
if [ ! -d "$DIRECTORIO" ]; then
    echo "Error: El directorio '$DIRECTORIO' no existe."
    exit 1
fi

# Asigna los permisos dependiendo del sistema
if [ "$SISTEMA" == "plesk" ]; then
    echo "Asignando permisos para Plesk..."
    find "$DIRECTORIO" -type d -print0 | xargs -0 chmod 755   # Directorios: 755
    find "$DIRECTORIO" -type f -print0 | xargs -0 chmod 644   # Archivos: 644
    echo "Permisos para Plesk asignados correctamente."
elif [ "$SISTEMA" == "directadmin" ]; then
    echo "Asignando permisos para DirectAdmin..."
    find "$DIRECTORIO" -type d -print0 | xargs -0 chmod 755   # Directorios: 755
    find "$DIRECTORIO" -type f -print0 | xargs -0 chmod 644   # Archivos: 644
    echo "Permisos para DirectAdmin asignados correctamente."
fi
