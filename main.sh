#!/bin/bash

source .env
source discord.sh
source watch.sh

url="https://www.toyoko-inn.com/search/result?chck_in=2024/09/07&inn_date=2&rsrv_num=1&sel_ldgngPpl=1&sel_area=52&sel_area_txt=%E5%AE%AE%E5%B4%8E&sel_htl=&rd_smk=&sel_room_clss_Id=&sel_prkng=&sel_cnfrnc=&sel_hrtfll_room=&sel_whlchr=&sel_bath=&sel_rstrnt=&srch_key_word=&lttd=&lngtd=&pgn=1&sel_dtl_cndtn=on&prcssng_dvsn=dtl&"
watch_while_exists "$url" "ご希望の条件に合うホテルは見つかりませんでした。"
send_discord_notification "空室があります:\n$url"
