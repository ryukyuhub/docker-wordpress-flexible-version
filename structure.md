# プロジェクト構成

## ディレクトリ構成
```
/
├── .env                    # 環境変数ファイル
├── .git/
├── cmd.md                  # コンテナ操作コマンド
├── docker-compose.yml
├── structure.md
├── plugins/                # WordPressプラグイン用ディレクトリ
│   └── (初期は空 - プラグインファイルがマウントされる場所)
├── themes/                 # WordPressテーマ用ディレクトリ
│   └── (初期は空 - テーマファイルがマウントされる場所)
└── wordpress/               # Docker設定ファイル
    ├── Dockerfile-5.6       # PHP 5.6環境
    ├── Dockerfile-7.4       # PHP 7.4環境
    ├── Dockerfile-8.3       # PHP 8.3環境
    ├── docker-entrypoint.sh # コンテナ起動スクリプト
    └── php.ini              # PHP設定ファイル
```

## 設定ファイル詳細

### .env
データベース接続情報を管理：
- DB_USER: データベースユーザー
- DB_PASSWORD: データベースパスワード
- DB_NAME: データベース名
- DB_ROOT_PASSWORD: MySQLルートパスワード

### docker-compose.yml
3つのサービスを定義：
- wordpress: Apache+PHP環境
- mysql: MySQL 8.0データベース
- phpmyadmin: データベース管理インターフェース

### Dockerfileの違い
- **Dockerfile-5.6**: PHP 5.6
- **Dockerfile-7.4**: PHP 7.4
- **Dockerfile-8.3**: PHP 8.3

### docker-entrypoint.sh
コンテナ起動時の処理：
1. WordPressの条件付きインストール
2. ファイル権限の自動修正
3. Apacheの起動

## ボリューム管理
- `wordpress_data`: WordPressコアファイル
- `mysql_data`: MySQLデータ
- `themes/`: テーマファイル（ホスト側マウント）
- `plugins/`: プラグインファイル（ホスト側マウント）

## ポート設定
- 8080: WordPress（HTTP）
- 8081: phpMyAdmin
- 3308: MySQL（外部接続用）

## 開発ワークフロー
1. `docker compose up` でコンテナ起動
2. `themes/` と `plugins/` でファイル編集
3. 変更は即座にコンテナに反映される
4. http://localhost:8080 でWordPressアクセス
5. http://localhost:8081 でphpMyAdminアクセス