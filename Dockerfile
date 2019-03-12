FROM linuxserver/webgrabplus:latest
RUN apt-get update && apt install git -y

ADD config/WebGrab++.config.xml config/providers/* /config/
ADD entrypoint.sh /entrypoint.sh
ENV GIT_REPO="git@gitlab.com:xxxx/epg.git"
ENV TZ Europe/Madrid
ENV GIT_SSH_COMMAND="ssh -oStrictHostKeyChecking=no -i /data/private.key"
RUN  echo $TZ > /etc/timezone

RUN chmod +x /defaults/update.sh && chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
