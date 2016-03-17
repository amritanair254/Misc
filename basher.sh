#!/bin/bash
read X			#cin a number
Y=4
empty_string=""


echo `expr $X + $Y`   
echo `expr $X - $Y`   
echo `expr $X \* $Y`   
echo `expr $X / $Y`  


echo "Welcome to $PWD, $USER"			#takes values from environment
echo -n '.The files in here are'		#print without breakline
LS="ls"
LS_FLAGS="-al"
$LS $LS_FLAGS $HOME


if [ $X -lt $Y ]	# is $X less than $Y ? 
then
	echo "\$X=${X}, which is smaller than \$Y=${Y}"
elif [ $X -gt $Y ]
then 
	echo "\$X=${X}, which is greater than \$Y=${Y}"
else
	echo "\$X=${X}, which is equal to \$Y=${Y}"
fi


if [ -n "$empty_string" ]; then			#this wont print because of the quotes around variable. -n checks if arguement is non empty
	echo "empty string is non_empty"
fi


if [ -e "${HOME}/.fvwmrc" ]; then 			# -e test to see if ~/.fvwmrc exists
	echo "you have a .fvwmrc file"
	if [ -L "${HOME}/.fvwmrc" ]; then 		# is it a symlink ?  
		echo "it's a symbolic link"
	elif [ -f "${HOME}/.fvwmrc" ]; then 	# is it a regular file 
		echo "it's a regular file"
	fi
else
	echo "you have no .fvwmrc file"
fi


: <<MYCOMMENT
operator	produces true if... 	number of operands
-n		operand non zero length	1
-z		operand has zero length	1
-d		there exists a directory whose name is operand	1
-f		there exists a file whose name is operand	1
-eq		the operands are integers and they are equal	2
-neq	the opposite of -eq	2
=		the operands are equal (as strings)	2
!=		opposite of = 	2
-lt		operand1 is strictly less than operand2 (both operands should be integers)	2
-gt		operand1 is strictly greater than operand2 (both operands should be integers)	2
-ge		operand1 is greater than or equal to operand2 (both operands should be integers)	2
-le		operand1 is less than or equal to operand2 (both operands should be integers)	2
MYCOMMENT 


for X in red green blue
do
	echo $X
done


colour1="red"
colour2="light blue"		#items with embedded spaces
colour3="dark green"
for X in "$colour1" "$colour2" "$colour3"
do
	echo $X
done


for X in ${HOME}/public_html/*.html
do
		grep -L '<UL>' "$X"
done



X=0
while [ $X -le 20 ]
do
	echo $X
	X=$((X+1))
done


i=1
for day in Mon Tue Wed Thu Fri Sat Sun
do
 echo -n "Day $((i++)) : $day"
 if [ $i -eq 7 -o $i -eq 8 ]; then
   echo " (WEEKEND)"
   continue;
 fi
 echo " (weekday)"
done


i=1
weekdays="Mon Tue Wed Thu Fri"
for day in $weekdays
do
 echo "Weekday $((i++)) : $day"
  if [ $i -eq 4 ]; then
   break;
 fi
done


for (( i=1; i <= 5; i++ ))
do
 echo "Random number $i: $RANDOM"
done


for num in {1..10}
do
 echo "Number: $num"
done


for num in {1..10..2}
do
 echo "Number: $num"			#prints 1,3,5,7,9
done


i=1;
for (( ; ; ))
do
   sleep $i
   echo "Number: $((i++))"		#infinite loop
done



files="$(ls)"
web_files=`ls public_html`
echo "$files"      # we need the quotes to preserve embedded newlines in $files
echo "$web_files"  # we need the quotes to preserve newlines 
X=`expr 3 \* 2 + 4` # expr evaluate arithmatic expressions. man expr for details.
echo "$X"
