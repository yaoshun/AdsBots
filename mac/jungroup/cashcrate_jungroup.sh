#!/bin/bash

#google-chrome --disable_plugins "http://embed.jungroup.com/embedded_videos/catalog_frame?uid=3732840&site=CashCrate&pid=4518237&sub_id=0" &
google-chrome "http://embed.jungroup.com/embedded_videos/catalog_frame?uid=3732840&site=CashCrate&pid=4518237&sub_id=0" &
sleep 12

./jungroup_bot.sh
