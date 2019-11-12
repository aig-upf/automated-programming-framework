# DOMAIN RP
echo 'RP results...'
echo 'RP [POS] positives'
grep experiments/neg/aaai20/rp/*.pos.val -e "\[.*POS-" | wc -l
echo 'RP [POS] false negatives'
grep experiments/neg/aaai20/rp/*.pos.val.err -e "\[.*POS-" | wc -l
echo 'RP [POS] false positives'
grep experiments/neg/aaai20/rp/*.pos.val -e "\[.*NEG-" | wc -l
echo 'RP [POS] negatives'
grep experiments/neg/aaai20/rp/*.pos.val.err -e "\[.*NEG-" | wc -l

echo 'RP [NEGLITE] positives'
grep experiments/neg/aaai20/rp/*.neglite.val -e "\[.*POS-" | wc -l
echo 'RP [NEGLITE] false negatives'
grep experiments/neg/aaai20/rp/*.neglite.val.err -e "\[.*POS-" | wc -l
echo 'RP [NEGLITE] false positives'
grep experiments/neg/aaai20/rp/*.neglite.val -e "\[.*NEG-" | wc -l
echo 'RP [NEGLITE] negatives'
grep experiments/neg/aaai20/rp/*.neglite.val.err -e "\[.*NEG-" | wc -l

echo 'RP [NEG] positives'
grep experiments/neg/aaai20/rp/*.neg.val -e "\[.*POS-" | wc -l
echo 'RP [NEG] false negatives'
grep experiments/neg/aaai20/rp/*.neg.val.err -e "\[.*POS-" | wc -l
echo 'RP [NEG] false positives'
grep experiments/neg/aaai20/rp/*.neg.val -e "\[.*NEG-" | wc -l
echo 'RP [NEG] negatives'
grep experiments/neg/aaai20/rp/*.neg.val.err -e "\[.*NEG-" | wc -l

# DOMAIN LIST
echo 'LIST results...'
echo 'LIST [POS] positives'
grep experiments/neg/aaai20/list/*.pos.val -e "\[.*POS-" | wc -l
echo 'LIST [POS] false negatives'
grep experiments/neg/aaai20/list/*.pos.val.err -e "\[.*POS-" | wc -l
echo 'LIST [POS] false positives'
grep experiments/neg/aaai20/list/*.pos.val -e "\[.*NEG-" | wc -l
echo 'LIST [POS] negatives'
grep experiments/neg/aaai20/list/*.pos.val.err -e "\[.*NEG-" | wc -l

echo 'LIST [NEGLITE] positives'
grep experiments/neg/aaai20/list/*.neglite.val -e "\[.*POS-" | wc -l
echo 'LIST [NEGLITE] false negatives'
grep experiments/neg/aaai20/list/*.neglite.val.err -e "\[.*POS-" | wc -l
echo 'LIST [NEGLITE] false positives'
grep experiments/neg/aaai20/list/*.neglite.val -e "\[.*NEG-" | wc -l
echo 'LIST [NEGLITE] negatives'
grep experiments/neg/aaai20/list/*.neglite.val.err -e "\[.*NEG-" | wc -l

echo 'LIST [NEG] positives'
grep experiments/neg/aaai20/list/*.neg.val -e "\[.*POS-" | wc -l
echo 'LIST [NEG] false negatives'
grep experiments/neg/aaai20/list/*.neg.val.err -e "\[.*POS-" | wc -l
echo 'LIST [NEG] false positives'
grep experiments/neg/aaai20/list/*.neg.val -e "\[.*NEG-" | wc -l
echo 'LIST [NEG] negatives'
grep experiments/neg/aaai20/list/*.neg.val.err -e "\[.*NEG-" | wc -l

# DOMAIN TS
echo 'TS results...'
echo 'TS [POS] positives'
grep experiments/neg/aaai20/ts/*.pos.val -e "\[.*POS-" | wc -l
echo 'TS [POS] false negatives'
grep experiments/neg/aaai20/ts/*.pos.val.err -e "\[.*POS-" | wc -l
echo 'TS [POS] false positives'
grep experiments/neg/aaai20/ts/*.pos.val -e "\[.*NEG-" | wc -l
echo 'TS [POS] negatives'
grep experiments/neg/aaai20/ts/*.pos.val.err -e "\[.*NEG-" | wc -l

echo 'TS [NEGLITE] positives'
grep experiments/neg/aaai20/ts/*.neglite.val -e "\[.*POS-" | wc -l
echo 'TS [NEGLITE] false negatives'
grep experiments/neg/aaai20/ts/*.neglite.val.err -e "\[.*POS-" | wc -l
echo 'TS [NEGLITE] false positives'
grep experiments/neg/aaai20/ts/*.neglite.val -e "\[.*NEG-" | wc -l
echo 'TS [NEGLITE] negatives'
grep experiments/neg/aaai20/ts/*.neglite.val.err -e "\[.*NEG-" | wc -l

echo 'TS [NEG] positives'
grep experiments/neg/aaai20/ts/*.neg.val -e "\[.*POS-" | wc -l
echo 'TS [NEG] false negatives'
grep experiments/neg/aaai20/ts/*.neg.val.err -e "\[.*POS-" | wc -l
echo 'TS [NEG] false positives'
grep experiments/neg/aaai20/ts/*.neg.val -e "\[.*NEG-" | wc -l
echo 'TS [NEG] negatives'
grep experiments/neg/aaai20/ts/*.neg.val.err -e "\[.*NEG-" | wc -l

# DOMAIN GB
echo 'GB results...'
echo 'GB [POS] positives'
grep experiments/neg/aaai20/gb/*.pos.val -e "\[.*POS-" | wc -l
echo 'GB [POS] false negatives'
grep experiments/neg/aaai20/gb/*.pos.val.err -e "\[.*POS-" | wc -l
echo 'GB [POS] false positives'
grep experiments/neg/aaai20/gb/*.pos.val -e "\[.*NEG-" | wc -l
echo 'GB [POS] negatives'
grep experiments/neg/aaai20/gb/*.pos.val.err -e "\[.*NEG-" | wc -l

echo 'GB [NEGLITE] positives'
grep experiments/neg/aaai20/gb/*.neglite.val -e "\[.*POS-" | wc -l
echo 'GB [NEGLITE] false negatives'
grep experiments/neg/aaai20/gb/*.neglite.val.err -e "\[.*POS-" | wc -l
echo 'GB [NEGLITE] false positives'
grep experiments/neg/aaai20/gb/*.neglite.val -e "\[.*NEG-" | wc -l
echo 'GB [NEGLITE] negatives'
grep experiments/neg/aaai20/gb/*.neglite.val.err -e "\[.*NEG-" | wc -l

echo 'GB [NEG] positives'
grep experiments/neg/aaai20/gb/*.neg.val -e "\[.*POS-" | wc -l
echo 'GB [NEG] false negatives'
grep experiments/neg/aaai20/gb/*.neg.val.err -e "\[.*POS-" | wc -l
echo 'GB [NEG] false positives'
grep experiments/neg/aaai20/gb/*.neg.val -e "\[.*NEG-" | wc -l
echo 'GB [NEG] negatives'
grep experiments/neg/aaai20/gb/*.neg.val.err -e "\[.*NEG-" | wc -l


# DOMAIN GRIPPER
echo 'GRIPPER results...'
echo 'GRIPPER [POS] positives'
grep experiments/neg/aaai20/gripper/*.pos.val -e "\[.*POS-" | wc -l
echo 'GRIPPER [POS] false negatives'
grep experiments/neg/aaai20/gripper/*.pos.val.err -e "\[.*POS-" | wc -l
echo 'GRIPPER [POS] false positives'
grep experiments/neg/aaai20/gripper/*.pos.val -e "\[.*NEG-" | wc -l
echo 'GRIPPER [POS] negatives'
grep experiments/neg/aaai20/gripper/*.pos.val.err -e "\[.*NEG-" | wc -l

echo 'GRIPPER [NEGLITE] positives'
grep experiments/neg/aaai20/gripper/*.neglite.val -e "\[.*POS-" | wc -l
echo 'GRIPPER [NEGLITE] false negatives'
grep experiments/neg/aaai20/gripper/*.neglite.val.err -e "\[.*POS-" | wc -l
echo 'GRIPPER [NEGLITE] false positives'
grep experiments/neg/aaai20/gripper/*.neglite.val -e "\[.*NEG-" | wc -l
echo 'GRIPPER [NEGLITE] negatives'
grep experiments/neg/aaai20/gripper/*.neglite.val.err -e "\[.*NEG-" | wc -l

echo 'GRIPPER [NEG] positives'
grep experiments/neg/aaai20/gripper/*.neg.val -e "\[.*POS-" | wc -l
echo 'GRIPPER [NEG] false negatives'
grep experiments/neg/aaai20/gripper/*.neg.val.err -e "\[.*POS-" | wc -l
echo 'GRIPPER [NEG] false positives'
grep experiments/neg/aaai20/gripper/*.neg.val -e "\[.*NEG-" | wc -l
echo 'GRIPPER [NEG] negatives'
grep experiments/neg/aaai20/gripper/*.neg.val.err -e "\[.*NEG-" | wc -l


# DOMAIN FIBO
echo 'FIBO results...'
echo 'FIBO [POS] positives'
grep experiments/neg/aaai20/fibo/*.pos.val -e "\[.*POS-" | wc -l
echo 'FIBO [POS] false negatives'
grep experiments/neg/aaai20/fibo/*.pos.val.err -e "\[.*POS-" | wc -l
echo 'FIBO [POS] false positives'
grep experiments/neg/aaai20/fibo/*.pos.val -e "\[.*NEG-" | wc -l
echo 'FIBO [POS] negatives'
grep experiments/neg/aaai20/fibo/*.pos.val.err -e "\[.*NEG-" | wc -l

echo 'FIBO [NEGLITE] positives'
grep experiments/neg/aaai20/fibo/*.neglite.val -e "\[.*POS-" | wc -l
echo 'FIBO [NEGLITE] false negatives'
grep experiments/neg/aaai20/fibo/*.neglite.val.err -e "\[.*POS-" | wc -l
echo 'FIBO [NEGLITE] false positives'
grep experiments/neg/aaai20/fibo/*.neglite.val -e "\[.*NEG-" | wc -l
echo 'FIBO [NEGLITE] negatives'
grep experiments/neg/aaai20/fibo/*.neglite.val.err -e "\[.*NEG-" | wc -l

echo 'FIBO [NEG] positives'
grep experiments/neg/aaai20/fibo/*.neg.val -e "\[.*POS-" | wc -l
echo 'FIBO [NEG] false negatives'
grep experiments/neg/aaai20/fibo/*.neg.val.err -e "\[.*POS-" | wc -l
echo 'FIBO [NEG] false positives'
grep experiments/neg/aaai20/fibo/*.neg.val -e "\[.*NEG-" | wc -l
echo 'FIBO [NEG] negatives'
grep experiments/neg/aaai20/fibo/*.neg.val.err -e "\[.*NEG-" | wc -l
