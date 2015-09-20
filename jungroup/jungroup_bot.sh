#!/bin/bash

sleep 5 

# There are different types of jungroup offers.
# We will try to distinguish by checking colors at different places.

# CLASSIFICATION 
colorone=`./get_pixel 345 563 2`
colortwo=`./get_pixel 342 433 2`

echo "color: $colorone $colortwo"

# Default value
colorcase=4

if [ $colorone -eq 255 ] && [ $colortwo -eq 255 ]
then
    colorcase=1
fi

if [ $colorone -eq 0 ]
then
    colorcase=3
fi

if [ $colorone -eq 0 ] && [ $colortwo -eq 0 ]
then
    colorcase=5
fi

echo "classification: $colorcase"

# BOTS RUNNING 
case $colorcase in
1)
    xte 'mousemove 369 494'
    xte 'mouseclick 1'

    sleep 10

    # Find the Green line
    # Totally three cases
    x=792

    for y in `seq 180 367`
    do
        color=`./get_pixel 30 $y 0`
        if [ "$color" -eq 51 ]
        then
            # y equals 191 in this line
            y=$(($y-20))
            color=`./get_pixel 30 $y 0`
            if [ "$color" -eq 0 ]
            then
                #y=$(($y-30))
                break
            else
                y=367
                break
            fi
        fi
    done

    echo "green line pos $x $y"
    if [ "$y" -eq 367 ]
    then
        #It is alt tab case
        sleep 2
        xte 'keydown Alt_L'
        xte 'key Tab'
        xte 'keyup Alt_L'
        sleep 2

        while [ 1 -le 5 ]
        do
            sleep 1
            color=`./get_pixel 456 453 2`
            #echo "finish color $color"
            if [ "$color" -eq 0 ]
            then
                xte 'mousemove 456 453'
                xte 'mouseclick 1'
                sleep 2
                xte 'keydown Alt_L'
                xte 'key Tab'
                xte 'keyup Alt_L'
                sleep 5
            fi
            if [ "$color" -eq 255 ] || [ "$color" -eq 71 ] || [ "$color" -eq 168 ] || [ "$color" -eq 7 ]
            then
                xte 'keydown Alt_L'
                xte 'key Tab'
                xte 'keyup Alt_L'
                sleep 2
                xte 'keydown Control_L'
                xte 'key w'
                xte 'keyup Control_L'
                sleep 2
                xte 'keydown Control_L'
                xte 'key w'
                xte 'keyup Control_L'
                sleep 2
                exit
            fi
        done
    fi

    # maximum running time
    start=$(date +%s)

    finishcolor=0

    while [ "$finishcolor" -ne 59 ] && [ "$finishcolor" -ne 60 ]
    do
        # Set a upper limit for script running time
        # In case there are bugs in the click step
        end=$(date +%s)
        diff=$(($end-$start))
        if [ "$diff" -ge 600 ]
        then
            # pkill chrome
            xte 'keydown Control_L'
            xte 'key w'
            xte 'keyup Control_L'
            sleep 1
            xte 'keydown Control_L'
            xte 'key w'
            xte 'keyup Control_L'
            sleep 5
            exit
         fi

        sleep 1
        finishcolor=`./get_pixel 972 $y 0`
        color=`./get_pixel $x $y 0`
        if [ "$color" -eq 59 ] || [ "$color" -eq 60 ] || [ "$color" -eq 61 ]
        then
            xte "mousemove $x $y"
            xte 'mouseclick 1'
        fi
    done

    sleep 8

    xte 'keydown Control_L'
    xte 'key w'
    xte 'keyup Control_L'
    sleep 1
    xte 'keydown Control_L'
    xte 'key w'
    xte 'keyup Control_L'
    sleep 5
    exit
;;

# One Click Case Bot
2)
    xte 'mousemove 528 350'
    xte 'mouseclick 1'
    sleep 80
    xte 'keydown Control_L'
    xte 'key w'
    xte 'keyup Control_L'
    sleep 2
    xte 'keydown Control_L'
    xte 'key w'
    xte 'keyup Control_L'
    sleep 2
    exit
;;

# Two Click Case Bot
3)
    sleep 4
    xte 'mousemove 498 360'
    xte 'mouseclick 1'
    sleep 5 
    testcolor=`./get_pixel 248 109 2`
    if [ $testcolor -eq 0 ]
    then
        echo "Added an click here"
        xte 'mousemove 498 360'
        xte 'mouseclick 1'
        sleep 5
    fi
    xte 'mousemove 498 360'
    xte 'mouseclick 1' 
    sleep 10
    
    sleep 180
    xte 'keydown Control_L'
    xte 'key w'
    xte 'keyup Control_L'
    sleep 2
    exit
;;


# Non-Click Case Bot
4)
    sleep 240 
    xte 'keydown Control_L'
    xte 'key w'
    xte 'keyup Control_L'
    sleep 2
    exit
;;

# Special Lays case
5)
    xte 'mousemove 416 592'
    xte 'mouseclick 1'
    sleep 70 
    xte 'keydown Control_L'
    xte 'key w'
    xte 'keyup Control_L'
    sleep 2
    xte 'keydown Control_L'
    xte 'key w'
    xte 'keyup Control_L'
    sleep 2
    exit
;;
esac 

