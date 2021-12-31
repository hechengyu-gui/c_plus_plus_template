
CurPath=$(cd $(dirname $0); pwd)
if [ "$1" ];then
    IP_addr=$1
    #echo "IP:{$1}"
else
    IP_addr="192.168.1.15"
    #echo "Use Default IP: $IP_addr"
fi
ProjectPath=$CurPath/../../
cd $ProjectPath
FullProjectPath=$(pwd)
echo "\n-------------------------------File Sync ------------------------------------"
echo "PC:        [$FullProjectPath]"
echo ""
echo "EdgeBoard: [root@$IP_addr/root/workspace]"
echo "------------------------------------------------------------------------\n\n"

rsync -avz  $FullProjectPath  rsync://root@$IP_addr/share  --exclude-from  $CurPath/rsync.cfg


