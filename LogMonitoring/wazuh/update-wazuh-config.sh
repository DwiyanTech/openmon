kubectl delete configmap wazuh-conf
kubectl create configmap wazuh-conf --from-file=./configs/ossec.conf
kubectl delete configmap wazuh-filebeat
kubectl create configmap wazuh-filebeat --from-file=./configs/filebeat

kubectl apply -f ./configs/wazuh-api-creds.yaml
kubectl apply -f ./configs/wazuh-authd-pass.yaml
kubectl apply -f ./configs/wazuh-cluster-key.yaml