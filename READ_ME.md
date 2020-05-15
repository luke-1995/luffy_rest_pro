# 程序开发环境
* django (3.0.3)
# 程序实现功能
1.  通过api接口将处理好的数据返回给前端
2.  对用户进行登录认证和权限初始化
3.  对登录用户进行权限验证
4.  对购物车,结算中心,以及支付验证进行单元测试
# 程序的启动方式
1. 安装模块,打开命令行窗口,输入python3 pip install django==3.0.3
2. 确保数据库中有一个名叫'luffy'的数据库,以及在好相关的配置,具体配置请查看项目的根目录的settings文件
3. 打开命令行窗口，进去之后，首先切换到含有manage.py文件的路径下面，然后输入“python manage.py makemigrations”,按回车键，加载完成后,再输入'python manage.py migrate',按回车键,完成数据库迁移
4. 接着输入python3 manage.py runserver,启动服务
5. 打开redis服务端,端口和ip都是默认
# 单元测试
1. 进入单元测试的文件路径,路径是./test_api/
2. 在测试前初始化数据,命令行窗口输入:python init_data.py
3. 测试可以开始前请确保启动Django服务和redis服务
4. 测试开始,命令行窗口输入:pytest -s -v
# 登录用户信息
* 需要用户登录用户名和密码进行验证
* 超级用户(用户名:alex,密码:alex1234,角色:超级管理员)
* 超级用户(用户名:a,密码123,角色:超级管理员,普通管理员,学生,讲师)
* 普通用户(用户名:b,密码123,角色:讲师)
* 普通用户(用户名:c,密码123,角色:普通管理员)
* 普通用户(用户名:d,密码123,角色:讲师)
* 普通用户(用户名:f,密码123,角色:学生)
# 程序的运行效果

## 1 管理员平台功能

### 1.1 查看用户注册趋势图、订单量报表

