#!/bin/bash

#storing STDOUT, then coming back to it

exec 3>&1
exec 1>test

echo "This should store in output file"
echo "along with this line"

exec 1>&3

echo "Now things should be back to normal"


exec命令                  作用
 
exec ls          在shell中执行ls，ls结束后不返回原来的shell中了
 
exec <file       将file中的内容作为exec的标准输入
 
exec >file       将file中的内容作为标准写出
 
exec 3<file      将file读入到fd3中
 
sort <&3         fd3中读入的内容被分类
 
exec 4>file      将写入fd4中的内容写入file中
 
ls >&4           Ls将不会有显示，直接写入fd4中了，即上面的file中
 
exec 5<&4         创建fd4的拷贝fd5
 
exec 3<&-         关闭fd3
