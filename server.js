const express = require('express');
const { createProxyMiddleware } = require('http-proxy-middleware');

const app = express();

const SERVER = process.env.SERVER;

/*
  Dynmap proxy
*/

app.use(
  '/map',
  createProxyMiddleware({
    target: `http://${SERVER}:8123`,
    changeOrigin: true,
    ws: true
  })
);

app.get('/', (req, res) => {
  res.send('Dynmap proxy online');
});

const PORT = process.env.PORT || 3000;

app.listen(PORT, () => {
  console.log(`Listening on ${PORT}`);
});
