param MyLocation string = 'northeurope'

targetScope = 'subscription'
resource rg 'Microsoft.Resources/resourceGroups@2020-06-01' = {
    name: 'test-bicep'
    location:MyLocation
    tags:{
        Owner:'anders.carlebring@solita.fi'
        DueDate:'2023-12-31'
    }
}

module appPlanDeploy 'CreateFunctionApp.bicep' = {
    name:'appPlanDeploy'
    scope:rg
    params:{
        location: MyLocation
    }
}
