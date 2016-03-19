#!/bin/bash

# CLASSIFICATION 
# Only two cases right now.
# Case one is the Alt Tab case (Default)
# Case two is the Good and Bad judgement case.
colorone=`./get_pixel 329 281 2`

colorcase=1

if [ $colorone -eq 144 ]
then
    colorcase=2
fi

echo "classification: $colorcase"

case $colorcase in
1)
    xte 'mousemove 420 619'
    xte 'mouseclick 1'
    
    sleep 6 

    xte 'keydown Control_L' 'keydown Super_L' 
    sleep 2
    xte 'key Up'
    sleep 2
    xte 'keyup Control_L' 'keyup Super_L'
    sleep 2

    xte 'keydown Alt_L'
    xte 'key Tab'
    xte 'keyup Alt_L'
    sleep 2
    
    while [ 1 -le 5 ]
    do
        sleep 1
        color=`./get_pixel 410 290 1`
        #echo "finish color $color"
        if [ "$color" -eq 211 ]
        then
            xte 'mousemove 410 290'
            xte 'mouseclick 1'
            sleep 2
            xte 'keydown Alt_L'
            xte 'key Tab'
            xte 'keyup Alt_L'
            sleep 5
        fi
        if [ "$color" -eq 255 ]
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
;;

2)
    xte 'mousemove 420 619'
    xte 'mouseclick 1'

    sleep 6
    xte 'keydown Control_L' 'keydown Super_L' 
    sleep 2
    xte 'key Up'
    sleep 2
    xte 'keyup Control_L' 'keyup Super_L'
    sleep 2

    sleep 4

    while [ 1 -le 5 ]
    do
        sleep 1
        color=`./get_pixel 275 192 0`
        echo "currentcolor: $color"
        if [ $color -eq 0 ] || [ $color -eq 211 ]
        then
            xte 'mousemove 275 192'
            xte 'mouseclick 1'
            sleep 3 
        fi

        if [ $color -eq 75 ]
        then
            xte 'mousemove 275 192'
            xte 'mouseclick 1'
            sleep 5 
            xte 'keydown Control_L'
            xte 'key w'
            xte 'keyup Control_L'
            sleep 2
            exit
        fi
    done
;;
esac
