kubectl delete configmap kibana-wazuh-conf
kubectl create configmap kibana-wazuh-conf --from-file=./configs