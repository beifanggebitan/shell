#!/bin/bash
#退出状态码，最大为255，超过则进行模运算
#testing the exit status
var1=10
var2=20
var3=$[ $var1 + $var2]
echo The answer is $var3
exit 5

shell讲解：
  这个最后一行的exit命令是退出这个子shell，要不然理论上是要停留在这个 shell中，这就很尴尬，使用exit不会影响上一行的答案输出
