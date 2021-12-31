#!/bin/bash -e

#获得当前文件的路径，为了解决在其他目录执行编译脚本
CurPath=$(cd $(dirname $0); pwd)

#Debug 还是 Release 版本
VertionType=
if [ "$1" == "Debug" ];then
    VertionType="Debug"
else 
    VertionType="Release"
fi

ProjectPath=$CurPath/../
#安装目录参数
InstallPrefixPath=
if [ "$2" ];then
    #为了处理相对目录的情况
    cd $2
    InstallPrefixPath=$(pwd)
else
    InstallPrefixPath="$ProjectPath/out"
fi

echo -e "|*************************************************| \n"

echo -e "      Build Version is : [$VertionType] \n"

echo -e "|*************************************************| \n"

echo " Install Path is :[$InstallPrefixPath]"

cd $ProjectPath
BuildDir=build/$VertionType
if [ -d $BuildDir ];then
    rm -r $BuildDir
fi
mkdir -p $BuildDir  

cd $BuildDir  

cmake -DCMAKE_BUILD_TYPE=$VertionType -DCMAKE_INSTALL_PREFIX=$InstallPrefixPath ../../ 
make -j
make install

#demo:./build.sh Release ./out Child