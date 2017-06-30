#!/bin/bash

PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

/usr/bin/certbot renew --pre-hook "/usr/sbin/service {{ webserverType }} stop" --post-hook "/usr/sbin/service {{ webserverType }} start" --standalone --agree-tos --rsa-key-size 4096 --non-interactive --email {{ email }}

if [ $? -ne 0 ]
then
  ERRORLOG=`tail /var/log/letsencrypt/letsencrypt.log`
  echo -e "The Lets Encrypt Certs have not been renewed! \n \n" $ERRORLOG | mail -s "Lets Encrypt Cert Alert" {{ email }}
fi

exit 0
