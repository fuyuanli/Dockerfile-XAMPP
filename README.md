# XAMPP Dockerfile

This is a Dockerfile to build XAMPP based on ubuntu:16.04, and you can also find it on [Docker Hub](https://hub.docker.com/r/fuyuanli/xampp/) .

### Build Image From Dockerfile

First, using command `git clone` to clone this project.

    $ git clone https://github.com/fuyuanli/Dockerfile-XAMPP.git

Second, buildng XAMPP image form Dockerfile, you can use tag `-t` to name this image.

    $ docker build -t fuyuanli/xampp .

### Useage

Setup 1 : Pull this image from Docker Hub.

    $ docker pull fuyuanli/xampp

or building this image from Dockerfile .

    $ docker docker build -t fuyuanli/xampp .  

Setup 2 : Now you have a xampp image,and using command `docker run` to run , and use tag `-v` to mount on your folder, tag `-p` can forward the port `80` (HTTP) , `443` (HTTPS) , and `3306` (MariaDB/MySQL) .

The path `/opt/lampp/htdocs` is the web root directory , mount it so you can edit your website easily.

    $ docker run -d -v /to/your/path:/opt/lampp/htdocs -p 80:80 -p 443:443 -p 3306:3306 fuyuanli/xampp

The path `/opt/lampp/htdocs` is the web root directory , mount it, let you edit the website easily.

### Access Your Contaier

Usig the command `docker exec -it fuyuanli/xampp bash` to run `bash` in the live container, and you can use command `mysql`, `php`... without `cd /opt/lampp/bin` , the path has been added in `/root/.bashrc`.

如果你看的懂中文的話，那就看英文吧。懶得再打了XDDD。
