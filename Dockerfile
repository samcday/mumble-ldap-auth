FROM ubuntu:20.04
RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get -y install \
        gettext \
        python3 \
        python3-ldap \
        python3-zeroc-ice \
        zeroc-ice-slice && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /opt

COPY entrypoint.sh /opt
COPY LDAPauth.py /opt
COPY LDAPauth-template.ini /opt
COPY Murmur.ice /opt/Murmur.ice

ENTRYPOINT ["/opt/entrypoint.sh"]
