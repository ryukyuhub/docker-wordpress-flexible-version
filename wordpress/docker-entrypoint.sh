#!/bin/bash

# Wordpressがインストールされていない場合はインストールする
# '/var/www/html'に'wp-config-sample.php'が無いことを条件にする
if [ ! -f /var/www/html/wp-config-sample.php ]; then
    echo "Wordpressがインストールされていないので、インストールします..."

    # curlでダウンロードするファイルを変更することでWordpressのバージョンを変更できる
    curl -o wordpress.tar.gz -fSL "https://wordpress.org/wordpress-6.8.1.tar.gz"
    # curl -o wordpress.tar.gz -fSL "https://wordpress.org/wordpress-4.4.33.tar.gz"

    tar -xzf wordpress.tar.gz --strip-components=1
    rm wordpress.tar.gz

    chown -R www-data:www-data /var/www/html

    chmod -R 755 /var/www/html

    echo "Wordpressのインストールが完了しました。"
fi

# ファイルの所有者をwww-dataに変更する
chown -R www-data:www-data /var/www/html

# ファイルのパーミッションを755に変更する
chmod -R 755 /var/www/html

# Apacheを起動する
exec apache2-foreground