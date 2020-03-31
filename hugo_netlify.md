---

title: Hugo+Netlify部署博客
date: 2019-03-08 19:37:38
tags: [hugo, github]
categories: [web]
description: "Hugo+Netlify部署博客"
menu:
  main:
    name: Hugo+Netlify
    weight: 10
---

## Hugo

### 安装

- 下载[Hugo](https://github.com/gohugoio/hugo/releases) 如主题提示需要扩展包，选择相应的文件包 [参考文档](https://gohugo.io/documentation/) [中文文档](https://www.gohugo.org/)

- 解压后放置你准备的目录，将hugo.exe所在目录添加到环境变量path后面

- 验证

```bash
# 验证安装
$ hugo version 
```

### 生成站点

- 在希望的路径下执行

```bash
# 生成站点
$ hugo new site /path/to/site
```

- 进入目录后创建文章

```bash
# 创建页面
$ cd site
$ hugo new about.md
# 创建文章
$ hugo new post/first.md
```

- 安装皮肤

```bash
# 创建 themes 目录
$ cd themes
$ git clone https://github.com/spf13/hyde.git
# 如果需要部署到Netlify，采用以下方式
$ cd site
$ git submodule add https://github.com/alex-shpak/hugo-book themes/book
```

- 运行Hugo

在你的站点根目录执行 Hugo 命令进行调试：

```bash
# 运行Hugo
$ cd site
$ hugo server --theme=hyde --buildDrafts
```

浏览器里打开： http://localhost:1313

- 部署

在站点根目录执行 Hugo 命令生成最终页面

```bash
# 生成最终页面
$ cd site
# 部署到GitHub
$ git add .
$ git commit -m "Create blog.wesvi.com"
$ git push -u origin master
```

### 部署到netlify

网站根目录添加netlify.toml，参考内容如下：[Netlify参考文档](https://docs.netlify.com/)

```bash
[build]
publish = "public"
command = "hugo --gc --minify"

[context.production.environment]
HUGO_VERSION = "0.68.0"
HUGO_ENV = "production"
HUGO_ENABLEGITINFO = "true"

[context.split1]
command = "hugo --gc --minify --enableGitInfo"

[context.split1.environment]
HUGO_VERSION = "0.68.0"
HUGO_ENV = "production"

[context.deploy-preview]
command = "hugo --gc --minify --buildFuture -b $DEPLOY_PRIME_URL"

[context.deploy-preview.environment]
HUGO_VERSION = "0.68.0"

[context.branch-deploy]
command = "hugo --gc --minify -b $DEPLOY_PRIME_URL"

[context.branch-deploy.environment]
HUGO_VERSION = "0.68.0"

[context.next.environment]
HUGO_ENABLEGITINFO = "true"
```


### 配置

[https://gohugo.io/getting-started/configuration/](https://gohugo.io/getting-started/configuration/)
## 参考资料

1. [如何制作个人学术主页](https://www.zhihu.com/question/281476526/answer/1051917800)
1. [使用Hugo搭建自己的博客](https://www.jianshu.com/p/8c3d7dfb09a0) - 简书
1. [Hosting on GitHub Pages](https://www.gohugo.org/doc/tutorials/github-pages-blog/) - Hugo中文文档
1. [Hugo-框架学习](https://segmentfault.com/a/1190000016078760#item-1)


## Hugo themes

https://www.xianmin.org/

https://github.com/xianmin/hugo-theme-jane

https://github.com/servicemesher/website

## Hugo输出API

主要参考以下两篇文章

[使用 Hugo 生成 API 接口](https://soulteary.com/2018/09/14/use-hugo-to-generate-the-api-interface.html)

[hugoGetApi](https://github.com/regisphilibert/hugoGetApi)，但这篇文章里由于版本原因，其实例代码里修改config.toml文件中suffix为suffixes
