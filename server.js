const express = require('express');
const app = express();
const port = 8080;

app.get('/', (req, res) => {
  res.json({
    status: 'success',
    message: 'Modernization backend is running locally!',
    environment: 'development'
  });
});

app.listen(port, () => {
  console.log(`Backend server listening at http://localhost:${port}`);
});
