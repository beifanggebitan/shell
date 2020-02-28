#!/bin/bash

# using the return command in a function

function db1 {
	read -p "Enter a value:" value
	echo "doubling the value"
	return $[ $value * 2 ]
}

db1
echo "The new value is $?" #此处返回值就是结果，所以就是$?
