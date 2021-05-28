KoaRouter = require 'koa-router'

class AppRouter
  constructor: () ->
    @appRouter = new KoaRouter()
    @init()

  init: () ->
    @appRouter.get '/', (ctx, next) ->
      ctx.body = 'Hello, Koa CoffeeScript'

    @appRouter.post '/api/mobile-phone/create', (ctx, next) ->
      console.log 'controller : ', JSON.stringify ctx.request.body
      ctx.body = {
        model_name: ctx.request.body.model_name
        seria_number: ctx.request.body.seria_number
      }

appRouters = new AppRouter().appRouter

module.exports = appRouters
