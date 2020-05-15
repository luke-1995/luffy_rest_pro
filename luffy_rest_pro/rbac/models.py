from django.db import models


__all__ = ["Permission", "Role", "UserInfo", "FirstMenu","ApiPermission"]


class Permission(models.Model):
    '''
    权限表
    '''
    id = models.AutoField(primary_key=True)
    title = models.CharField(verbose_name='标题', max_length=32, null=True, blank=True)
    path = models.CharField(verbose_name='含正则的URL', max_length=128, null=True, blank=True)
    name = models.CharField(verbose_name='路由别名', max_length=32, null=True, blank=True)
    firstmenu = models.ForeignKey(verbose_name='一级菜单', to='FirstMenu', on_delete=models.CASCADE, null=True, blank=True)
    component = models.CharField(verbose_name='组件位置', max_length=32,null=True,blank=True)
    hidden = models.BooleanField(verbose_name='侧边栏是否隐藏',default=False)
    parent_permission = models.ForeignKey('self', null=True, blank=True, on_delete=models.CASCADE)



    def __str__(self):
        return self.title

    class Meta:
        verbose_name = "rbac-权限表"
        db_table = verbose_name
        verbose_name_plural = verbose_name

class ApiPermission(models.Model):
    '''
    api权限表,后端
    '''
    id = models.AutoField(primary_key=True)
    title = models.CharField(verbose_name='标题', max_length=32, null=True, blank=True)
    url = models.CharField(verbose_name='含正则的URL', max_length=128, null=True, blank=True)
    # name = models.CharField(verbose_name='权限标识', max_length=32, null=True, blank=True)
    # method = models.CharField(verbose_name='请求方式', max_length=32, null=True, blank=True)
    permission = models.ForeignKey(to='Permission', null=True, blank=True, on_delete=models.CASCADE)
    method_choices = [
        (1, "GET"),
        (2, "POST"),
        (3, "PUT"),
        (4, "PATCH"),
        (5, "DELETE"),
    ]
    method = models.IntegerField(verbose_name="请求方式", choices=method_choices,default=1)


    def __str__(self):
        return self.title

    class Meta:
        verbose_name = "rbac-api权限表"
        db_table = verbose_name
        verbose_name_plural = verbose_name



class FirstMenu(models.Model):
    '''
    一级菜单
    '''
    id = models.AutoField(primary_key=True)
    title = models.CharField(verbose_name='一级菜单', max_length=32, unique=True)
    component = models.CharField(verbose_name='组件名称', max_length=32,null=True,blank=True)
    path = models.CharField(verbose_name='含正则的URL', max_length=128, null=True, blank=True)
    redirect= models.CharField(verbose_name='重定向的URL', max_length=128, null=True, blank=True)
    # icon = models.ForeignKey(verbose_name='图标', to='Icon', on_delete=models.CASCADE,null=True,blank=True)

    def __str__(self):
        return self.title

    class Meta:
        verbose_name = "rbac-一级菜单表"
        db_table = verbose_name
        verbose_name_plural = verbose_name


class Role(models.Model):
    '''
    角色表
    '''
    id = models.AutoField(primary_key=True)
    title = models.CharField(verbose_name='角色名称', max_length=32, )
    permissions = models.ManyToManyField(verbose_name='所拥有的的权限', to='Permission')
    api_permissions = models.ManyToManyField(verbose_name='api权限', to='ApiPermission')

    def __str__(self):
        return self.title

    class Meta:
        verbose_name = "rbac-角色表"
        db_table = verbose_name
        verbose_name_plural = verbose_name


class UserInfo(models.Model):
    '''
    用户表
    '''
    id = models.AutoField(primary_key=True)
    username = models.CharField(verbose_name='用户名', max_length=50, unique=True)
    password = models.CharField(verbose_name='密码', max_length=64, null=True, blank=True)
    roles = models.ManyToManyField(verbose_name='出任的角色', to=Role, )
    shop_cart_num = models.CharField(verbose_name='购物车商品数目', max_length=32, default=0)
    balance = models.FloatField(verbose_name="贝里余额", default=0)
    learning_progress = models.CharField(verbose_name='学习进度', max_length=50, null=True,blank=True)
    date = models.DateTimeField(auto_now_add=True, verbose_name="创建时间")
    teacher = models.ForeignKey('self', null=True, blank=True, on_delete=models.CASCADE)


    # 去掉引号,否则继承后,会找不到role,同时role类要写在前面

    def __str__(self):
        return self.username

    class Meta:
        verbose_name = "rbac-用户表"
        db_table = verbose_name
        verbose_name_plural = verbose_name

# class Icon(models.Model):
#     '''
#     图标表
#     '''
#     id = models.AutoField(primary_key=True)
#     title = models.CharField(max_length=32)
#     content = models.CharField(verbose_name='图标', max_length=200, )
#
#     def __str__(self):
#         return self.content
