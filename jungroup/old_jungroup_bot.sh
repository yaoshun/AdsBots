#!/bin/bash

sleep 10 

# There are different types of jungroup offers.
# We will try to distinguish by checking colors at different places.
# The first part is classification part 
colorone=`./get_pixel 345 563 2`
colortwo=`./get_pixel 342 433 2`

echo "color: $colorone $colortwo"

# case 1: old green line finding process
# case 2: alt tab offer series
# case 3: one click and wait
# case 4: non click video
# case 5: two click video 
# case 6: others
# case 7: very new one
# case 8: one click video
# case 9: scroll down one click

# classification part

colorcase=4

if [ $colorone -eq 161 ] && [ $colortwo -eq 101 ]
then
    colorcase=3
fi

if [ $colorone -eq 28 ] && [ $colortwo -eq 131 ]
then
    colorcase=8
fi
if [ $colorone -eq 69 ] && [ $colortwo -eq 110 ]
then
    colorcase=8
fi
if [ $colorone -eq 94 ] && [ $colortwo -eq 52 ]
then
    colorcase=8
fi
if [ $colorone -eq 247 ] && [ $colortwo -eq 186 ]
then
    colorcase=8
fi

if [ $colorone -eq 0 ] && [ $colortwo -ne 255 ]
then
    colorcase=1
fi

if [ $colorone -eq 0 ] && [ $colortwo -eq 255 ]
then
    colorcase=2
fi

if [ $colorone -eq 0 ] && [ $colortwo -eq 2 ]
then
    colorcase=2
fi

if [ $colorone -eq 56 ] && [ $colortwo -eq 50 ]
then
    colorcase=6
fi

if [ $colorone -eq 109 ] && [ $colortwo -eq 216 ]
then
    colorcase=6
fi

if [ $colorone -eq 13 ] && [ $colortwo -eq 67 ]
then
    colorcase=8
fi

if [ $colorone -eq 27 ] && [ $colortwo -eq 197 ]
then
    colorcase=8
fi

if [ $colorone -eq 255 ]
then
    colorcase=5
fi

if [ $colorone -eq 255 ] && [ $colortwo -eq 253 ]
then
    colorcase=7
fi

if [ $colorone -eq 255 ] && [ $colortwo -eq 188 ]
then
    colorcase=7
fi

if [ $colorone -eq 255 ] && [ $colortwo -eq 255 ]
then
    colorcase=7
fi

if [ $colorone -eq 163 ] && [ $colortwo -eq 179 ]
then
    colorcase=7
fi
if [ $colorone -eq 245 ] && [ $colortwo -eq 133 ]
then
    colorcase=7
fi
if [ $colorone -eq 255 ] && [ $colortwo -eq 63 ]
then
    colorcase=7
fi

if [ $colorone -eq 11 ] && [ $colortwo -eq 254 ]
then
    colorcase=9
fi

if [ $colorone -eq 9 ] && [ $colortwo -eq 253 ]
then
    colorcase=1
fi

if [ $colorone -eq 9 ] && [ $colortwo -eq 14 ]
then
    colorcase=1

fi
if [ $colorone -eq 170 ] && [ $colortwo -eq 104 ]
then
    colorcase=3
fi

if [ $colorone -eq 138 ] && [ $colortwo -eq 62 ]
then
    colorcase=3
fi

if [ $colorone -eq 32 ] && [ $colortwo -eq 255 ]
then
    colorcase=3
fi

if [ $colorone -eq 244 ] && [ $colortwo -eq 243 ]
then
    colorcase=3
fi

if [ $colorone -eq 255 ] && [ $colortwo -eq 24 ]
then
    colorcase=2
fi
if [ $colorone -eq 255 ] && [ $colortwo -eq 23 ]
then
    colorcase=2
fi
if [ $colorone -eq 255 ] && [ $colortwo -eq 22 ]
then
    colorcase=2
fi
if [ $colorone -eq 21 ] && [ $colortwo -eq 8 ]
then
    colorcase=2
