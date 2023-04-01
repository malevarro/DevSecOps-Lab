#---Crear variables
export VID=$RANDOM
export RESOURCE_GROUP=myaksrg-$VID
export WEBAPP_NAME=myk8sapp-$VID
export LOCATION='eastus'
export ACR_NAME=myacr$VID

#---Verifique variables
echo $VID
echo $RESOURCE_GROUP
echo $WEBAPP_NAME
echo $LOCATION

#---Crear recursos
#Grupo de Recursos
az group create --name=$RESOURCE_GROUP --location=$LOCATION

#---Creando ACR
echo "Creating ACR..."
az acr create -n $ACR_NAME -g $RESOURCE_GROUP --sku basic
az acr update -n $ACR_NAME --admin-enabled true

#---Obtener credenciales de acceso
export ACR_USERNAME=$(az acr credential show -n $ACR_NAME --query "username" -o tsv)
export ACR_PASSWORD=$(az acr credential show -n $ACR_NAME --query "passwords[0].value" -o tsv)

#---Crear el ASP
az appservice plan create -g $RESOURCE_GROUP -n $WEBAPP_NAME --is-linux --sku B1

#---Crear el Web App Service
az webapp create --resource-group $RESOURCE_GROUP --plan $WEBAPP_NAME --name $WEBAPP_NAME --deployment-container-image-name nginx
az webapp config container set --docker-custom-image-name nginx --docker-registry-server-password $ACR_PASSWORD --docker-registry-server-url https://$ACR_NAME.azurecr.io --docker-registry-server-user $ACR_USERNAME --name $WEBAPP_NAME --resource-group $RESOURCE_GROUP

#---Validar Web App Service
az webapp config container show --name $WEBAPP_NAME --resource-group $RESOURCE_GROUP

#Listar los valores de las variables
echo "Installation concluded, copy these values and store them, you'll use them later in this exercise:"
echo "-> Resource Group Name: $RESOURCE_GROUP"
echo "-> ACR Name: $ACR_NAME"
echo "-> ACR Login Username: $ACR_USERNAME"
echo "-> ACR Password: $ACR_PASSWORD"
echo "-> Web App Name: $WEBAPP_NAME"


#Verificar componentes creados y activos
az group list -o table
az acr list -o table
