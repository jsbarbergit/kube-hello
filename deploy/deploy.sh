#!/usr/bin/env bash
KC=$(which kubectl)
if [ -z $KC ]; then
    echo "kubectl not fouind. Exiting"
    exit 1
fi

MC=$(which minikube)
if [ -z $MC ]; then 
    echo "minikube not found. Exiting"
    exit 1
fi

for i in namespace deployment service; do
    echo "Creating/Updating $i  "
    $KC apply -f $i.yaml
done

# Print service name
URL=$($MC service -n kube-hello kube-hello --url)
echo -e "\nAccess the kube-hello service at:"
echo 
echo -e $URL"\n"
echo 
exit 0