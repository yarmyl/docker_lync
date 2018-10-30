FROM ubuntu:bionic

ENV DEBIAN_FRONTEND noninteractive.
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y language-pack-ru
ENV LANGUAGE ru_RU.UTF-8
ENV LANG ru_RU.UTF-8
ENV LC_ALL ru_RU.UTF-8
RUN locale-gen ru_RU.UTF-8 && dpkg-reconfigure locales

RUN apt-get update && \
  apt-get install -y pidgin pidgin-sipe pidgin-plugin-pack && \
  apt-get install -y dbus-x11 && \
  apt-get install -y python3

RUN apt-get install -y git && \
  apt-get clean -y && \
  git clone https://github.com/yarmyl/send_lync_im.git

COPY run.sh /bin/

RUN chmod +x /bin/run.sh && \
  mkdir /root/.purple/

COPY .purple/ /root/.purple/

#ENTRYPOINT ["/bin/run.sh"]
CMD ["/bin/run.sh"]
