ARG BUILD_FROM
FROM $BUILD_FROM

# Install QDevice
RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update -y && \
    apt-get install -y --no-install-recommends corosync-qnetd corosync-qdevice && \
    apt-get -y clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]