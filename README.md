## メモ
- 依存モジュールは `local` 以下
  - モジュールを利用してPerlスクリプトを利用する場合は `carton exec` を利用する

## 起動
```shell
carton exec -- perl -Ilib script/scheduler-server
```

```shell
carton exec -- plackup -Ilib -R ./lib --access-log /dev/null -p 5000 -a ./script/scheduler-server
```

## SQLite のマイグレーション
```shell
sqlite3 db/development.db < sql/sqlite.sql
```

## テスト
```shell
carton exec prove t
```
