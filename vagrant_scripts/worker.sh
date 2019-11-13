#!/bin/bash

echo "[${0}]"

iconv -f utf-16 -t utf-8 /tmp/token.sh -o /tmp/token.sh && tr -d '\r' < /tmp/token.sh > /tmp/token_.sh

kubeadm reset --force; bash /tmp/token_.sh