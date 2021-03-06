var jsonServer = require('json-server')

var server = jsonServer.create()

// Set default middlewares
server.use(jsonServer.defaults())

var router = jsonServer.router('db.json')
server.use(router)

console.log('Listening at 4000')
server.listen(4000)
