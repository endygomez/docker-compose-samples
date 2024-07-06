using Microsoft.AspNetCore.Mvc;
using StackExchange.Redis;

namespace Test.Controllers
{
  [ApiController]
  [Route("[controller]")]
  public class RedisController : ControllerBase
  {
    private readonly IConnectionMultiplexer _redis;

    public RedisController(IConnectionMultiplexer redis)
    {
      _redis = redis;
    }

    [HttpGet("{key}")]
    public async Task<IActionResult> GetValue(string key)
    {
      var db = _redis.GetDatabase();
      var value = await db.StringGetAsync(key);
      if (value.IsNullOrEmpty)
      {
        return NotFound();
      }

      return Ok(value.ToString());
    }

    [HttpPost]
    public async Task<IActionResult> SetValue([FromBody] KeyValuePair<string, string> keyValue)
    {
      var db = _redis.GetDatabase();
      await db.StringSetAsync(keyValue.Key, keyValue.Value);
      return Ok();
    }

  }
}
