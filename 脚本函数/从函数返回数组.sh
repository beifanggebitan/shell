#!/bin/bash

# returning an array value

function arraydblr {
	local origarry  #local可以在函数内定义局部变量，显示局部变量，也可以在函数内定义全局变量
	local newarray
	local elements
	local i
	origarry=(`echo "$@"`) #$@所有参数列表。如"$@"用「"」括起来的情况、以"$1" "$2" … "$n" 的形式输出所有参数
	newarray=(`echo "$@"`)
	elements=$[ $# - 1 ] #$#表示添加到Shell的参数个数
	for (( i=0; i<=$elements; i++ ))
	{
		newarray[$i]=$[ ${origarry[$i]} * 2 ]
	}

	echo ${newarray[*]}
}

myarray=(1 2 3 4 5)
echo "The original array is : ${myarray[*]}"
arg1=`echo ${myarray[*]}`
result=(`arraydblr $arg1`)
echo "The new array is : ${result[*]}"
