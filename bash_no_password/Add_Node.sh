
#!/bin/bash

#pass="moldex3d123!@#"


declare -a UserArray_Every_one=("alanliao" "amychu" "andytsai" "aureole" 
"benlai" "brucelee" "bryantono" "cindyteng"
"donaldchang" "erikhuang" "ethanchiu" "goranliu"
"howardkuo" "ianpeng" "jasmineho" "jaycechang"
"jenniferchen" "jessiechen" "joewang" "johnlin"
"jungchen" "jyewang" "kenwang" "leowu" "marslai"
"marvinwang" "maxchang" "mikyhsu" "millielin" "mingchen"
"neokao" "nervlee" "oscarwang" "peter" "philipchang" "qstat_log"
"ricwen" "samhsieh" "samlee" "sandychang"
"susanlin" "tedlee" "timcheng" "wilsoncheng" "marcussu"
"zoechen" )

declare -a UserArray_Every_one1=("alanliao" )

aNode="node33"
pass='moldex3d123!@#'

for aUser in "${UserArray_Every_one[@]}"
do
	echo "$aUser"
	#sudo -u $aUser -H sh -c "/mnt/hpcfs/alarm_tool_box2/bash_no_password/no_password.sh" 
	sshpass -p $pass ssh $aUser@$aNode "ls /home/$aUser"
	sshpass -p $pass ssh $aUser@$aNode "mkdir -p /home/$aUser/.ssh"
	echo "sshpass -p $pass ssh $aUser@$aNode \"mkdir -p /home/$aUser/.ssh\""

	echo "Copying Key paire to .ssh folder"
	sshpass -p $pass scp /home/$aUser/.ssh/* $aUser@$aNode:/home/$aUser/.ssh/;
	echo "sshpass -p $pass scp /home/$aUser/.ssh/* $aUser@$aNode:/home/$aUser/.ssh/"
	echo "copy $aNode:/home/$aUser/.ssh/....done"

done




