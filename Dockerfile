FROM suse/sles12sp2:latest

ADD http://149.44.52.59/pub/RHN-ORG-TRUSTED-SSL-CERT /etc/pki/tru
s/anchors/RHN-ORG-TRUSTED-SSL-CERT
RUN update-ca-certificates

RUN zypper ref -s
RUN zypper -n in apache2

EXPOSE 80

RUN systemctl start apache2.service
