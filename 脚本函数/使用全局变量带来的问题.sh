#!/bin/bash

# demonstrating a bad use of variables

function func1 {
	temp=$[ $value + 5 ]
	result=$[ $temp * 2 ]
}

temlp=4
value=6

func1
echo "The result is $result"

if [ $temp -gt $value ]
then
	echo "Temp is larger"
else
	echo "temp is smaller"
fi
#1、函数内是可以访问全局变量，并且对全局变量的修改会真正改变全局变量的值。

#2、函数内定义的变量也是全局变量，也就是说函数外可以访问，local可以定义为局部变量。
