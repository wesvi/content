---

title: Emacs安装配置
date: 2019-02-24 00:02:29
tags: [emacs]
categories: [programming]
description: "Emacs安装配置"
draft: false

---

# Emacs安装配置

## 安装

win7环境

* 设置**PATH**，`;D:\app\emacs\bin`

* 创建快捷方式，位置处填入`D:\app\emacs\bin\runemacs.exe --debug-init`

## 配置

* 确保`C:\Users\XXXX\AppData\Roaming`目录下无`.emacs`文件

* 在`C:\Users\XXXX\AppData\Roaming`目录下创建`.emacs.d`文件夹

```
;; Without this comment emacs25 adds (package-initialize) here
;; (package-initialize)

(setenv "HOME" "D:/app/emacs")
(setenv "PATH" "D:/app/emacs")
(setq default-directory "~/")
(load-file "D:/app/emacs/.emacs.d/init.el")
```

* 在`D:\app\emacs\.emacs.d`目录下创建`inin.el`空文件，以后配置信息写入该文件

* 安装**markdown-mode**插件`M-x package-install RET markdown-mode RET`
