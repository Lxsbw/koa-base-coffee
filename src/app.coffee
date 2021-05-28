Koa = require 'koa'
bodyparser = require 'koa-bodyparser'
json = require 'koa-json'
appRouters = require './routes/router' # 路由
{ sysConfig } = require './config/config.default' # 配置
swagger = require './config/swagger'
koaSwagger = require 'koa2-swagger-ui'

class App
  constructor: () ->
    console.log 'app初始化'
    @app = new Koa()
    @middleware()
    @swaggerInit()
    @routes()
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
