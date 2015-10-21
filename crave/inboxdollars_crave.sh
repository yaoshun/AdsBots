#!/bin/bash

InboxDollars:
http://pf.entertainmentcrave.com/json/532137f07591fd017e8b4569?callback=?&uid=1832561852&sig=47e70621e9a33710b5831533dce959ca&gender=M&age=26&zip=11790&country=US

InstaGC:
http://ab.entertainmentcrave.com/instagc.html?uid=yaoshun&sig=97fdc062c2af7e7053205cb6a4852f56&age=27&gender=m&zip=11790&country=US

Cashcrate:
src="http://ab.entertainmentcrave.com/landingPages/cc/promo.html?uid=3732840&amp;sig=a10439d0c1a3bcb96364f0c15351fc85&amp;gender=m&amp;age=24&amp;zip=11790&amp;country=us" data-src="http://ab.entertainmentcrave.com/landingPages/cc/promo.html?uid=3732840&amp;sig=a10439d0c1a3bcb96364f0c15351fc85&amp;gender=m&amp;age=24&amp;zip=11790&amp;country=us"

http://ab.entertainmentcrave.com/landingPages/cc/promo.html?uid=3732840&sig=a10439d0c1a3bcb96364f0c15351fc85&gender=m&age=24&zip=11790&country=us

#google-chrome --disable_plugins "http://embed.jungroup.com/embedded_videos/catalog_frame?uid=1832561852&site=InboxDollars&pid=7791782&rewards[][max_quantity]=20&rewards[][reward_id]=0&rewards[][title]=Cents&rewards[][value_in_dollars]=0.03" &
google-chrome "http://embed.jungroup.com/embedded_videos/catalog_frame?uid=1832561852&site=InboxDollars&pid=7791782&rewards[][max_quantity]=20&rewards[][reward_id]=0&rewards[][title]=Cents&rewards[][value_in_dollars]=0.03" &
sleep 20 

./jungroup_bot.sh
