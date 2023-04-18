
# #################################
# Don't Changs this script Path ! #
# #################################


printf "Removing Previous archive\n"

rm ./configs/pipelines/logstash-pipelines.tar

printf "\nCreate TAR Logstash Configs and pipelines\n\n"

cd ./configs/pipelines/ && tar zcvf logstash-pipelines.tar *

cd ../../

printf "\nCreate ConfigMaps\n\n" 

kubectl delete configmap logstash-pipelines

kubectl create configmap logstash-pipelines --from-file=./configs/pipelines/logstash-pipelines.tar

kubectl delete configmap logstash-config

kubectl create configmap logstash-config --from-file=./configs/config/

kubectl delete configmap logstash-uuid
kubectl create configmap logstash-uuid --from-file=./configs/uuid

kubectl delete configmap logstash-template
kubectl create configmap logstash-template --from-file=./configs/index-template.d

printf "\n\nall things is set !\n"