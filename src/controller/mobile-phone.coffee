BaseController = require '../handle/base-controller'
MobilePhoneService = require '../service/mobile-phone'

class MobilePhoneController extends BaseController
  ###
   * @swagger
   * /:
   *   options:
   *     summary: Method OPTIONS
   *     description: OPTIONS
   *     tags: [Home]
   *     deprecated: false
   *     responses:
   *       '200':
   *         description: OK
  ###

  ###
   * @swagger
   * /:
   *   head:
   *     summary: Method HEAD
   *     description: HEAD
   *     tags: [Home]
   *     deprecated: false
   *     responses:
   *       '200':
   *         description: OK
  ###

  ###
   * @swagger
   * /api/mobile-phone/findone/{_id}:
   *   get:
   *     summary: id查找
   *     description: id查找
   *     tags: [MobilePhone]
   *     deprecated: false
   *     parameters:
   *     - in: "path"
   *       name: "_id"
   *       type: "string"
   *       required: true
   *       description: "id"
   *     responses:
   *       '200':
   *         description: OK
  ###
  findOne: (ctx, next) ->
    console.log('controller : ', JSON.stringify(ctx.params))
    ctx.body = await MobilePhoneService.findOne { _id: ctx.params._id }

  ###
   * @swagger
   * /api/mobile-phone/findall:
   *   get:
   *     summary: 查找
   *     description: 查找
   *     tags: [MobilePhone]
   *     parameters:
   *     - in: "query"
   *       name: "_id"
   *       type: "string"
   *       description: "id"
   *     - in: "query"
   *       name: "model_name"
   *       type: "string"
   *       description: "手机型号"
   *     responses:
   *       '200':
   *         description: OK
  ###
  findall: (ctx, next) ->
    ctx.body = await MobilePhoneService.find({
      _id: ctx.query._id,
      model_name: ctx.query.model_name
    })

  ###
   * @swagger
   * /api/mobile-phone/create: # 接口地址
   *   post: # 请求体
   *     summary: 添加手机
   *     description: 添加手机 # 接口信息
   *     tags: [MobilePhone] # 模块名称
   *     parameters: # 请求参数
   *     - in: "body"
   *       name: "MobilePhone"
   *       description: "手机信息"
   *       required: true
   *       schema:
   *         $ref: "#/definitions/MobilePhone"
   *     responses:
   *       '200':
   *         description: OK
  ###
  create: (ctx, next) ->
    console.log('controller : ', JSON.stringify(ctx.request.body))
    ctx.body = await MobilePhoneService.create ctx.request.body

  ###
   * @swagger
   * /api/mobile-phone/update:
   *   put:
   *     summary: 更新手机
   *     description: 更新手机
   *     tags: [MobilePhone]
   *     parameters:
   *     - in: "body"
   *       name: "MobilePhoneUpd"
   *       description: "手机信息"
   *       required: true
   *       schema:
   *         $ref: "#/definitions/MobilePhoneUpd"
   *     responses:
   *       '200':
   *         description: OK
  ###
  update: (ctx, next) ->
    console.log('controller : ', JSON.stringify(ctx.request.body))
    ctx.body = await MobilePhoneService.update ctx.request.body

  ###
   * @swagger
   * /api/mobile-phone/patch:
   *   patch:
   *     summary: 更新手机
   *     description: 更新手机
   *     tags: [MobilePhone]
   *     parameters:
   *     - in: "body"
   *       name: "MobilePhoneUpdPatch"
   *       description: "手机信息"
   *       required: true
   *       schema:
   *         $ref: "#/definitions/MobilePhoneUpdPatch"
   *     responses:
   *       '200':
   *         description: OK
  ###
  updateByPatch: (ctx, next) ->
    console.log('controller : ', JSON.stringify(ctx.request.body))
    ctx.body = await MobilePhoneService.update ctx.request.body

  ###
   * @swagger
   * /api/mobile-phone/delete:
   *   delete:
   *     summary: 删除手机
   *     description: 删除手机
   *     tags: [MobilePhone]
   *     parameters:
   *     - in: "body"
   *       name: "MobilePhoneDel"
   *       description: "手机id"
   *       required: true
   *       schema:
   *         $ref: "#/definitions/MobilePhoneDel"
   *     responses:
   *       '200':
   *         description: OK
  ###
  delete: (ctx, next) ->
    console.log('controller : ', JSON.stringify(ctx.request.body))
    ctx.body = await MobilePhoneService.delete ctx.request.body

module.exports = new MobilePhoneController()
