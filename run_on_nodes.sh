ssh node1 ~/DrugTest/a.out ~/DrugTest/model_893 ~/DrugTest/part0 ~/DrugTest/outfile0 &
ssh node2 ~/DrugTest/a.out ~/DrugTest/model_893 ~/DrugTest/part1 ~/DrugTest/outfile1 &
ssh node3 ~/DrugTest/a.out ~/DrugTest/model_893 ~/DrugTest/part2 ~/DrugTest/outfile2 &
ssh node4 ~/DrugTest/a.out ~/DrugTest/model_893 ~/DrugTest/part3 ~/DrugTest/outfile3 &
ssh node5 ~/DrugTest/a.out ~/DrugTest/model_893 ~/DrugTest/part4 ~/DrugTest/outfile4 &
ssh node6 ~/DrugTest/a.out ~/DrugTest/model_893 ~/DrugTest/part5 ~/DrugTest/outfile5 &
#ssh node7 ~/DrugTest/a.out ~/DrugTest/model_893 ~/DrugTest/part6 ~/DrugTest/outfile6 &
#ssh node8 ~/DrugTest/a.out ~/DrugTest/model_893 ~/DrugTest/part7 ~/DrugTest/outfile7 &

wait

echo "All Nodes complete"

echo "Combining files"

sh combine.sh

