#!/bin/bash

#google-chrome --disable-plugins "https://embed.jungroup.com/embedded_videos/player?uid=281759&site=iRazoo&distributorid=3869999&rewards[][max_quantity]=10&rewards[][reward_id]=0&rewards[][title]=iRazoo Points&rewards[][value_in_dollars]=0.03" &
google-chrome "https://embed.jungroup.com/embedded_videos/player?uid=281759&site=iRazoo&distributorid=3869999&rewards[][max_quantity]=10&rewards[][reward_id]=0&rewards[][title]=iRazoo Points&rewards[][value_in_dollars]=0.03" &
sleep 8

./jungroup_bot.sh
