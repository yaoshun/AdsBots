#!/bin/bash

#google-chrome --disable_plugins "https://embed.jungroup.com/embedded_videos/catalog_frame?uid=8810823&pid=17&sub_id=8810823" &
google-chrome "https://embed.jungroup.com/embedded_videos/catalog_frame?uid=8810823&pid=17&sub_id=8810823" &
sleep 8

./jungroup_bot.sh
