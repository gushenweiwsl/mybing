#while true
#do
#  sleep 7200 
#    rm -rf /home/runner/bingbotq/logs
#    rm -rf /home/runner/bingbotq/data
#    reboot
#done &
#如果需要定时重启和定时清理功能，请把以上的部分取消注释。请保证对项目实施了成功保活再取消注释以上部分。
python app.py &
./go-cqhttp --faststart