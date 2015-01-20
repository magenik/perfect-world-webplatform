extract it into your Game Root folder 

example :
/SWServer/authd

edit your ./start.sh with proper path like below



SW_PATH=/SWServer
echo -e '\E[37;44m'"\033[1m*=== AUTHD ===*\033[0m"
cd $SW_PATH/authd; ./authd >$SW_PATH/logs/auth.log &
sleep 5


enjoy