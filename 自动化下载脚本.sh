#!/bin/bash
#download latest cURL file automatically

curl -s -o /home/tiandi/curl
http://curl.haxx.se/download/curl

shell讲解：
前人栽树，后人乘凉，他们的命令行其实很精简的，我要做的就是在这里留下分析
在Linux中curl是一个利用URL规则在命令行下工作的文件传输工具，可以说是一款很强大的http命令行工具。
它支持文件的上传和下载，是综合传输工具，但按传统，习惯称curl为下载工具
语法：# curl [option] [url]
常见参数：
-A/--user-agent <string>              设置用户代理发送给服务器
-b/--cookie <name=string/file>        cookie字符串或文件读取位置
-c/--cookie-jar <file>                操作结束后把cookie写入到这个文件中
-C/--continue-at <offset>             断点续转
-D/--dump-header <file>               把header信息写入到该文件中
-e/--referer                          来源网址
-f/--fail                             连接失败时不显示http错误
-o/--output                           把输出写到该文件中
-O/--remote-name                      把输出写到该文件中，保留远程文件的文件名
-r/--range <range>                    检索来自HTTP/1.1或FTP服务器字节范围
-s/--silent                           静音模式。不输出任何东西
-T/--upload-file <file>               上传文件
-u/--user <user[:password]>           设置服务器的用户和密码
-w/--write-out [format]               什么输出完成后
-x/--proxy <host[:port]>              在给定的端口上使用HTTP代理
-#/--progress-bar                     进度条显示当前的传送状态

比如如果我们简单的使用如下命令
# curl http://www.baidu.com
执行后，这个百度首页的html就会显示在屏幕上了
这个功能经常用来测试能否达到一个网站


shell中的这个命令的意思，使用curl命令静默访问http://curl.haxx.se/download/curl并将输出的信息保存在/home/tiandi/curl这个文件中
