#!/bin/bash

google-chrome "http://ab.entertainmentcrave.com/landingPages/cc/promo.html?uid=3732840&sig=a10439d0c1a3bcb96364f0c15351fc85&gender=m&age=24&zip=11790&country=us" &
#google-chrome --disable_plugins "http://ab.entertainmentcrave.com/landingPages/cc/promo.html?uid=3732840&sig=a10439d0c1a3bcb96364f0c15351fc85&gender=m&age=24&zip=11790&country=us" &
sleep 10 

./crave_bot.sh
