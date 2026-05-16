const express = require('express');
const { createProxyMiddleware } = require('http-proxy-middleware');

const app = express();

/*
  Dynmap proxy
*/

app.use(
  '/map',
  createProxyMiddleware({
    target: 'http://clasetercerob.falix.gg:8123',
    changeOrigin: true,
    ws: true
  })
);

/*
  Homepage
*/

app.get('/', (req, res) => {
  res.send('Dynmap proxy online');
});

const PORT = process.env.PORT || 3000;

app.listen(PORT, () => {
  console.log(`Listening on ${PORT}`);
});
