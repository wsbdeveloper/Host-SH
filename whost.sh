#!/bin/bash
if [ "$1" == "" ]
then
echo -e "<=== #################################### ===>\n"
echo -e "Buscando Hosts..."
echo -e "Exemplo uso da Ferramenta :"
echo -e "/DesecParse.sh www.alvo.com.br\n"
echo -e "<=== #################################### ===>\n"
else
mkdir -p -v /Documentos/DesecParsing/$1/
wget -c -q -P /Documentos/DesecParsing/$1/ $1 
cd /Documentos/DesecParsing/$1
cat index.html | grep "http://" | cut -d "/" -f 3 | grep ".com" | cut -d '"' -f 1 > List
echo "| +++++++++++++++++++++++++++++++++++++++++++++++++++++++++ |"
echo "Resolvendo Hosts"
host $1 | grep "has address"
for url in $(cat List);do host $url;done | grep "has address"
fi