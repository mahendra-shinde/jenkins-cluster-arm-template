if [ $# -lt 1 ]; 
then
  echo "No deploy switch found! running validation instead !"
  az group deployment validate -g group001 --template-file azuredeploy.json --parameters @azuredeploy.parameters.json 
else
  az group deployment create -g group001 --template-file azuredeploy.json --parameters @azuredeploy.parameters.json 
fi
