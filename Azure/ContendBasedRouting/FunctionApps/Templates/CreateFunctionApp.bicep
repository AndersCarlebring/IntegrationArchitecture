param location string = resourceGroup().location
param storageSku string = 'Standard_LRS'
param sites_FunctionApp231214_name string = 'FunctionApp231214'


var functionAppName = 'FunctionApp231214'
var storageAccountName = 'storageaccount231214'
var appServicePlanName = 'FunctionPlan'
var functionRuntime = 'dotnet'

resource storageAccount 'Microsoft.Storage/storageAccounts@2021-04-01' = {
  name: storageAccountName
  location: location
  tags:{
    Owner:'anders.carlebring@solita.fi'
    DueDate:'2023-12-31'
  }
  sku: {
    name: storageSku
  }
  kind: 'StorageV2'
  properties: {
    supportsHttpsTrafficOnly: true
    encryption: {
      services: {
        file: {
          keyType: 'Account'
          enabled: true
        }
        blob: {
          keyType: 'Account'
          enabled: true
        }
      }
      keySource: 'Microsoft.Storage'
    }
    accessTier: 'Hot'
  }
}

resource plan 'Microsoft.Web/serverfarms@2020-12-01' = {
  name: appServicePlanName
  location: location
  tags:{
    Owner:'anders.carlebring@solita.fi'
    DueDate:'2023-12-31'
  }
  kind: 'functionapp'
  sku: {
    name: 'Y1'
  }
  properties: {}
}

resource functionApp 'Microsoft.Web/sites@2022-09-01' = {
name: functionAppName
location: location
tags:{
  Owner:'anders.carlebring@solita.fi'
  DueDate:'2023-12-31'
}
kind: 'functionApp'
properties:{
  serverFarmId: plan.id
  enabled:true
  hostNameSslStates:[
    {
      name: 'functionapp231214.azurewebsites.net'
      sslState: 'Disabled'
      hostType: 'Standard'
    }
    {
      name: 'functionapp231214.scm.azurewebsites.net'
      sslState: 'Disabled'
      hostType: 'Repository'
    }
  ]
  siteConfig: {
    appSettings: [
      {
        name: 'AzureWebJobsStorage'
        value: 'DefaultEndpointsProtocol=https;AccountName=${storageAccount.name};EndpointSuffix=${environment().suffixes.storage};AccountKey=${listKeys(storageAccount.id, storageAccount.apiVersion).keys[0].value}'
      }
      {
        name: 'WEBSITE_CONTENTAZUREFILECONNECTIONSTRING'
        value: 'DefaultEndpointsProtocol=https;AccountName=${storageAccount.name};EndpointSuffix=${environment().suffixes.storage};AccountKey=${listKeys(storageAccount.id, storageAccount.apiVersion).keys[0].value}'
      }
      {
        name: 'FUNCTIONS_WORKER_RUNTIME'
        value: functionRuntime
      }
      {
        name: 'FUNCTIONS_EXTENSION_VERSION'
        value: '~4'
      }
      {
        name:'TestEnvVar'
        value: 'This is my test routing URL returned from Azure function'
      }
    ]
  }
  httpsOnly: true
}
}
resource sites_FunctionApp231214_name_scm 'Microsoft.Web/sites/basicPublishingCredentialsPolicies@2023-01-01' = {
  parent: functionApp
  name: 'scm'
  location: location
  properties: {
    allow: true
  }
}
resource sites_FunctionApp231214_name_web 'Microsoft.Web/sites/config@2023-01-01' = {
  parent: functionApp
  name: 'web'
  location: location
  properties: {
    numberOfWorkers: 1
    defaultDocuments: [
      'Default.htm'
      'Default.html'
      'Default.asp'
      'index.htm'
      'index.html'
      'iisstart.htm'
      'default.aspx'
      'index.php'
    ]
    netFrameworkVersion: 'v6.0'
    requestTracingEnabled: false
    remoteDebuggingEnabled: false
    httpLoggingEnabled: false
    acrUseManagedIdentityCreds: false
    logsDirectorySizeLimit: 35
    detailedErrorLoggingEnabled: false
    publishingUsername: '$FunctionApp231214'
    scmType: 'None'
    use32BitWorkerProcess: true
    webSocketsEnabled: false
    alwaysOn: false
    managedPipelineMode: 'Integrated'
    virtualApplications: [
      {
        virtualPath: '/'
        physicalPath: 'site\\wwwroot'
        preloadEnabled: false
      }
    ]
    loadBalancing: 'LeastRequests'
    experiments: {
      rampUpRules: []
    }
    autoHealEnabled: false
    vnetRouteAllEnabled: false
    vnetPrivatePortsCount: 0
    publicNetworkAccess: 'Enabled'
    cors: {
      allowedOrigins: [
        'https://portal.azure.com'
      ]
      supportCredentials: false
    }
    localMySqlEnabled: false
    ipSecurityRestrictions: [
      {
        ipAddress: 'Any'
        action: 'Allow'
        priority: 2147483647
        name: 'Allow all'
        description: 'Allow all access'
      }
    ]
    scmIpSecurityRestrictions: [
      {
        ipAddress: 'Any'
        action: 'Allow'
        priority: 2147483647
        name: 'Allow all'
        description: 'Allow all access'
      }
    ]
    scmIpSecurityRestrictionsUseMain: false
    http20Enabled: false
    minTlsVersion: '1.2'
    scmMinTlsVersion: '1.2'
    ftpsState: 'FtpsOnly'
    preWarmedInstanceCount: 0
    functionAppScaleLimit: 200
    functionsRuntimeScaleMonitoringEnabled: false
    minimumElasticInstanceCount: 0
    azureStorageAccounts: {}
  }
}

resource sites_FunctionApp231214_name_sites_FunctionApp231214_name_azurewebsites_net 'Microsoft.Web/sites/hostNameBindings@2023-01-01' = {
  parent: functionApp
  name: '${sites_FunctionApp231214_name}.azurewebsites.net'
  location: location
  properties: {
    siteName: 'FunctionApp231214'
    hostNameType: 'Verified'
  }
}
