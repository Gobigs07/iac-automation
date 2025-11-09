const express = require('express');
const redis = require('redis');
const app = express();

const client = redis.createClient({ url: `redis://${process.env.REDIS_HOST}:6379` });
client.connect().catch(console.error);

app.get('/', async (req, res) => {
  let count = await client.incr('hits');
  res.send(`Hello from Sample App! Redis hit count: ${count}`);
});

app.listen(3003, () => console.log('App running on port 3000'));