fi
if [ $colorone -eq 21 ] && [ $colortwo -eq 17 ]
then
    colorcase=2
fi

if [ $colorone -eq 0 ] && [ $colortwo -eq 241 ]
then
    colorcase=5
fi

echo "classification: $colorcase"
# running part
case $colorcase in

1)
    xte 'mousemove 345 565'
    #xte 'mousemove 345 458'
    xte 'mouseclick 1'
    sleep 10

    # Find the Green line
    # Totally three cases
    x=735

    for y in `seq 210 367`
    do
        color=`./get_pixel 30 $y 0`
        if [ "$color" -eq 51 ]
        then
            y=$(($y-50))
            break
        fi
    done

    echo "green line pos $x $y"
    if [ "$color" -ne 51 ]
    then
        # it is considered as a one click case
        sleep 180
        pkill chrome
        sleep 5
        exit
    fi

    # maximum running time
    start=$(date +%s)

    finishcolor=0

    while [ "$finishcolor" -ne 59 ]
    do
        # Set a upper limit for script running time
        # In case there are bugs in the click step
        end=$(date +%s)
        diff=$(($end-$start))
        if [ "$diff" -ge 600 ]
        then
            pkill chrome
            sleep 5
            exit
         fi

        sleep 1
        finishcolor=`./get_pixel 975 $y 0`
        color=`./get_pixel $x $y 0`
        if [ "$color" -eq 59 ] || [ "$color" -eq 60 ] || [ "$color" -eq 61 ] || [ "$color" -eq 66 ]
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

2)
    #xte 'mousemove 345 563'
    xte 'mousemove 345 590'
    xte 'mouseclick 1'

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
        if [ "$color" -eq 255 ] || [ "$color" -eq 71 ] || [ "$color" -eq 187 ]
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

3)
    xte 'mousemove 528 350'
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

4)
    sleep 480 
    xte 'keydown Control_L'
    xte 'key w'
    xte 'keyup Control_L'
    sleep 2
    exit
;;

5)
    sleep 4
    xte 'mousemove 498 360'
    xte 'mouseclick 1'
    sleep 2
    xte 'mousemove 498 360'
    xte 'mouseclick 1'
    sleep 360 
    xte 'keydown Control_L'
    xte 'key w'
    xte 'keyup Control_L'
    sleep 2
    exit
;;

6)
    xte 'mousemove 345 563'
    xte 'mouseclick 1'
    while [ 1 -le 5 ]
    do
        sleep 1
        color=`./get_pixel 793 100 0`
        #echo "finish color $color"
        if [ "$color" -eq 59 ]
        then
            xte 'mousemove 793 100'
            xte 'mouseclick 1'
            sleep 2
        fi
        if [ "$color" -eq 255 ]
        then
            sleep 2
            xte 'keydown Control_L'
            xte 'key w'
            xte 'keyup Control_L'
            sleep 2
            exit
        fi
    done
;;

7)
    xte 'mousemove 369 494'
    xte 'mouseclick 1'

    sleep 10

    # Find the Green line
    # Totally three cases
    x=780

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
            if [ "$color" -eq 255 ] || [ "$color" -eq 71 ] || [ "$color" -eq 151 ] || [ "$color" -eq 7 ]
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
            pkill chrome
            sleep 5
            exit
         fi

        sleep 1
        finishcolor=`./get_pixel 970 $y 0`
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

8)
    sleep 4
    xte 'mousemove 498 360'
    xte 'mouseclick 1'
    sleep 180
    xte 'keydown Control_L'
    xte 'key w'
    xte 'keyup Control_L'
    sleep 2
    exit
;;

9)
    xte 'mousemove 498 360'
    xte 'mouseclick 5'
    xte 'mouseclick 5'
    sleep 2
    xte 'mousemove 329 700'
    xte 'mouseclick 1'
    
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
            sleep 1
        fi
        if [ "$color" -eq 255 ] || [ "$color" -eq 71 ]
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
esac 

