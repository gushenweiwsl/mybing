请点击此窗口右上方的"Open preview"以获得更好的阅读体验。

>此repl仅针对[zhayujie/bot-on-anything](https://github.com/zhayujie/bot-on-anything)项目的bing接入QQ功能如何在replit中运行进行探讨，若有其他问题，请直接去原项目内发issue，并且请给原项目点一下star，谢谢。

讨论群：[738386033](https://jq.qq.com/?_wv=1027&k=qssjFvAs)

群内提供了公用保活措施


# 相关链接

>机器人项目地址：[zhayujie/bot-on-anything](https://github.com/zhayujie/bot-on-anything)

>go-cqhttp文档：[go-cqhttp 帮助中心](https://docs.go-cqhttp.org/)

>逆向接入bing：[acheong08/EdgeGPT](https://github.com/acheong08/EdgeGPT)

>
>Edge浏览器专用的抓取ck的插件：[Cookie Editor](https://microsoftedge.microsoft.com/addons/detail/cookie-editor/ajfboaconbpkglpfanbmlfgojgndmhmc)


# 更新日志
>05/12/2023
>
>更新源码分支为[saika2077/bot-on-anything](https://github.com/saika2077/bot-on-anything/tree/dev-qq),新增绘图功能，前缀为`#绘画：`。且修复了群聊图片生成失败消息刷屏的bug。

>05/08/2023
>
>更新源码，对EdgeGPT-0.3.5进行适配，并增加切换模型的功能。`#creative`切换至创造力模式，`#balanced`切换至平衡模式，`#precise`切换至精确模式。

>05/04/2023
>
>更新源码分支为[abwuge/bot-on-anything](https://github.com/abwuge/bot-on-anything),解决了无法正常返回消息至bing的问题，并对EdgeGPT-0.3.2进行适配。


# 使用步骤 

首先请详细阅读以上给出的所有相关项目的文档以及issue，以便于理解后续操作。

## 配置QQ登录文件

把左侧Files中的`config.yml`下载到本地，并与本地的go-cqhttp放置于同一目录，然后使用记事本编辑`config.yml`，填入你的账号和密码，在本地使用go-cqhttp登录，并修改`device.json`中的`protocol`字段，也就是设备类型，我比较推荐MacOS / Android Watch。

登录成功后，把获取到的`device.json`以及`session.token`还有`config.yml`文件上传到左侧Files内并覆盖。

## 配置Bing Chat的Cookies

获取你的Bing Chat聊天页面的Cookies，然后在左侧Files中找到*config.json*，把`[填写你的cookies]`字样替换成你的Cookies。（CK的有效期只有两周左右，失效后需要重新抓取）

>以下是用Edge浏览器抓取CK的详细步骤：
>
>用Edge浏览器安装*README*最初提供的Edge浏览器专用的抓取CK的插件，然后打开[New Bing](https://www.bing.com/new)，点击立即聊天，并聊一句，确定的确可以使用。
>
>点击插件的图标，点击标注为**Export**的按钮，然后打开[JSON Minify](https://jsonformatter.org/json-minify)，粘贴到左边，并点一下**Minify JSON**按钮，并在右上角点击**Copy to Clipboard**按钮，即把CK复制到剪切板。
>
>![](/pic/ck_sample.png)
>
>如果需要使用绘图功能，需要对CK内容进行删改，观察可知，在`[]`中的每一个`{}`里的内容格式都是一样的，我们需要注意其中的`"name": "xxx",`字段，从上往下翻，找到第一个`"name": "_U",`，然后把这个`{}`之前的所有`{}`及其内容全部删除。即使得`name`为`_U`的`{}`为第一个即可。后面的不不用删除。

当你把CK粘贴到*config.json*的时候，切记注意格式，CK是一个`[]`包裹着一大堆`{}`，一般来讲注意开头和结尾的格式即可，请务必检查自己的CK粘贴之后是否有且只有一个`[]`。

## 安装依赖

在右侧shell窗口内执行（执行的意思是：**一条一条复制粘贴到shell窗口内并按回车**）以下代码：

``` bash
chmod +x run.sh
```
``` bash
chmod +x go-cqhttp
```
``` bash
pip install -i https://pypi.tuna.tsinghua.edu.cn/simple EdgeGPT==0.3.8
```
``` bash
pip install aiocqhttp
```

## 运行

点击最上方的绿色按钮 Run 即可。
>这个是QQ机器人程序，不是网页，webview网页显示任何东西都不会影响机器人，请不要在意。

# 项目保活

Replit是托管在Google Cloud上的在线代码托管平台，他能解决你没有服务器/电脑挂载程序，以及IP地址无法访问墙外服务的问题。这也是我选择在Replit部署的原因。但是Replit平台的每个Repl在一段时间之内不被访问就会休眠，所以如果你想要他能够持续的运行，就必须配置保活。

推荐使用[louislam/uptime-kuma](https://github.com/louislam/uptime-kuma)，你可以在自己的服务器或者Windows电脑的Docker Desktop中使用，检测地址就是自己的项目运行之后右上角webview窗口中的地址，检测状态代码200即可。

如果没有能挂载docker的机器，也可以把webview窗口中的地址保存在手机、电脑等其他可联网设备内，定期访问此地址，以使得容器存活。

此外，还有一些可供开放注册使用的网站监控平台，注册即用，也能用于Replit容器的保活：
>1 [cron-job.org](https://console.cron-job.org)
>
>2 [UptimeRobot](https://uptimerobot.com/) 

挂了保活之后可以在左侧Files内找到`run.sh`这个文件,内置了自动清理和重启的功能，请务必在挂好保活之后再取消注释自动清理和重启的功能块。