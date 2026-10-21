# phpmyadmin-with-basic-auth

"安心" のために https://github.com/phpmyadmin/docker にBASIC認証を追加できるようにしたコンテナイメージです。

公式イメージ (`phpmyadmin/phpmyadmin`) は再ビルドが遅れて脆弱性を含むPHPイメージのまま配布されることがあるため、
公式イメージを `FROM` するのではなく、[公式イメージのApache版Dockerfile](https://github.com/phpmyadmin/docker/blob/master/apache/Dockerfile) を本リポジトリに取り込み、
[PHP公式イメージ](https://hub.docker.com/_/php) (`php:8.3-apache`) から直接ビルドしています。

- phpMyAdmin: 5.2.3（対応PHPは `>=7.2,<8.4` のため PHP 8.3 系を使用。参照: https://www.phpmyadmin.net/downloads/ ）
- ベースイメージ及び Debian パッケージの更新を取り込むため、GitHub Actions で毎週再ビルドしています。

## Files

| ファイル | 内容 |
| --- | --- |
| [src/Dockerfile](src/Dockerfile) | 公式イメージの [apache/Dockerfile](https://github.com/phpmyadmin/docker/blob/master/apache/Dockerfile) をベースに BASIC認証の設定を追加したもの |
| [src/config.inc.php](src/config.inc.php), [src/helpers.php](src/helpers.php), [src/docker-entrypoint.sh](src/docker-entrypoint.sh) | 公式イメージの [apache/](https://github.com/phpmyadmin/docker/tree/master/apache) から無改変で取り込んだもの |
| [src/config.user.inc.php](src/config.user.inc.php) | `PMA_SSL` 用の追加設定 |
| [src/basic-auth.conf](src/basic-auth.conf), [src/docker-entrypoint-with-basic-auth.sh](src/docker-entrypoint-with-basic-auth.sh) | BASIC認証の設定 |

phpMyAdmin を更新する際は、公式リポジトリの `apache/` 配下の差分を取り込み `VERSION` / `SHA256` を更新してください。

## Usage

[公式イメージの環境変数](https://github.com/phpmyadmin/docker#environment-variables-summary)に加えて以下の環境変数を指定することでBASIC認証を設定できます。

- `BACIC_AUTH_USER`
- `BACIC_AUTH_PASSWORD`

また `PMA_SSL` 環境変数に `1` を設定することでSSL/TLS設定を有効にしてサーバに接続するようになります。
PlanetScaleなどのDBaaSに接続する際に設定します。

GitHub Packages 及び ECR Public に公開しています。

- https://github.com/7474/phpmyadmin-with-basic-auth/pkgs/container/phpmyadmin-with-basic-auth
  - `docker pull ghcr.io/7474/phpmyadmin-with-basic-auth:latest`
- https://gallery.ecr.aws/g2g6t4l2/phpmyadmin-with-basic-auth-repo
  - `docker pull public.ecr.aws/g2g6t4l2/phpmyadmin-with-basic-auth-repo:latest`

## Example

- [docker-compose.yml](src/docker-compose.yml): docker-compose の例です
- [example-terraform](example-terraform): [AWS App Runner](https://aws.amazon.com/jp/apprunner/) にホスティングするTerraformコードの例です
  ![app-runner-phpmyadmin](https://user-images.githubusercontent.com/4744735/166311582-7f600b45-2fda-42aa-a897-0ceb395c375d.gif)
