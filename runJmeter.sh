now=`TZ=Asia/Calcutta date '+%d-%m-%Y'`
if [[ $now == $today ]]; then 
   echo 'export Counter="$(( $Counter+1 ))"' >> ~/.bashrc
   source ~/.bashrc
else
   echo "export today='${now}'" >> ~/.bashrc
   echo "export Counter='1'" >> ~/.bashrc
   source ~/.bashrc
fi
script=${1}
threads=${2}
rampup=${3}
testDuration=${4}
sh jmeter.sh -n -t /home/bplus/Jmeter/JmeterScripts/${script}.jmx -l /home/bplus/Jmeter/Results/CSVREPORTS/${script}_${now}_TG${threads}_RU${rampup}_Run$Counter.csv -e -o/home/bplus/Jmeter/Results/HTMLREPORTS/${script}_${now}_TG${threads}_RU${rampup}_Run$Counter -DTHREADS=${threads} -DRAMP_UP=${rampup} -DDURATION=${testDuration}
#aws s3 sync /home/bplus/Jmeter/Results/HTMLREPORTS/${script}_${now}_TG${threads}_RU${rampup}_Run$Counter s3://cft-automation-reports-east-1/${script}_${now}_TG${threads}_RU${rampup}_Run$Counter --delete
