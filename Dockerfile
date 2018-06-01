FROM https://portus.sto.suse.home:5000/base_images/sles12sp3:2.0.2
MAINTAINER Richard Schaertel

ARG repo
ARG cert

ADD http://149.44.53.59/pub/RHN-ORG-TRUSTED-SSL-CERT /etc/pki/trust/anchors/RHN-ORG-TRUSTED-SSL-CERT
RUN update-ca-certificates

RUN zypper ref -s
RUN zypper -n in apache2

EXPOSE 80

RUN systemctl start apache2.service
