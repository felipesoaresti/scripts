#! /bin/bash
#vi /etc/profile.d/proxy.sh
# Criar proxy no profile 

MY_PROXY_URL="meu_proxy.com:3128"

HTTP_PROXY=$MY_PROXY_URL
HTTPS_PROXY=$MY_PROXY_URL
FTP_PROXY=$MY_PROXY_URL
http_proxy=$MY_PROXY_URL
https_proxy=$MY_PROXY_URL
ftp_proxy=$MY_PROXY_URL

export HTTP_PROXY HTTPS_PROXY FTP_PROXY http_proxy https_proxy ftp_proxy

###
# Dicas:
# vi /etc/dnf/dnf.conf
# add to the end
#proxy=meu_proxy.com:3128

# for curl
# vi ~/.curlrc
# create new
#proxy=meu_proxy.com:3128

# for wget
# vi /etc/wgetrc
# add to the end
#http_proxy = meu_proxy.com:3128
#https_proxy = meu_proxy.com:3128
#ftp_proxy = meu_proxy.com:3128
