FROM centos:7
MAINTAINER andresvega565

ENV FTP_USER=admin \
    FTP_PASS=admin \
    LOG_STDOUT=false \
    ANONYMOUS_ACCESS=false \
    UPLOADED_FILES_WORLD_READABLE=false \
    CUSTOM_PASSIVE_ADDRESS=false

RUN \
  rpm --rebuilddb && yum clean all && \
  yum install -y vsftpd && \
  yum clean all

COPY container-files /

EXPOSE 20-21 21100-21110

ENTRYPOINT ["/bootstrap.sh"]
