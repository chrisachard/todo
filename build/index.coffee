require("coffee-script")
stitch  = require("stitch")
express = require("express")
argv    = process.argv.slice(2)

packagex = stitch.createPackage(
  # Specify the paths you want Stitch to automatically bundle up
  paths: [ __dirname + "/../web/app" ]

  # Specify your base libraries
  dependencies: [
    # __dirname + '/lib/jquery.js'
  ]
)
app = express.createServer()

app.configure ->
  app.set "views", __dirname + "/views"
  app.use app.router
  app.use express.static(__dirname + "/../web/public")
  app.get "/application.js", packagex.createServer()

port = argv[0] or process.env.PORT or 9294
console.log "Starting server on port: #{port}"
app.listen port
