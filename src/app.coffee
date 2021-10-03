Koa = require 'koa'
bodyparser = require 'koa-bodyparser'
json = require 'koa-json'
koaSwagger = require 'koa2-swagger-ui'
mongoose = require 'mongoose'
swagger = require './config/swagger'
appRouters = require './routes/router' # 路由
{ sysConfig, getMongoUrl, env } = require './config/config.default' # 配置

class App
  constructor: () ->
    console.log 'app初始化'
    @app = new Koa()
    @middleware()
    @swaggerInit()
    @routes()
    @mongo()
    @launchConf()

  middleware: () ->
    @app.use bodyparser({ enableTypes: ['json', 'form', 'text'] })
    @app.use json()

  swaggerInit: () ->
    @app.use swagger.routes(), swagger.allowedMethods()
    @app.use koaSwagger.koaSwagger({
        routePrefix: '/api-docs/swagger', # host at /swagger instead of default /docs
        swaggerOptions: {
          url: '/swagger.json' # example path to json 其实就是之后swagger-jsdoc生成的文档地址
        }
      })

  routes: () ->
    @app.use appRouters.routes(), appRouters.allowedMethods()
    @app.use appRouters.allowedMethods()

  mongo: () ->
    console.log getMongoUrl()
    mongoose.set('debug', env.DEBUG)
    mongoose.connect(getMongoUrl(), {
        useCreateIndex: true,
        poolSize: 5, # 连接池中维护的连接数
        useNewUrlParser: true,
        autoIndex: false,
        useUnifiedTopology: true
        # keepAlive: 120,
      })
      .then (open) ->
        console.log '📚  mongodb is launching...'
      .catch (err) ->
        console.error.bind console, "connection error:#{err}"

  launchConf: () ->
    console.log '===================================='
    console.log '🚀  Your awesome APP is launching...'
    console.log '===================================='

    # Start Express server.
    @app.listen(sysConfig.port, () =>

      console.log '===================================='
      console.log "✅  http://#{sysConfig.host}:#{sysConfig.port}"
      console.log "✅  http://#{sysConfig.host}:#{sysConfig.port}/api-docs/swagger"
      console.log "✅  Your awesome APP launched #{@app.env}"
      console.log '===================================='
    )

module.exports = new App().app
