#!/bin/bash

#google-chrome --disable_plugins "https://live.hyprmx.com/embedded_videos/player?uid=327086&site=GiftHulk&distributorid=3817261&rewards[][max_quantity]=10000&rewards[][reward_id]=0&rewards[][title]=Hulk Coins&rewards[][value_in_dollars]=0.0035" &
google-chrome "https://live.hyprmx.com/embedded_videos/player?uid=327086&site=GiftHulk&distributorid=3817261&rewards[][max_quantity]=10000&rewards[][reward_id]=0&rewards[][title]=Hulk Coins&rewards[][value_in_dollars]=0.0035" &
sleep 12

./jungroup_bot.sh
