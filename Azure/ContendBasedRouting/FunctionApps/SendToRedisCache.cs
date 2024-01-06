using System;
using System.IO;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Azure.WebJobs;
using Microsoft.Azure.WebJobs.Extensions.Http;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;
using StackExchange.Redis;
using Newtonsoft.Json.Linq;

namespace function_ContentBasedRouting
{
    public static class SendToRedisCache
    {
        [FunctionName("SendToRedisCache")]
        public static async Task<IActionResult> Run(
            [HttpTrigger(AuthorizationLevel.Function, "get", "post", Route = null)] HttpRequest req, ILogger log)
        {
            log.LogInformation("C# HTTP trigger function processed a request.");


            string requestBody = await new StreamReader(req.Body).ReadToEndAsync();
            dynamic data = JsonConvert.DeserializeObject(requestBody);

            JObject jsonobject = JObject.Parse(requestBody);           //var employeeID = jsonobject.SelectToken("employee_id");
            var employeeID = jsonobject["employee_id"];

            string redisConnectionString = "MyRedisCaching.redis.cache.windows.net:6380,password=w5FqFOITBLxsZpftzrpLZlTTtKbRaFUBsAzCaMgnsQ0=,ssl=True,abortConnect=False";
            string key = employeeID.ToString();
            string input = data.ToString();

            try
            {
                ConnectionMultiplexer connection = ConnectionMultiplexer.Connect(redisConnectionString);
                IDatabase database = connection.GetDatabase();

                database.StringSet(key, input);

                log.LogInformation($"Data stored in Redis. Key: {key}, Value: ");   


                return new OkObjectResult($"Data stored in Redis. Key: {key}, Value: ");

            }
            catch (Exception ex) 
            {
                log.LogError($"Error: {ex.Message}");
                return new StatusCodeResult(StatusCodes.Status500InternalServerError);
            }
        }
    }
}
