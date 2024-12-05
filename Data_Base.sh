#! /bin/bash 


# @author : abdullah waheed 
# @date   : 5 - 12 - 2024 
# @brief  : Bank Data base


flag=y

while [ $flag == y ];
do 

echo -ne " Welcome to Data base  !  \n Enter 1 for admin mode 2 for user mode : " 
read mode 

if [ $mode -eq 1 ];
then 
echo -ne " presss 1 for adding new account , 2  for removing exist account : "
read operation 

if [ $operation -eq 1 ];
then 
echo -ne " Enter User Name : "
read name 
echo -ne " Enter User balance : "
read balance
echo -ne " Enter User address : "
read address 
echo -ne " Enter User phone : "
read phone 
id=$( wc -l Data | cut -d  " " -f 1 ) 
((id++))
echo -ne "[$id]:$name:$balance:$address:$phone \n" >> Data
echo -ne " Done ! \n your id is [$id] \n" 

elif [ $operation -eq 2 ];
then 
echo -ne " Enter your id : "
read id 
sed -i "${id}s/.*/ /" ./Data
fi
elif [ $mode -eq 2 ];
then 
echo -ne  " Enter id to show account data : "
read id

name=$(cat ./Data | head -n $id | tail -n 1 | cut -d ":" -f 2 )
balance=$(cat ./Data | head -n $id | tail -n 1 | cut -d ":" -f 3 )
address=$(cat ./Data | head -n $id | tail -n 1 | cut -d ":" -f 4 )
phone=$(cat ./Data | head -n $id | tail -n 1 | cut -d ":" -f 5 )

echo -ne "you name is :"$name"\n"
echo -ne "you balance is :"$balance EGP"\n"
echo -ne "you address is :"$address"\n"
echo -ne "you phone is :"+2$phone"\n"
fi

echo -ne " Do you want to do another operation ? y/n " 
read flag
done 

echo -ne "Bye :) \n "