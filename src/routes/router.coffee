# KoaRouter = require 'koa-router'
import KoaRouter from 'koa-router'
# MobilePhone = require '../controller/mobile-phone'
import MobilePhone from '../controller/mobile-phone'

class AppRouter
  constructor: () ->
    @appRouter = new KoaRouter()
    @init()

  init: () ->
    @appRouter.get '/api/mobile-phone/findone/:_id', MobilePhone.findOne
    @appRouter.get '/api/mobile-phone/findall', MobilePhone.findall
    @appRouter.post '/api/mobile-phone/create', MobilePhone.create
    @appRouter.put '/api/mobile-phone/update', MobilePhone.update
    @appRouter.patch '/api/mobile-phone/patch', MobilePhone.updateByPatch
    @appRouter.delete '/api/mobile-phone/delete', MobilePhone.delete

    @appRouter.get '/', (ctx, next) ->
      ctx.body = 'Hello Koa2 CoffeeScript!'

appRouters = new AppRouter().appRouter

# module.exports = appRouters
export default appRouters
