#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin:/opt/homebrew/bin
export PATH

curPath=`pwd`
rootPath=$(dirname "$curPath")
rootPath=$(dirname "$rootPath")
serverPath=$(dirname "$rootPath")
sysName=`uname`
sysArch=`arch`

install_tmp=${rootPath}/tmp/mw_install.pl

# cd /www/server/mdserver-web && source bin/activate && python3 plugins/sphinx/index.py rebuild

# cd /www/server/mdserver-web && source bin/activate && python3 plugins/sphinx/index.py db_to_sphinx
# /www/server/sphinx/bin/bin/indexer -c /www/server/sphinx/sphinx.conf 99cms_mc_comic --rotate
# /Users/midoks/Desktop/mwdev/server/sphinx/bin/bin/indexer /Users/midoks/Desktop/mwdev/server/sphinx/sphinx.conf 99cms_mc_comic --rotate

bash ${rootPath}/scripts/getos.sh
echo "bash ${rootPath}/scripts/getos.sh"

OSNAME="macos"
if [ -f ${rootPath}/data/osname.pl ];then
	OSNAME=`cat ${rootPath}/data/osname.pl`	
fi

if [ "${OSNAME}" == "centos" ] || 
	[ "${OSNAME}" == "fedora" ] ||
	[ "${OSNAME}" == "alma" ]; then
	yum install -y postgresql-libs unixODBC
fi

# http://sphinxsearch.com/files/sphinx-3.7.1-da9f8a4-linux-amd64.tar.gz

VERSION=$2

# echo $VERSION

if [ "$VERSION" == "3.1.1" ];then
	VERSION_NUM=${VERSION}-612d99f
elif [ "$VERSION" == "3.2.1" ]; then
	VERSION_NUM=${VERSION}-f152e0b
elif [ "$VERSION" == "3.3.1" ]; then
	VERSION_NUM=${VERSION}-b72d67b
elif [ "$VERSION" == "3.4.1" ]; then
	VERSION_NUM=${VERSION}-efbcc65
elif [ "$VERSION" == "3.5.1" ]; then
	VERSION_NUM=${VERSION}-82c60cb
elif [ "$VERSION" == "3.6.1" ]; then
	VERSION_NUM=${VERSION}-c9dbeda
elif [ "$VERSION" == "3.7.1" ]; then
	VERSION_NUM=${VERSION}-da9f8a4
fi

# echo $VERSION_NUM

Install_sphinx()
{
	echo '正在安装Sphinx...'
	mkdir -p $serverPath/sphinx

	SPHINX_DIR=${serverPath}/source/sphinx
	mkdir -p $SPHINX_DIR

	SPH_NAME=amd64
	if [ "$sysArch" == "arm64" ];then
		SPH_NAME=amd64
	elif [ "$sysArch" == "x86_64" ]; then
		SPH_NAME=amd64
	elif [ "$sysArch" == "aarch64" ]; then
		SPH_NAME=aarch64
	fi

	if [ "$sysName" == "Darwin" ] && [ "$VERSION" == "3.7.1" ];then
		SPH_NAME=aarch64
	fi

	SPH_SYSNAME=linux
	if [ $sysName == 'Darwin' ]; then
		SPH_SYSNAME=darwin
	elif [ "$sysName" == "aarch64" ]; then
		SPH_NAME=aarch64
	elif [ "$sysName" == "freebsd" ]; then
		SPH_NAME=freebsd
	fi

	FILE_NAME=sphinx-${VERSION_NUM}-${SPH_SYSNAME}-${SPH_NAME}
	FILE_TGZ=${FILE_NAME}.tar.gz
		
	echo "${SPHINX_DIR}/${FILE_TGZ}"
	if [ ! -f ${SPHINX_DIR}/${FILE_TGZ} ];then
		if [ $sysName == 'Darwin' ]; then
			wget -O ${SPHINX_DIR}/sphinx-${VERSION}.tar.gz http://sphinxsearch.com/files/${FILE_TGZ}
		else
			curl -sSLo ${SPHINX_DIR}/sphinx-${VERSION}.tar.gz http://sphinxsearch.com/files/${FILE_TGZ}
		fi
	fi

	# if [ ! -f ${SPHINX_DIR}/sphinx-${VERSION}.tar.gz ];then
	# 	curl -sSLo ${SPHINX_DIR}/sphinx-${VERSION}.tar.gz https://github.com/midoks/mdserver-web/releases/download/init/sphinx-${VERSION}.tar.gz
	# fi

	cd ${SPHINX_DIR} && tar -zxvf ${FILE_TGZ}
	
	if [ "$?" == "0" ];then
		mkdir -p $SPHINX_DIR
		cp -rf ${SPHINX_DIR}/sphinx-${VERSION}/ $serverPath/sphinx/bin
	fi
	
	if [ -d $serverPath/sphinx ];then
		echo "${VERSION}" > $serverPath/sphinx/version.pl
		echo '安装Sphinx完成'
		cd ${rootPath} && python3 ${rootPath}/plugins/sphinx/index.py start
		cd ${rootPath} && python3 ${rootPath}/plugins/sphinx/index.py initd_install
	fi

	if [ -d ${SPHINX_DIR}/sphinx-${VERSION} ];then
		rm -rf ${SPHINX_DIR}/sphinx-${VERSION}
	fi
}

Uninstall_sphinx()
{
	if [ -f /usr/lib/systemd/system/sphinx.service ] || [ -f /lib/systemd/system/sphinx.service ];then
		systemctl stop sphinx
		systemctl disable sphinx

		if [ -f /usr/lib/systemd/system/sphinx.service ];then
			rm -rf /usr/lib/systemd/system/sphinx.service
		fi

		if [ -f /lib/systemd/system/sphinx.service ];then
			rm -rf /lib/systemd/system/sphinx.service
		fi
		systemctl daemon-reload
	fi

	if [ -f $serverPath/sphinx/initd/sphinx ];then
		$serverPath/sphinx/initd/sphinx stop
	fi

	if [ -f $serverPath/sphinx ];then
		rm -rf $serverPath/sphinx
	fi

	echo "卸载sphinx成功"
}

action=$1
if [ "${1}" == 'install' ];then
	Install_sphinx
else
	Uninstall_sphinx
fi
