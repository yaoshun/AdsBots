#!/bin/bash

#google-chrome --disable_plugins "http://embed.jungroup.com/embedded_videos/catalog_frame?uid=1832561852&site=InboxDollars&pid=7791782&rewards[][max_quantity]=20&rewards[][reward_id]=0&rewards[][title]=Cents&rewards[][value_in_dollars]=0.03" &
google-chrome "http://embed.jungroup.com/embedded_videos/catalog_frame?uid=1832561852&site=InboxDollars&pid=7791782&rewards[][max_quantity]=20&rewards[][reward_id]=0&rewards[][title]=Cents&rewards[][value_in_dollars]=0.03" &
sleep 20 

./jungroup_bot.sh
