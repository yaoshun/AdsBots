#!/bin/bash

#google-chrome --disable_plugins "https://live.hyprmx.com/embedded_videos/player?uid=yaoshun&sub_id=1410567867&site=instaGC&distributorid=2834612&rewards[][max_quantity]=1&rewards[][reward_id]=0&rewards[][title]=Point&rewards[][value_in_dollars]=0.02" &
google-chrome "https://live.hyprmx.com/embedded_videos/player?uid=yaoshun&sub_id=1410567867&site=instaGC&distributorid=2834612&rewards[][max_quantity]=1&rewards[][reward_id]=0&rewards[][title]=Point&rewards[][value_in_dollars]=0.02" &
sleep 8 

./jungroup_bot.sh
