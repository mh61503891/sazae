# Sazae

code4tottori のハッカソンでの成果

https://code4tottori.doorkeeper.jp/events/28892
https://code4tottori.doorkeeper.jp/events/34388

# heroku で動かす手順

## 前準備

* sazae を github リポジトリからクローンできてる?
* heroku のクライアントツールは導入しているか? ( `gem install heroku` とか )

## 手順

1. heroku でアプリケーションを作成する
2. 作成した heroku アプリケーションに環境変数を設定 (設定内容後述)
3. 上記ののち、

```
git clone {sazae の github リポジトリ}
cd sazae/
heroku git:remote -a {herokuでのアプリケーション名}
git push heroku master
```

### heroku アプリケーションに設定する環境変数

| 名称                      | 値                                  |
|---------------------------|-------------------------------------|
| LANG                      | ja_JP.UTF-8                         |
| TZ                        | Asia/Tokyo                          |
| RACK_ENV                  | heroku                              |
| RAILS_ENV                 | heroku                              |
| RAILS_SERVE_STATIC_FILES  | enabled                             |
| SECRET_KEY_BASE           | (rake secret コマンドの出力結果等)  |
| BUNDLE_WITHOUT            | development:test:production         |

上記は Rails on Heroku での一般的な設定な構成(微妙に方言あるけど)であり、
アプリケーション独自の設定として以下があります。

| 名称                | 値                   |
|---------------------|----------------------|
| BASIC_AUTH_PASSWORD | 基本認証のパスワード |
| BASIC_AUTH_USERNAME | 基本認証のユーザ名   |

`BASIC_AUTH_USERNAME` `BASIC_AUTH_PASSWORD` は両方設定するとその情報により基本認証がかかります。

## FAQ

* なんだかトップページはハッカソンの発表で見たやつじゃないな...
  * > /houses/1 の URL を御覧ください
* デプロイしたけど、アクセスすると動かない
  * > DB マイグレートしましたか? ( `heroku run rake db:migrate` )
* デプロイしたけど、データが変。初期データが無い気がする
  * > DB にシードはぶっこみましたか? ( `heroku run rake db:seed` )
* ログ見たい
  * > `heroku logs` とか `heroku logs -t` とか
* なんだかCSS効いてない?
  * > RAILS_SERVE_STATIC_FILES の値を確認してください

