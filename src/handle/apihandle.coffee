fs = require 'fs'
path = require 'path'
{ getApiPath } = require '../config/config.default' # 配置

## 方法作用
## 将编译后的js文件 -> 生成的注释/*替换成/**，即能解析成swagger document
apiHandle = () ->

  paths = getApiPath()

  for ph in paths
    filePath = path.resolve(ph)
    files = fs.readdirSync(filePath)

    for file in files
      localdir = path.join(filePath, file)

      jsfile = fs.readFileSync(localdir, 'utf8')
      # 将/*替换成/**
      jsfile = jsfile.replace(new RegExp('\\/\\*', 'g'), '/**')

      fs.writeFileSync(localdir, jsfile, 'utf8')

apiHandle()
