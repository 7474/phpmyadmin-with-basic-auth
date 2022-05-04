# phpmyadmin-with-basic-auth

"安心" のために https://github.com/phpmyadmin/docker にBASIC認証を追加できるようにしたコンテナイメージです。

## Usage

ベースイメージの設定に加えて以下の環境変数を指定することでBASIC認証を設定できます。

- `BACIC_AUTH_USER`
- `BACIC_AUTH_PASSWORD`

GitHub Packages 及び ECR Public に公開しています。

- https://github.com/7474/phpmyadmin-with-basic-auth/pkgs/container/phpmyadmin-with-basic-auth
  - `docker pull ghcr.io/7474/phpmyadmin-with-basic-auth:latest`
- https://gallery.ecr.aws/g2g6t4l2/phpmyadmin-with-basic-auth-repo
  - `docker pull public.ecr.aws/g2g6t4l2/phpmyadmin-with-basic-auth-repo:latest`

## Example

- [docker-compose.yml](docker-compose.yml): docker-compose の例です
- [example-terraform](example-terraform): [AWS App Runner](https://aws.amazon.com/jp/apprunner/) にホスティングするTerraformコードの例です
  ![app-runner-phpmyadmin](https://user-images.githubusercontent.com/4744735/166311582-7f600b45-2fda-42aa-a897-0ceb395c375d.gif)
