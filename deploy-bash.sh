if [ $# -lt 1 ]; 
then
  echo "No deploy switch found! running validation instead !"
  az group deployment validate -g group001 --template-file azuredeploy.json --parameters @azuredeploy.parameters.json 
  return
fi

if [ $1 == 'deploy' ] ;
then
  az group deployment create -g group001 --template-file azuredeploy.json --parameters @azuredeploy.parameters.json 
elif [ $1 == 'delete' ];
then
  echo "Deleting deployment..."
  az group delete -n group001 --yes
  az group create -n group001 -l southeastasia 
fi

