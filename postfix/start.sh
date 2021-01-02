#!/bin/bash

# Berkeley DBのインストール
cd ~
wget http://download.oracle.com/berkeley-db/db-5.1.29.tar.gz
tar -zxvf db-5.1.29.tar.gz
cd ~/db-5.1.29/build_unix/
make
make install

# Postfixのインストール
cd ~/
wget http://mirror.postfix.jp/postfix-release/official/postfix-3.5.8.tar.gz
tar -zxvf postfix-3.5.8.tar.gz
cd ~/postfix-3.5.8/
make
make install