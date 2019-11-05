#!/bin/bash
hostname=`/bin/hostname`  #指定hostname路径
week=`date +%w`           #指定week即为是这周的第几天（0,1,2,3,4,5,6）
datadir=/backup           #指定datadir路径
logdir=/backup/log        #指定log日志
mycnf=/etc/my.cnf         #指定MySQL配置文件路径
Time=`date +%Y-%m-%d_%H-%M-%S`   #指定这个Time的时间显示格式
cmd=`which innobackupex`  #cmd就是指innobackupex这个MySQL全备份执行绝对路径
user=root                 #用户名
passwd=mysqladmin         #这个用户名对应的密码


function getdir()         #指定函数名，也可以fun()直接进行，但是还是这样写正规一些
{
	if [ ! -d ${datadir} ];then   #如果datadir不是个路径的话，执行下面的创建命令
		mkdir -p ${datadir}   #考虑到是以root身份执行这个脚本，那就不用管权限了，我root天下无敌
	fi
}
function backup()         #创建另一个函数，用于执行备份
{
	if [ ${week} == "0" ];then   #如果今天是本周第一天（即英国人习惯的周日是美洲第一天）
		$cmd --defaults-file=${mycnf} --user=${user} --password=${passwd} ${datadir}&>${logdir}/${Time}-log
		[ $? -eq 0 ] && stat=`tail -1 ${logdir}/${Time}-log |awk '{print $4}'`
		if [ "${stat}" == "OK!" ];then
			echo "${Time} mysql backup is success!"
		else
			echo "${Time} mysql backup is fail! please check ${logdir}/${Time}-log"
		fi
	else
		$cmd --defaults-file=${mycnf} --user=${user} --password=${passwd} --incremental --incremental-basedir=${datadir}&>${logdir}/${Time}-log
					
}

shell讲解：
这个脚本对新手太不友好了，所以为了阅读方便，我要把这个加上所有的注释

