#!/bin/bash

#google-chrome --disable-plugins "http://embed.jungroup.com/embedded_videos/catalog_frame?uid=186851917&site=SendEarnings&pid=7791783&rewards[][max_quantity]=20&rewards[][reward_id]=0&rewards[][title]=Cents&rewards[][value_in_dollars]=0.03" &
google-chrome "http://embed.jungroup.com/embedded_videos/catalog_frame?uid=186851917&site=SendEarnings&pid=7791783&rewards[][max_quantity]=20&rewards[][reward_id]=0&rewards[][title]=Cents&rewards[][value_in_dollars]=0.03" &

sleep 8

./jungroup_bot.sh
