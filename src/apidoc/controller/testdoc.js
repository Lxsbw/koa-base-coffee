/**
 * @swagger
 * /:
 *   get:
 *     summary: hello
 *     description: hello
 *     tags: [Default]
 *     deprecated: false
 *     responses:
 *       '200':
 *         description: OK
 */

/**
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
 */
