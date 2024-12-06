#! /bin/bash 

#-----------------ODC-EMBEDDED LINUX INTERN MINI PROJECT WEEK 1 -----------------# 


# @author : abdullah waheed 
# @date   : 5 - 12 - 2024 
# @brief  : Bank Data mangement system by bash script




flag=y


while [ $flag == y ];
do 
d_pass=$(cat password | tail -1 )
echo -ne " Welcome to Data base  !  \n \n Enter 1 for admin mode 2 for user mode : " 
read mode 
echo -e "\n"
if [ $mode -eq 1 ];
then 

pass=nok
counter=0
while [ $pass != $d_pass -a $counter -lt 3 ];
do 
echo -ne " Enter password for admin mode : "
read pass
if [ $pass != $d_pass ];
then 
((counter++))
echo -ne " pass is wrong ! \n you consumed $counter out of 3 tries "
else 
echo -ne " \n Password is correct :) \n  \n  ---- Welcome admin ----  \n \n "
fi 
done 
if [ $counter -eq 3 ];
then
echo -ne " SYSTEM OUT OF SERVICE ! \n GOOD BYE ! "
exit 
fi

echo -ne " ------ Options ------ \n \n 1 - adding new account \n 2 - removing exist account  \n 3 - modify Exist account \n 4 - changing password for admin mode   \n \n Enter option number : "
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

elif [ $operation -eq 3 ];
then

echo -ne "\n Enter id  : "
read id 
echo -ne " Which filed you wanna moifiy ? \n \n 1 - Name \n 2 - balance \n 3 - address \n 4 - phone \n \n Enter option number : "
read option 
echo -ne " Enter New value : "
read replace 
((option++))
string=$(cat  ./Data | head -$id | tail -1 )
field=$(cat  ./Data | head -$id | tail -1 | cut -d ":" -f $option) 
new_text=$(echo "${string/${field}/${replace}}")
sed -i "${id}s/.*/${new_text}/" ./Data

echo -ne "\n your data after modifing is \n"

name=$(cat ./Data | head -n $id | tail -n 1 | cut -d ":" -f 2 )
balance=$(cat ./Data | head -n $id | tail -n 1 | cut -d ":" -f 3 )
address=$(cat ./Data | head -n $id | tail -n 1 | cut -d ":" -f 4 )
phone=$(cat ./Data | head -n $id | tail -n 1 | cut -d ":" -f 5 )

echo -ne "\n your name is :"$name"\n"
echo -ne "\n your balance is :"$balance EGP"\n"
echo -ne "\n your address is :"$address"\n"
echo -ne "\n your phone is :"+2$phone"\n \n"

elif [ $operation -eq 4 ];
then 

echo -ne " Enter new Password : "
read pass
echo $pass > password 
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