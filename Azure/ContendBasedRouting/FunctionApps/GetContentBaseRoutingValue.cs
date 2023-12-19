using System;
using System.IO;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Azure.WebJobs;
using Microsoft.Azure.WebJobs.Extensions.Http;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;

namespace ContentBaseRoutingFunctionApp
{
   
    public class GetContentBaseRoutingValue
    {
        private readonly ILogger _logger;

        public GetContentBaseRoutingValue(ILoggerFactory loggerFactory)
        {
            _logger = loggerFactory.CreateLogger<GetContentBaseRoutingValue>();
        }

        [FunctionName("GetContentBaseRoutingValue")]
        public async Task<String> Run([HttpTrigger(AuthorizationLevel.Anonymous, "get", "post", Route = null)] HttpRequest req, ILogger logger)
        {
            _logger.LogInformation("C# HTTP trigger function GetContentBaseRoutingValue processed a request.");
            logger.LogInformation("Logger test");

            try
            {

                System.Diagnostics.Trace.WriteLine("This is my function logging from Diagnostics");
                _logger.LogInformation("This is my function logging from ILogger");

                string variableName = req.Query["RoutingValue"];
                string routingValue = Environment.GetEnvironmentVariable(variableName);

            return routingValue;
            }
            catch (Exception ex)
            {
                System.Diagnostics.Trace.WriteLine($"Error Diagnostics: {ex.Message}");
                _logger.LogError(ex.Message);
                return ex.ToString();
            }
        }
    }
}
