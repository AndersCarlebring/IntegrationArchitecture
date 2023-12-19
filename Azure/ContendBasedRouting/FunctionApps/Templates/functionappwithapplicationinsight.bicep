param sites_FunctionApp231214_name string = 'FunctionApp231214'
param serverfarms_FunctionPlan_externalid string = '/subscriptions/412ed95a-04ce-4866-aed3-4665fa772e8d/resourceGroups/test-bicep/providers/Microsoft.Web/serverfarms/FunctionPlan'

resource sites_FunctionApp231214_name_resource 'Microsoft.Web/sites@2023-01-01' = {
  name: sites_FunctionApp231214_name
  location: 'North Europe'
  tags: {
    Owner: 'anders.carlebring@solita.fi'
    DueDate: '2023-12-31'
    'hidden-link: /app-insights-resource-id': '/subscriptions/412ed95a-04ce-4866-aed3-4665fa772e8d/resourceGroups/test-bicep/providers/microsoft.insights/components/FunctionApp231214'
    'hidden-link: /app-insights-instrumentation-key': '74a0ae0d-16e3-4881-adad-1125063df18a'
  }
  kind: 'functionapp'
  properties: {
    enabled: true
    hostNameSslStates: [
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
    serverFarmId: serverfarms_FunctionPlan_externalid
    reserved: false
    isXenon: false
    hyperV: false
    vnetRouteAllEnabled: false
    vnetImagePullEnabled: false
    vnetContentShareEnabled: false
    siteConfig: {
      numberOfWorkers: 1
      acrUseManagedIdentityCreds: false
      alwaysOn: false
      http20Enabled: false
      functionAppScaleLimit: 200
      minimumElasticInstanceCount: 0
    }
    scmSiteAlsoStopped: false
    clientAffinityEnabled: false
    clientCertEnabled: false
    clientCertMode: 'Required'
    hostNamesDisabled: false
    customDomainVerificationId: '408FFC79A0067B35E8B1116FF25DF47C27584696736718969A5A823C6AC37C0F'
    containerSize: 1536
    dailyMemoryTimeQuota: 0
    httpsOnly: true
    redundancyMode: 'None'
    storageAccountRequired: false
    keyVaultReferenceIdentity: 'SystemAssigned'
  }
}

resource sites_FunctionApp231214_name_ftp 'Microsoft.Web/sites/basicPublishingCredentialsPolicies@2023-01-01' = {
  parent: sites_FunctionApp231214_name_resource
  name: 'ftp'
  location: 'North Europe'
  tags: {
    Owner: 'anders.carlebring@solita.fi'
    DueDate: '2023-12-31'
    'hidden-link: /app-insights-resource-id': '/subscriptions/412ed95a-04ce-4866-aed3-4665fa772e8d/resourceGroups/test-bicep/providers/microsoft.insights/components/FunctionApp231214'
    'hidden-link: /app-insights-instrumentation-key': '74a0ae0d-16e3-4881-adad-1125063df18a'
  }
  properties: {
    allow: true
  }
}

resource sites_FunctionApp231214_name_scm 'Microsoft.Web/sites/basicPublishingCredentialsPolicies@2023-01-01' = {
  parent: sites_FunctionApp231214_name_resource
  name: 'scm'
  location: 'North Europe'
  tags: {
    Owner: 'anders.carlebring@solita.fi'
    DueDate: '2023-12-31'
    'hidden-link: /app-insights-resource-id': '/subscriptions/412ed95a-04ce-4866-aed3-4665fa772e8d/resourceGroups/test-bicep/providers/microsoft.insights/components/FunctionApp231214'
    'hidden-link: /app-insights-instrumentation-key': '74a0ae0d-16e3-4881-adad-1125063df18a'
  }
  properties: {
    allow: true
  }
}

resource sites_FunctionApp231214_name_web 'Microsoft.Web/sites/config@2023-01-01' = {
  parent: sites_FunctionApp231214_name_resource
  name: 'web'
  location: 'North Europe'
  tags: {
    Owner: 'anders.carlebring@solita.fi'
    DueDate: '2023-12-31'
    'hidden-link: /app-insights-resource-id': '/subscriptions/412ed95a-04ce-4866-aed3-4665fa772e8d/resourceGroups/test-bicep/providers/microsoft.insights/components/FunctionApp231214'
    'hidden-link: /app-insights-instrumentation-key': '74a0ae0d-16e3-4881-adad-1125063df18a'
  }
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
    phpVersion: '5.6'
    requestTracingEnabled: false
    remoteDebuggingEnabled: false
    remoteDebuggingVersion: 'VS2019'
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

resource sites_FunctionApp231214_name_1651cd102af74200a5d83d4abfe9e884 'Microsoft.Web/sites/deployments@2023-01-01' = {
  parent: sites_FunctionApp231214_name_resource
  name: '1651cd102af74200a5d83d4abfe9e884'
  location: 'North Europe'
  properties: {
    status: 4
    author_email: 'N/A'
    author: 'N/A'
    deployer: 'ZipDeploy'
    message: 'Created via a push deployment'
    start_time: '2023-12-15T09:47:21.159417Z'
    end_time: '2023-12-15T09:47:22.518995Z'
    active: true
  }
}

resource sites_FunctionApp231214_name_GetContentBaseRoutingValue 'Microsoft.Web/sites/functions@2023-01-01' = {
  parent: sites_FunctionApp231214_name_resource
  name: 'GetContentBaseRoutingValue'
  location: 'North Europe'
  properties: {
    script_root_path_href: 'https://functionapp231214.azurewebsites.net/admin/vfs/site/wwwroot/GetContentBaseRoutingValue/'
    script_href: 'https://functionapp231214.azurewebsites.net/admin/vfs/site/wwwroot/bin/function_ContentBasedRouting.dll'
    config_href: 'https://functionapp231214.azurewebsites.net/admin/vfs/site/wwwroot/GetContentBaseRoutingValue/function.json'
    test_data_href: 'https://functionapp231214.azurewebsites.net/admin/vfs/data/Functions/sampledata/GetContentBaseRoutingValue.dat'
    href: 'https://functionapp231214.azurewebsites.net/admin/functions/GetContentBaseRoutingValue'
    config: {}
    invoke_url_template: 'https://functionapp231214.azurewebsites.net/api/getcontentbaseroutingvalue'
    language: 'DotNetAssembly'
    isDisabled: false
  }
}

resource sites_FunctionApp231214_name_sites_FunctionApp231214_name_azurewebsites_net 'Microsoft.Web/sites/hostNameBindings@2023-01-01' = {
  parent: sites_FunctionApp231214_name_resource
  name: '${sites_FunctionApp231214_name}.azurewebsites.net'
  location: 'North Europe'
  properties: {
    siteName: 'FunctionApp231214'
    hostNameType: 'Verified'
  }
}