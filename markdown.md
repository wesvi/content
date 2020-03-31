---

title: Markdown
date: 2019-02-17 19:37:38
tags: [markdown]
categories: [programming]
description: "Markdown语法"
draft: false

---

# Markdown

<html>
<iframe frameborder="no" border="0" marginwidth="0" marginheight="0" width=298 height=52 src="//music.163.com/outchain/player?type=2&id=5242686&auto=0&height=32"></iframe>
</html>

Markdown是一种纯文本格式的标记语言。通过简单的标记语法，它可以使普通文本内容具有一定的格式。其基本语法如下：

---

## 标题

标题能显示出文章的结构。行首插入1-6个`#`，每增加一个表示更深入层次的内容，对应到标题的深度由1-6阶。

```
# H1
## H2
### H3
#### H4
##### H5
###### H6
```
```
这是一个一级标题
====
或者二级标题
---
```

---

## 文本样式

```
**这是加粗的文字**  
__这是加粗的文字__  
*这是倾斜的文字*  
_这是倾斜的文字_  
***这是斜体加粗的文字***  
~~这是加删除线的文字~~  
`文字高亮`  
三个以上的*、-、_建立一个分隔线
```

**这是加粗的文字**  
__这是加粗的文字__  
*这是倾斜的文字*  
_这是倾斜的文字_  
***这是斜体加粗的文字***  
~~这是加删除线的文字~~  
`文字高亮`  
三个以上的`*`、`-`、`_`建立一个分隔线

---

## 代码区块

```
    连续4个空格或1个Tab键是单行文本
```
```
    在连续几行的文本开头加入1个Tab或者4个空格
    在连续几行的文本开头加入1个Tab或者4个空格
```

或包围在一对各三个的反引号\`\`\`中

    ```
    代码区块
    ```

---

## 区块引用

```
> 区块引用
>
>> 区块引用可以嵌套
>
> 区块内也可以使用其他的***Markdown***语法
```
> 区块引用
>
>> 区块引用可以嵌套
>
> 区块内也可以使用其他的***Markdown***语法

---

## 列表

```
* Red
* Green
* Blue
```

* Red
* Green
* Blue

```
+ Red
+ Green
+ Blue
```

+ Red
+ Green
+ Blue

```
- Red
- Green
- Blue
```

- Red
- Green
- Blue

```
1. Red
2. Green
3. Blue
```
1. Red
2. Green
3. Blue

列表项目标记通常是放在最左边，但是其实也可以缩进，最多3个空格，项目标记后面则一定要接着至少一个空格或制表符。

列表项目可以包含多个段落，每个项目下的段落都必须缩进4个空格或是1个制表符。

```
1.  This is a list item with two paragraphs. Lorem ipsum dolor
    sit amet, consectetuer adipiscing elit. Aliquam hendrerit
    mi posuere lectus.

    Vestibulum enim wisi, viverra nec, fringilla in, laoreet
    vitae, risus. Donec sit amet nisl. Aliquam semper ipsum
    sit amet velit.

2.  Suspendisse id sem consectetuer libero luctus adipiscing.
```

1.  This is a list item with two paragraphs. Lorem ipsum dolor
    sit amet, consectetuer adipiscing elit. Aliquam hendrerit
    mi posuere lectus.

    Vestibulum enim wisi, viverra nec, fringilla in, laoreet
    vitae, risus. Donec sit amet nisl. Aliquam semper ipsum
    sit amet velit.

2.  Suspendisse id sem consectetuer libero luctus adipiscing.

如果要在列表项目内放进引用，那>就需要缩进

```
*   A list item with a blockquote:

    > This is a blockquote
    > inside a list item.
```

*   A list item with a blockquote:

    > This is a blockquote
    > inside a list item.

如果要放代码区块的话，该区块就需要缩进两次，也就是 8 个空格或是 2 个制表符

```
*   一列表项包含一个列表区块：

        <代码写在这>
```

*   一列表项包含一个列表区块：

        <代码写在这>

避免不小心产生项目列表

```
1986\. What a great season.
```

1986\. What a great season.

---

## 表格

```
表头|表头|表头
---|:--:|---:
内容|内容|内容
内容|内容|内容
```

表头|表头|表头
---|:--:|---:
内容|内容|内容
内容|内容|内容

```
|表头|表头|表头|
|---|:--:|---:|
|内容|内容|内容|
|内容|内容|内容|
```

---

## 链接

```
This is [an example](http://example.com/ "Title") inline link.

[This link](http://example.net/) has no title attribute.

See my [markdown](/#!markdown.md) page for details.
```

This is [an example](http://example.com/ "Title") inline link.

[This link](http://example.net/) has no title attribute.

See my [markdown](/#!markdown.md) page for details.

```
This is [an example][id] reference-style link.
```
```
[id]: http://example.com/  "Optional Title Here"
```

This is [an example][id] reference-style link.

[id]: http://example.com/  "Optional Title Here"

```
[id]: http://example.com/  "Optional Title Here"
[id]: http://example.com/  'Optional Title Here'
[id]: http://example.com/  (Optional Title Here)
```
```
[id]: <http://example.com/>  "Optional Title Here"
```
```
[Google][]
```
```
[Google]: http://google.com/
```

[Google][]

[Google]: http://google.com/

---

## 图片

```
![Alt text](/path/to/img.jpg)

![Alt text](/path/to/img.jpg "Optional title")
```
```
![Alt text][id]
```
```
[id]: url/to/image  "Optional title attribute"
```

---

## 自动链接

```
<http://example.com/>
```
```
<address@example.com>
```

---

## 反斜杠

Markdown 可以利用反斜杠来插入一些在语法中有其它意义的符号

```
\*literal asterisks\*
```

\*literal asterisks\*

Markdown 支持以下这些符号前面加上反斜杠来帮助插入普通的符号：
```
\   反斜线
`   反引号
*   星号
_   底线
{}  花括号
[]  方括号
()  括弧
#   井字号
+   加号
-   减号
.   英文句点
!   惊叹号
```

---

## 参考

本文主要参考[小众网](https://www.appinn.com)的[Markdown 语法说明 (简体中文版)](https://www.appinn.com/markdown/)，表示感谢