![Image text](https://m.qpic.cn/psc?/V13PfEOv2p5n1X/N6ix9ropXhYRy3eob.4Aq8xZ9kCSZyZdvCDP85vto3r36mrOX.NsEwasKcEcqvVOGb*uw8ZNgxOZIyhEy5o.cQ!!/b&bo=3wX6AAAAAAADBwI!&rf=viewer_4)


### 1.2 课程管理
![Image text](https://m.qpic.cn/psc?/V13PfEOv2p5n1X/N6ix9ropXhYRy3eob.4Aq2dYFZu7Q.P.tGMyAeZAXUR9hpFA8hKmSt15ln*gEUJjJ7vjHKfTRRONo9GTR8HZ9w!!/b&bo=0AUHAQAAAAADB*E!&rf=viewer_4)


### 1.3 为学员分配导师

![Image text](https://m.qpic.cn/psc?/V13PfEOv2p5n1X/N6ix9ropXhYRy3eob.4Aq*EXJBY8gbI3XMeEVhZqDTMbHHCF5d5aXacbcYQcyyUfrQ3G53ZxGSwymXczV1*Bpg!!/b&bo=2gVlAQAAAAADB5k!&rf=viewer_4)



### 1.4 创建、管理资讯文章

![Image text](https://m.qpic.cn/psc?/V13PfEOv2p5n1X/N6ix9ropXhYRy3eob.4AqyDZ5KM5uaFGCof0oKSF.Q*iBJ*3kEJ0hWnAyw1o*wK.K2XhhoFhWpwkBXmG8mB3qQ!!/b&bo=0AWfAAAAAAADB2g!&rf=viewer_4)



### 1.5 追踪学员学习进度

![Image text](https://m.qpic.cn/psc?/V13PfEOv2p5n1X/N6ix9ropXhYRy3eob.4Aq96gTRG0tch1qvnDIb3VlS.fC9uym4ExJImNUEP1bpa9tVXExHEPuFjAQvmraRL9og!!/b&bo=1gXIAAAAAAADBzk!&rf=viewer_4)



### 1.6 导师跟进管理

![Image text](https://m.qpic.cn/psc?/V13PfEOv2p5n1X/N6ix9ropXhYRy3eob.4Aq8xnfslgbD6KP231VxhW7RrLuPqw1nC2XUGu7.vpZD6WuP*MdY0wTavURAYYlAyEvA!!/b&bo=2QVkAQAAAAADB5s!&rf=viewer_4)


### 1.7 订单管理

![Image text](https://m.qpic.cn/psc?/V13PfEOv2p5n1X/N6ix9ropXhYRy3eob.4Aqy67P9KhaT41tel5r9wE76g4DSZQVWAQeux2JWj8ysdGKOVZ7fDCCdpL4H.*3825dA!!/b&bo=2wW5AAAAAAADB0U!&rf=viewer_4)


## 2 导师平台功能

### 2.1 对学员进行跟进

![Image text](https://m.qpic.cn/psc?/V13PfEOv2p5n1X/N6ix9ropXhYRy3eob.4Aq0MGsOL0qEQ.PMwImjEUaTJHg.cMs*n0RccXCPwsmc*wzpKIu.oE94EElxe8PK6x5g!!/b&bo=5AXVAAAAAAADBxY!&rf=viewer_4)

### 2.2 上传批改作业过程

![Image text](https://m.qpic.cn/psc?/V13PfEOv2p5n1X/N6ix9ropXhYRy3eob.4Aq7BLNT4KzHYjNdS42PFRT5ysH*MyTSZna.vjIdQ2eozQirAH8QmZ5RLv..vOU8Yx3w!!/b&bo=3QUMAQAAAAADB*c!&rf=viewer_4)

### 2.3 回复学员问题

![Image text](https://m.qpic.cn/psc?/V13PfEOv2p5n1X/N6ix9ropXhYRy3eob.4AqxzTVOQq5Gi69qNR2Zi3JkmAziAsQbxbve4LkHBPkNI*mhG2x9iOdbtNummlIdBsvQ!!/b&bo=3gX0AAAAAAADBw0!&rf=viewer_4)


## 3 学生平台功能

### 3.1 注册

![Image text](https://m.qpic.cn/psc?/V13PfEOv2p5n1X/N6ix9ropXhYRy3eob.4Aq2Kc5rynX59k9pKXx*UerP08Z4QNPknfoLgQhZVCSxS8YBiCmo2hGNbiJSpuouVG1A!!/b&bo=uwXqAAAAAAADB3Y!&rf=viewer_4)

### 3.2 登录

![Image text](https://m.qpic.cn/psc?/V13PfEOv2p5n1X/N6ix9ropXhYRy3eob.4Aq31HVgraq9OpbXkZ9OR2r.3DV7AqLblw9JtBnbdY.WwDpgsD6W2zbJczTOzFMClR6Q!!/b&bo=1QXIAAAAAAADBzo!&rf=viewer_4)

### 3.3 加入购物车

![Image text](https://m.qpic.cn/psc?/V13PfEOv2p5n1X/N6ix9ropXhYRy3eob.4Aq5uqRMMP*MZ4785*EIPVwDC6IB5AZ2ed6rFqMhvb4W2dQ5v*9qD2fTh27.dEMS5Zmw!!/b&bo=2gWbAQAAAAADB2c!&rf=viewer_4)

### 3.4 加入结算中心

![Image text](https://m.qpic.cn/psc?/V13PfEOv2p5n1X/N6ix9ropXhYRy3eob.4Aq7mzXBwd5KbmH6eYCUARJiP*8vWBO3..ApoNaFfastitOOa3twR9eMga7UhBQF7FGw!!/b&bo=3QXJAgAAAAADBzE!&rf=viewer_4)

### 3.5 购买

![Image text](https://m.qpic.cn/psc?/V13PfEOv2p5n1X/N6ix9ropXhYRy3eob.4Aq5ZIx6q0DFCG2xA1jr9UHxGqbLg3sRf5xSjcq.06MDSUw5gBEaXQ8Lvt26n9yMbnPw!!/b&bo=1wWUAQAAAAADB2U!&rf=viewer_4)


### 3.6 在线视频播放

![Image text](https://m.qpic.cn/psc?/V13PfEOv2p5n1X/N6ix9ropXhYRy3eob.4Aq84APepomu8XzV1NgsOHJejigfp6POgloFkwRMtnMwfWnjYREs36YawdCix4hz6D7w!!/b&bo=2wUdAQAAAAADB.A!&rf=viewer_4)

### 3.7 评价(需要有成绩)

![Image text](https://m.qpic.cn/psc?/V13PfEOv2p5n1X/N6ix9ropXhYRy3eob.4AqyEWrGvRyU0jJ*0XcqYPl0KXchrdombmOp8a6yqEwR3UpL8MJHLSMThzh46LMbyKfg!!/b&bo=2AX.AAAAAAADBwE!&rf=viewer_4)

### 3.8 提问题

![Image text](https://m.qpic.cn/psc?/V13PfEOv2p5n1X/N6ix9ropXhYRy3eob.4Aq*d*G0qyxvfvqJUGIovop6YTzICrQ9jgwsLRur58rt3oqpx*U0IuyIPxtyvyIr.Zvg!!/b&bo=3QUbAQAAAAADB.A!&rf=viewer_4)

### 3.9 交作业

![Image text](https://m.qpic.cn/psc?/V13PfEOv2p5n1X/N6ix9ropXhYRy3eob.4Aq8GX7GLf78k2xI*WYHy4n0uM3IKE4UuuB.duaeQ9ZbteVnFzRfrGV.ef2NXh5ybuXA!!/b&bo=4QXUAAAAAAADBxI!&rf=viewer_4)





