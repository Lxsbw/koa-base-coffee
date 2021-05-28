'use strict';

/**
 * @swagger
 * definitions:
 *   MobilePhone:
 *     type: "object"
 *     required:
 *     - "model_name"
 *     - "size"
 *     - "spec"
 *     properties:
 *       model_name:
 *         type: "string"
 *         description: "手机型号"
 *         example: "xx"
 *       size:
 *         type: "string"
 *         description: "尺寸"
 *         example: "4.7"
 *       spec:
 *         type: "string"
 *         description: "规格"
 *         example: "black"
 *       ram:
 *         type: "integer"
 *         format: "int32"
 *         description: "内存"
 *         example: 4
 *       rom:
 *         type: "integer"
 *         format: "int32"
 *         description: "空间"
 *         example: 64
 *       seria_number:
 *         type: "string"
 *         description: "序列号"
 *         example: "00010"
 *     xml:
 *       name: "MobilePhone"
 */