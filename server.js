const http = require('http');
const fs = require('fs');


const server = http.createServer((req, res) => {
  res.setHeader('Content-Type', 'application/json')

  if (req.url == '/mealdata') {
    fs.readFile('./assets/json/meal.json', 'utf-8', (err, data) => {
      if (err) {
        console.log(err)
        res.statusCode = 500;
        res.end('Internal Server Error');
        return;
      }

      // try {
      //   const jsonData = JSON.parse(data)

      //   res.end(JSON.stringify(jsonData))
      // } catch (error) {
      //   console.log(error)
      //   res.statusCode = 500;
      //   res.end('Internal Server Error');
      // }
      res.end(data)
    })
  } else {
    res.statusCode = 404;
    res.end('404 Not Found');
  }


})

const port = 2214;
server.listen(port, () => {
  console.log(`server start on port ${port}`);
})