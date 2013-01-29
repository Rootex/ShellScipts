#!/bin/sh
# Developed by Sotaya
# Hotel Booking System
# Implements a Hotel booking system, this is not for commercial use
# source code can be used for integration, modification and contribution
#
# However every modification made to file should be sent to developer.
# In case of educational reasons , code can be used without restrictions.
# You are allowed to copy, modify and redistribute freely
# And when distributing, the same rights should be passed on to with the source code.

############################################################################################

path=$(pwd)
if [ -e $path/Hotel ]
then
    cd $path/Hotel
else
    mkdir Hotel
    cd Hotel
    echo "Enter room numbers of each single rooms with a 0 status seperate inputs with a (:) then press CTR-d
          e.g room1:0 
              room2:0 max of 3 rooms"
    cat > singlerooms
    echo "\n Enter room numbers of each double rooms with a 0 status seperate inputs with a (:) then press CTR-d
          e.g room1:0 
              room2:0 max of 3 rooms"
    cat > doublerooms
    echo "\n Enter room numbers of each double rooms with a 0 status seperate inputs with a (:) then press CTR-d 
          e.g room1:0 
              room2:0 max of 3 rooms"
    cat > apartments
    echo "\n"
fi

clear

while true
do

#Main menu

echo 'Welcome to Hotel Sotaya!
     What service can we help you with?

      1. Book a Room
      2. Leave a Room
      3. List the current free rooms
      4. List the free rooms for a given period 
 
      Type in the number the correspond to the service you need then press ENTER '

read service

clear

#if 1
#Booking Menu

if [ $service -eq 1 ]
then
 echo ' To book a room select the type of room or apartment you need!
        We have :
   
       1. Single rooms
       2. Double rooms
       3. Apartments

     Type in the number that correspond to the type of room you need then press ENTER '
 read roomtype

clear

#single room menu


   #sub 1 if 1
   if [ $roomtype -eq 1 ]
   then
     
    sroom=$(cat singlerooms | grep :0 | wc -l)
    if [ $sroom -eq 0 ]
    then
       echo "Sorry there are no vacant rooms in this section "
    else    
    echo " There are $sroom single rooms: \n"
    cat singlerooms | grep :0 | cut -d: -f1
      echo "      
       To book type in the room you want to book press enter then day of check in format dd.mm if chekin is not immediate
        Go back to main menu type in (0) 
       (quit)  to exit "

    read book
    read checkin 
     
clear

       
       #sub 1 sub 1 if 1    
       if [ $book -eq 1 ]
       then
         
         sed 's/room1:0/room1:1:'"$checkin"'/g' singlerooms > temp
         mv temp singlerooms
         echo 'You have been reserved room 1'
       elif [ $book -eq 2 ]
       then
         sed 's/room2:0/room2:1:'"$checkin"'/g' singlerooms > temp
         mv temp singlerooms
         echo 'You have been reserved room 2'
       elif [ $book -eq 3 ]
       then
         sed 's/room3:0/room3:1:'"$checkin"'/g' singlerooms > temp
         mv temp singlerooms
         echo 'You have been reserved room 3'  
       elif [ "$book" = quit ]
       then
         echo 'Thank you, Good Bye! ' 
         exit 1 
       fi #end of sub 1 of sub 1 of if 1
     fi #if to check if there is vacant room
#Double room Menu
   
   elif [ $roomtype -eq 2 ]
   then
    sroom=$(cat doublerooms | grep :0 | wc -l)
   
    if [ $sroom -eq 0 ]
    then
      echo "Sorry there are no vacant rooms here"
    else  
     echo " There are $sroom Double Rooms: "
     cat doublerooms | grep :0 | cut -d: -f1
     echo "            To leave type in the room you want to leave
        Go back to main menu type in (0) 
       (quit)  to exit "

    read book 
    read checkin
clear       
       #sub 1 sub 1 if 1    
       if [ $book -eq 1 ]
       then
         sed 's/room1:0/room1:1:'"$checkin"'/g' doublerooms > temp
         mv temp doublerooms
         echo 'You have been reserved room 1'
       elif [ $book -eq 2 ]
       then
         sed 's/room2:0/room2:1:'"$checkin"'/g' doublerooms > temp
         mv temp doublerooms
         echo 'You have been reserved room 2'
       elif [ $book -eq 3 ]
       then
         sed 's/room3:0/room3:1:'"$checkin"'/g' doublerooms > temp
         mv temp doublerooms
         echo 'You have been reserved room 3'  
       elif [ "$book" = quit ]
       then
         echo 'Thank you, Good Bye! ' 
         exit 1  
       fi #end of sub 1 of sub 1 of if 1
     fi #if to check vancancy
#Apartment Menu

   elif [ $roomtype -eq 3 ]
   then
   sroom=$(cat apartments | grep :0 | wc -l)

    if [ $sroom -eq 0 ]
    then
       echo "sorry there are no vacant rooms in this section "
    else   
     echo " There are $sroom Apartments: "
     cat apartments | grep :0 | cut -d: -f1
    echo "           To leave type in the room you want to leave
        Go back to main menu type in (0) 
       (quit)  to exit "

    read book 
    read checkin

