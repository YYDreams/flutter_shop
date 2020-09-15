纪要
<!-- 9.14 -->
- 通过node模拟网络请求数据

打开终端

<!-- 查看是否安装了 node -->
 node -v

<!-- 切换到指定目录 -->
 cd /Users/hua-cloud/Desktop/Flutter/github/flutter_shop/flutter_shop/node_shop_server
 <!--添加依赖库 -->
npm install
<!-- 启动服务 -->
npm start

<!-- 9.15 -->
Flutter中为了节约内存不会保持widget的状态，widget都是临时变量。当我们使用TabBar,切换tab后再重新切换回上一个页面，这时候tab会重新加载重新创建，体验很不友好。
