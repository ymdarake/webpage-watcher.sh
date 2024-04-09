#!/bin/bash

trap "kill 0" INT

set -eu
source app.sh

tyk7="https://www.toyoko-inn.com/sp/search/result?chck_in=2024/09/07&inn_date=1&rsrv_num=1&sel_ldgngPpl=1&sel_area=52&sel_area_txt=%E5%AE%AE%E5%B4%8E&sel_htl=&rd_smk=&sel_room_clss_Id=&sel_prkng=&sel_cnfrnc=&sel_hrtfll_room=&sel_whlchr=&sel_bath=&sel_rstrnt=&srch_key_word=&lttd=&lngtd=&pgn=1&sel_dtl_cndtn=&prcssng_dvsn=dtl&"
tyk8="https://www.toyoko-inn.com/sp/search/result?chck_in=2024/09/08&inn_date=1&rsrv_num=1&sel_ldgngPpl=1&sel_area=52&sel_area_txt=%E5%AE%AE%E5%B4%8E&sel_htl=&rd_smk=&sel_room_clss_Id=&sel_prkng=&sel_cnfrnc=&sel_hrtfll_room=&sel_whlchr=&sel_bath=&sel_rstrnt=&srch_key_word=&lttd=&lngtd=&pgn=1&sel_dtl_cndtn=&prcssng_dvsn=dtl&"
jal="https://secure.reservation.jp/okura-jalhotels/s_sp/rsv/search_list.aspx?hi_id=43&lang=ja-JP&dt=2024/09/07&le=2&mc=1&rc=1&cp_id=guest"

run "$tyk7" "ご希望の条件に合うホテルは見つかりませんでした。" "7日の東横イン" &
PID1=$!

run "$tyk8" "ご希望の条件に合うホテルは見つかりませんでした。" "8日の東横イン" &
PID2=$!

run "$jal" "利用できるお部屋がございません。" "JALシティ" &
PID3=$!

wait $PID1 $PID2 $PID3