clear       

       #sub 1 sub 1 if 1    
       if [ $book -eq 1 ]
       then
         sed 's/room1:0/room1:1:'"$checkin"'/g' apartments > temp
         mv temp apartments
         echo 'You have been reserved room 1'
       elif [ $book -eq 2 ]
       then
         sed 's/room2:0/room2:1:'"$checkin"'/g' apartments > temp
         mv temp apartments
         echo 'You have been reserved room 2' 
       elif [ $book -eq 3 ]
       then
         sed 's/room3:0/room3:1:'"$checkin"'/g' apartments > temp
         mv temp apartments
         echo 'You have been reserved room 3'  
       elif [ "$book" = quit ]
       then
         echo 'Thank you, Good Bye! ' 
         exit 1 
       fi #end of sub 1 of sub 1 of if 1
     fi
   fi
   
#END OF FIRST SERVICE
   
 elif [ $service -eq 2 ]
 then
  echo "Which room do you want to check out from:
       1. Single room
       2. Double room
       3. Apartment 
       (quit) to exit "
  
  read roomtype
  
    if [ $roomtype -eq 1 ]
   then
   
    sroom=$(cat singlerooms | grep :1 | wc -l)
    
    if [ $sroom -eq 0 ]
    then
      echo "You have not booked into any room "
    else  
    echo " There are $sroom single rooms booked: \n"
    cat singlerooms | grep :1 | cut -d: -f1
      echo "      
       To leave type in the room you want to leave
        Go back to main menu type in (0) 
       (quit)  to exit "

    read checkout 

clear

       
       #sub 1 sub 1 if 1    
       if [ $checkout -eq 1 ]
       then
         sed 's/room1:1/room1:0/g' singlerooms > temp
         mv temp singlerooms
         
         echo 'You have been removed from room 1'
       elif [ $checkout -eq 2 ]
       then
         sed 's/room2:1/room2:0/g' singlerooms > temp
         mv temp singlerooms
         echo 'You have been removed from room 2'
       elif [ $checkout -eq 3 ]
       then
         sed 's/room3:1/room3:0/g' singlerooms > temp
         mv temp singlerooms
         echo 'You have been removed from room 3'  
       elif [ "$chekout" = quit ]
       then
         echo 'Thank you, Goodbye! ' 
         exit 1 
       fi #end of sub 1 of sub 1 of if 1
     fi #if checking availability of booked rooms

#Double room Menu
   
   elif [ $roomtype -eq 2 ]
   then
   
    sroom=$(cat doublerooms | grep :1 | wc -l)
    
    if [ $sroom -eq 0 ]
    then
       echo "You have not booked into any room yet "
    else   
    echo " There are $sroom double rooms booked: \n"
    cat doublerooms | grep :1 | cut -d: -f1
      echo "      
       To leave type in the room you want to leave
        Go back to main menu type in (0) 
       (quit)  to exit "

    read checkout 

clear

       
       #sub 1 sub 1 if 1    
       if [ $checkout -eq 1 ]
       then
         sed 's/room1:1/room1:0/g' doublerooms > temp
         mv temp doublerooms
         
         echo 'You have been removed from room 1'
       elif [ $checkout -eq 2 ]
       then
         sed 's/room2:1/room2:0/g' doublerooms > temp
         mv temp doublerooms
         echo 'You have been removed from room 2'
       elif [ $checkout -eq 3 ]
       then
         sed 's/room3:1/room3:0/g' doublerooms > temp
         mv temp doublerooms 
         echo 'You have been removed from room 3' 
       elif [ "$checkout" = quit ]
       then
         echo 'Thank you, Goodbye! ' 
         exit 1
       fi #end of sub 1 of sub 1 of if 1
      fi
#Apartment Menu

   elif [ $roomtype -eq 3 ]
   then
   
    sroom=$(cat apartments | grep :1 | wc -l)
    
    if [ $sroom -eq 0 ]
    then
      echo "You have not booked any apartman yet"
    else  
    echo " There are $sroom apartments booked: \n"
    cat apartments | grep :1 | cut -d: -f1
      echo "      
       To leave type the room you would like to leave
        Go back to main menu type in (0) 
       (quit)  to exit "

    read checkout 

clear

       
       #sub 1 sub 1 if 1    
       if [ $checkout -eq 1 ]
       then
         sed 's/room1:1/room1:0/g' apartments > temp
         mv temp apartments
         
         echo 'You have been removed from room 1'
       elif [ $checkout -eq 2 ]
       then
         sed 's/room2:1/room2:0/g' apartments > temp
         mv temp apartments
         echo 'You have been removed from room 2'
       elif [ $checkout -eq 3 ]
       then
         sed 's/room3:1/room3:0/g' apartments > temp
         mv temp apartments 
         echo 'You have been removed from room 3'
       elif [ "$checkout" = quit ]
       then
         echo 'Thank you, goodbye! ' 
         exit 1 
       fi #end of sub 1 of sub 1 of if 1
     fi
   fi  
#END OF SECOND SERVICE
       
  elif [ $service -eq 3 ]
  then
   echo "There are: "
       cat singlerooms | grep :0 | cut -d: -f1; echo " single rooms left\n"
       cat doublerooms | grep :0 | cut -d: -f1; echo " double rooms left\n"
       cat apartments | grep :0 | cut -d: -f1; echo " apartments left\n"
  elif [ $service -eq 4 ]
  then
	echo "Single rooms: "
	cat singlerooms | grep :1: | cut -d: -f1 -f3 | sed 's/:/ /g'
	echo "\nDouble rooms: "
	cat doublerooms | grep :1: | cut -d: -f1 -f3 | sed 's/:/ /g'
	echo "\nApartments: "
	cat apartments | grep :1: | cut -d: -f1 -f3 | sed 's/:/ /g'
    echo "\n"
  fi
   
done   
#end of while
