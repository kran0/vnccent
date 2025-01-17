#!/bin/sh -x

DEFAULT_HOME="/opt/default/home/"
VNC_PASSWORD="${VNC_PASSWORD:-resu2020}"
VNC_GEOMETRY="${VNC_GEOMETRY:-1280x720}"

if [ -z "${HOME}" ] || [ "${HOME}" = "/" ]
then
 echo 'ERROR: Wrong ENV $HOME is set. Aborting'
 exit 1
fi

[ -d ${HOME}/.vnc ] || (
 echo "Info: Bootstrapping ${HOME} directory from ${DEFAULT_HOME}"
 mkdir -vp "${HOME}/.vnc"
 cp -var "${DEFAULT_HOME}/." "${DEFAULT_HOME}/.vnc" "${HOME}/"
 printf '%s\n' ${VNC_PASSWORD} ${VNC_PASSWORD} n | vncpasswd
)

# start VNC server

exec vncserver -fg -geometry ${VNC_GEOMETRY}
