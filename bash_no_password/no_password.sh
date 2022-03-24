
#!/bin/bash
echo "Create key paire in curry user .ssh folder"
ssh-keygen -q -t rsa -N '' -f ~/.ssh/id_rsa <<<y >/dev/null 2>&1
cat $HOME/.ssh/id_rsa.pub >> $HOME/.ssh/authorized_keys

#pass="moldex3d123!@#"
pass="moldex3d123!@#"


for aNode in node21 node22 node23 node24 node25 node26 node27 node28 node29 node30 node31 node32 node33 node34 node35 node36 node37 node38 node39
#for aNode in node33
do
	echo "Starting crete remote $HOME/.ssh folder"
	sshpass -p $pass ssh $USER@$aNode "ls $HOME"
	sshpass -p $pass ssh $USER@$aNode "mkdir -p $HOME/.ssh"
	echo "sshpass -p $pass ssh $USER@$aNode \"mkdir -p $HOME/.ssh\""
	
	echo "Copying Key paire to .ssh folder"
	sshpass -p $pass scp $HOME/.ssh/* $USER@$aNode:$HOME/.ssh/;
	echo "sshpass -p $pass scp $HOME/.ssh/* $USER@$aNode:$HOME/.ssh/"
	echo "copy $aNode:$HOME/.ssh/....done"
done


