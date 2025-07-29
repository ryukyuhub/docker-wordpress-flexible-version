## ホストからコンテナに入る
```bash
docker exec -it wordpress-wordpress-1 bash
```

## ホストからコンテナと関連イメージとボリューム全削除
```bash
docker-compose down --rmi all --volumes --remove-orphans
```