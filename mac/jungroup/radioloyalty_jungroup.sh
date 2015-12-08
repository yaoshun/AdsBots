#!/bin/bash

number=`curl "http://radioloyalty.com/loyalty/videoCheck.php?userID=428075&userIP=130.245.211.150" | grep -o -E "lastRequestID = '.{7,7}"`

echo "$number"
id=${number:17}

echo $id

#google-chrome --disable-plugins "http://embed.jungroup.com/embedded_videos/catalog_frame?uid=428075&site=RadioLoyalty&pid=7777911&sub_id=$id&reward=100%20Points" &
google-chrome "http://embed.jungroup.com/embedded_videos/catalog_frame?uid=428075&site=RadioLoyalty&pid=7777911&sub_id=$id&reward=100%20Points" &

sleep 12 

./jungroup_bot.sh
