#!/bin/sh

BASEPATH=$(cd `dirname $0`; pwd)

# create self-signed server certificate:

read -p "Enter your domain [www.example.com]: " DOMAIN

if [ ! -d $DOMAIN ]; then
  mkdir $DOMAIN
fi

cd $DOMAIN

echo "Create server key..."

openssl genrsa -des3 -out $DOMAIN.key 1024

echo "Create server certificate signing request..."

SUBJECT="/C=US/ST=Mars/L=iTranswarp/O=iTranswarp/OU=iTranswarp/CN=$DOMAIN"

openssl req -new -subj $SUBJECT -key $DOMAIN.key -out $DOMAIN.csr

echo "Remove password..."

mv $DOMAIN.key $DOMAIN.origin.key
openssl rsa -in $DOMAIN.origin.key -out $DOMAIN.key

echo "Sign SSL certificate..."

openssl x509 -req -days 3650 -in $DOMAIN.csr -signkey $DOMAIN.key -out $DOMAIN.crt

echo "TODO:"
echo "Copy $DOMAIN.crt to $BASEPATH/$DOMAIN/$DOMAIN.crt"
echo "Copy $DOMAIN.key to $BASEPATH/$DOMAIN/$DOMAIN.key"
echo "Add configuration in nginx:"
echo "server {"
echo "    ..."
echo "    listen 443 ssl;"
echo "    ssl_certificate     $BASEPATH/$DOMAIN/$DOMAIN.crt;"
echo "    ssl_certificate_key $BASEPATH/$DOMAIN/$DOMAIN.key;"
echo "}"