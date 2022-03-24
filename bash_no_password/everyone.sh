#!/bin/bash

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


declare -a UserArray=("marcussu")


#"wilsonchien"

for aUser in "${UserArray[@]}"
do
   echo "$aUser"
   sudo -u $aUser -H sh -c "/mnt/hpcfs/alarm_tool_box2/bash_no_password/no_password.sh" 
   
done

