from django.db import models
from rbac.models import UserInfo
from django.contrib.contenttypes.fields import GenericForeignKey, GenericRelation
from django.contrib.contenttypes.models import ContentType
from rbac.models import UserInfo
# Create your models here.

__all__ = [
    "Question",
    "Category",
    "Course",
    "CourseDetail",
    "DegreeCourse",
    "CourseChapter",
    "PricePolicy",
    "CourseSection",
    "Coupon",
    "CouponRecord",
    "Order",
    "OrderDetail",
    "TransactionRecord",

]

class Question(models.Model):
    """
    问题表
    """
    student = models.ForeignKey(verbose_name="学生", to=UserInfo,on_delete=models.CASCADE,related_name='ques_stu')
    teacher = models.ForeignKey(verbose_name="导师", to=UserInfo,on_delete=models.CASCADE,related_name='ques_tea')
    title=models.CharField(max_length=50, verbose_name='问题标题',null=True,blank=True)
    content = models.CharField(max_length=500, verbose_name='问题内容',null=True,blank=True)
    answer = models.CharField(max_length=500, verbose_name='回答内容',null=True,blank=True)
    question_status_choices = [
        (1, "未回答"),
        (2, "已回答"),
    ]
    question_status = models.IntegerField(verbose_name="问题回答状态", choices=question_status_choices, default=1)

    class Meta:
        verbose_name = "学生-问题表"
        db_table = verbose_name
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.title

class Category(models.Model):
    """课程分类表"""
    title = models.CharField(max_length=32, unique=True, verbose_name="课程的分类")

    def __str__(self):
        return self.title

    class Meta:
        verbose_name = "student-课程分类表"
        db_table = verbose_name
        verbose_name_plural = verbose_name


class Course(models.Model):
    """课程表"""
    title = models.CharField(max_length=128, unique=True, verbose_name="课程的名称")
    course_img = models.ImageField(upload_to="course/%Y-%m", verbose_name='课程的图片',null=True,blank=True)
    category = models.ForeignKey(to="Category", verbose_name="课程的分类", on_delete=models.CASCADE)

    COURSE_TYPE_CHOICES = ((0, "付费"), (1, "vip专享"), (2, "学位课程"))
    course_type = models.SmallIntegerField(choices=COURSE_TYPE_CHOICES)
    degree_course = models.ForeignKey(to="DegreeCourse", blank=True, null=True, help_text="如果是学位课程，必须关联学位表", on_delete=models.CASCADE)


    brief = models.CharField(verbose_name="课程简介", max_length=1024)

    status_choices = ((0, '上线'), (1, '下线'), (2, '预上线'))
    status = models.SmallIntegerField(choices=status_choices, default=0)
    pub_date = models.DateField(verbose_name="发布日期", blank=True, null=True)

    order = models.IntegerField("课程顺序", help_text="从上一个课程数字往后排")
    study_num = models.IntegerField(verbose_name="学习人数", help_text="只要有人买课程，订单表加入数据的同时给这个字段+1")

    # order_details = GenericRelation("OrderDetail", related_query_name="course")
    # coupon = GenericRelation("Coupon")
    # 只用于反向查询不生成字段
    price_policy = GenericRelation("PricePolicy")
    # often_ask_questions = GenericRelation("OftenAskedQuestion")
    # course_comments = GenericRelation("Comment")

    def save(self, *args, **kwargs):
        if self.course_type == 2:
            if not self.degree_course:
                raise ValueError("学位课必须关联学位课程表")
        super(Course, self).save(*args, **kwargs)

    def __str__(self):
        return self.title

    class Meta:
        verbose_name = "student-课程表"
        db_table = verbose_name
        verbose_name_plural = verbose_name

class CourseDetail(models.Model):
    """课程详细表"""
    course = models.OneToOneField(to="Course", on_delete=models.CASCADE)
    hours = models.IntegerField(verbose_name="课时", default=7)
    # course_slogan = models.CharField(max_length=125, blank=True, null=True, verbose_name="课程口号")
    video_brief_link = models.CharField(max_length=255, blank=True, null=True)
    summary = models.TextField(max_length=2048, verbose_name="课程概述")
    # why_study = models.TextField(verbose_name="为什么学习这门课程")
    # what_to_study_brief = models.TextField(verbose_name="我将学到哪些内容")
    # career_improvement = models.TextField(verbose_name="此项目如何有助于我的职业生涯")
    # prerequisite = models.TextField(verbose_name="课程先修要求", max_length=1024)
    recommend_courses = models.ManyToManyField("Course", related_name="recommend_by", blank=True) #推荐课程

    # teachers = models.ManyToManyField("Teacher", verbose_name="课程讲师")

    def __str__(self):
        return self.course.title

    class Meta:
        verbose_name = "student-课程详细表"
        db_table = verbose_name
        verbose_name_plural = verbose_name

class DegreeCourse(models.Model):
    """
    字段大体跟课程表相同，哪些不同根据业务逻辑去区分
    """
    title = models.CharField(max_length=32, verbose_name="学位课程名字")

    def __str__(self):
        return self.title

    class Meta:
        verbose_name = "student-学位课程表"
        db_table = verbose_name
        verbose_name_plural = verbose_name


class CourseChapter(models.Model):
    """课程章节表"""
    course = models.ForeignKey(to="Course", related_name="course_chapters", on_delete=models.CASCADE)
    chapter = models.SmallIntegerField(default=1, verbose_name="第几章")
    title = models.CharField(max_length=32, verbose_name="课程章节名称")

    def __str__(self):
        return '%s - %s'%(self.course.title,self.title)

    class Meta:
        verbose_name = "student-课程章节表"
        db_table = verbose_name
        verbose_name_plural = verbose_name
        unique_together = ("course", "chapter")

class PricePolicy(models.Model):
    """价格策略表"""
    content_type = models.ForeignKey(ContentType, on_delete=models.CASCADE)  # 关联course or degree_course
    object_id = models.PositiveIntegerField()
    content_object = GenericForeignKey('content_type', 'object_id')

    valid_period_choices = ((1, '1天'), (3, '3天'),
                            (7, '1周'), (14, '2周'),
                            (30, '1个月'),
                            (60, '2个月'),
                            (90, '3个月'),
                            (120, '4个月'),
                            (180, '6个月'), (210, '12个月'),
                            (540, '18个月'), (720, '24个月'),
                            (722, '24个月'), (723, '24个月'),
                            )
    valid_period = models.SmallIntegerField(choices=valid_period_choices)
    price = models.FloatField()

    def __str__(self):
        return "%s(%s)%s" % (self.content_object, self.get_valid_period_display(), self.price)

    class Meta:
        verbose_name = "student-价格策略表"
        db_table = verbose_name
        verbose_name_plural = verbose_name
        unique_together = ("content_type", 'object_id', "valid_period")

# class ShoppingCart(models.Model):
#     """
#     购物车
#     """
#
#     course = models.ManyToManyField(verbose_name='购物车课程',to='Course', related_name='cart_course')
#     user = models.ForeignKey(verbose_name='用户',to=UserInfo, on_delete=models.CASCADE,related_name='cart_user')
#     price_policy = models.IntegerField(verbose_name='选择的价格方案',null=True,blank=True)
#
#
#
#     class Meta:
#         verbose_name = "student-购物车表"
#         db_table = verbose_name
#         verbose_name_plural = verbose_name


class CourseSection(models.Model):
    """课时表"""
    chapter = models.ForeignKey(to="CourseChapter", related_name="course_sections", on_delete=models.CASCADE)
    title = models.CharField(max_length=32, verbose_name="课时")
    section_order = models.SmallIntegerField(verbose_name="课时排序", help_text="建议每个课时之间空1至2个值，以备后续插入课时")
    section_type_choices = ((0, '文档'), (1, '练习'), (2, '视频'))
    free_trail = models.BooleanField("是否可试看", default=False)
    section_type = models.SmallIntegerField(default=2, choices=section_type_choices)
    section_link = models.CharField(max_length=255, blank=True, null=True, help_text="若是video，填vid,若是文档，填link")

    def course_chapter(self):
        return self.chapter.chapter

    def course_name(self):
        return self.chapter.course.title

    def __str__(self):
        return "%s-%s" % (self.chapter, self.title)

    class Meta:
        verbose_name = "student-课程课时表"
        db_table = verbose_name
        verbose_name_plural = verbose_name
        unique_together = ('chapter', 'section_link')


class Coupon(models.Model):
    """优惠券生成规则"""
    name = models.CharField(max_length=64, verbose_name="活动名称")
    brief = models.TextField(blank=True, null=True, verbose_name="优惠券介绍")
    coupon_type_choices = ((0, '通用券'), (1, '满减券'), (2, '折扣券'))
    coupon_type = models.SmallIntegerField(choices=coupon_type_choices, default=0, verbose_name="券类型")

    money_equivalent_value = models.IntegerField(verbose_name="等值货币", null=True, blank=True, default=0)
    off_percent = models.PositiveSmallIntegerField("折扣百分比", help_text="只针对折扣券，例7.9折，写79", blank=True, null=True, default=100)
    minimum_consume = models.PositiveIntegerField("最低消费", default=0, help_text="仅在满减券时填写此字段", null=True, blank=True)

    content_type = models.ForeignKey(ContentType, blank=True, null=True, on_delete=models.CASCADE)
    object_id = models.PositiveIntegerField("绑定课程", blank=True, null=True, help_text="可以把优惠券跟课程绑定")
    # 不绑定代表全局优惠券
    content_object = GenericForeignKey('content_type', 'object_id')

    open_date = models.DateField("优惠券领取开始时间")
    close_date = models.DateField("优惠券领取结束时间")
    valid_begin_date = models.DateField(verbose_name="有效期开始时间", blank=True, null=True)
    valid_end_date = models.DateField(verbose_name="有效结束时间", blank=True, null=True)
    coupon_valid_days = models.PositiveIntegerField(verbose_name="优惠券有效期（天）", blank=True, null=True,
                                                    help_text="自券被领时开始算起")
    date = models.DateTimeField(auto_now_add=True)

    class Meta:
        verbose_name_plural = "student-优惠券生成规则记录"
        db_table = verbose_name_plural
        verbose_name = verbose_name_plural

    def __str__(self):
        return "%s(%s)" % (self.get_coupon_type_display(), self.name)

    def save(self, *args, **kwargs):
        if not self.coupon_valid_days or (self.valid_begin_date and self.valid_end_date):
            if self.valid_begin_date and self.valid_end_date:
                if self.valid_end_date <= self.valid_begin_date:
                    raise ValueError("valid_end_date 有效期结束日期必须晚于 valid_begin_date ")
            if self.coupon_valid_days == 0:
                raise ValueError("coupon_valid_days 有效期不能为0")
        if self.close_date < self.open_date:
            raise ValueError("close_date 优惠券领取结束时间必须晚于 open_date优惠券领取开始时间 ")

        super(Coupon, self).save(*args, **kwargs)


class CouponRecord(models.Model):
    """优惠券发放、消费纪录"""
    coupon = models.ForeignKey("Coupon", on_delete=models.CASCADE)
    number = models.CharField(max_length=64, unique=True, verbose_name="用户优惠券记录的流水号")
    account = models.ForeignKey(to=UserInfo, verbose_name="拥有者", on_delete=models.CASCADE)
    status_choices = ((0, '未使用'), (1, '已使用'), (2, '已过期'))
    status = models.SmallIntegerField(choices=status_choices, default=0)
    get_time = models.DateTimeField(verbose_name="领取时间", help_text="用户领取时间")
    used_time = models.DateTimeField(blank=True, null=True, verbose_name="使用时间")
    order = models.ForeignKey("Order", blank=True, null=True, verbose_name="关联订单", on_delete=models.CASCADE)  # 一个订单可以有多个优惠券

    class Meta:
        verbose_name_plural = "student-用户优惠券领取使用记录表"
        db_table = verbose_name_plural
        verbose_name = verbose_name_plural

    def __str__(self):
        return '%s-%s-%s' % (self.account, self.number, self.status)


class Order(models.Model):
    """订单"""
    payment_type_choices = ((0, '微信'), (1, '支付宝'), (2, '优惠码'), (3, '贝里'))
    payment_type = models.SmallIntegerField(choices=payment_type_choices)

    payment_number = models.CharField(max_length=128, verbose_name="支付第3方订单号", null=True, blank=True)
    order_number = models.CharField(max_length=128, verbose_name="订单号", unique=True)  # 考虑到订单合并支付的问题
    account = models.ForeignKey(to=UserInfo, on_delete=models.CASCADE)
    actual_amount = models.FloatField(verbose_name="实付金额")

    status_choices = ((0, '交易成功'), (1, '待支付'), (2, '退费申请中'), (3, '已退费'), (4, '主动取消'), (5, '超时取消'))
    status = models.SmallIntegerField(choices=status_choices, verbose_name="状态")
    date = models.DateTimeField(auto_now_add=True, verbose_name="订单生成时间")
    pay_time = models.DateTimeField(blank=True, null=True, verbose_name="付款时间")
    cancel_time = models.DateTimeField(blank=True, null=True, verbose_name="订单取消时间")

    class Meta:
        verbose_name_plural = "student-订单表"
        db_table = verbose_name_plural
        verbose_name = verbose_name_plural


    def __str__(self):
        return "%s" % self.order_number


class OrderDetail(models.Model):
    """订单详情"""
    order = models.ForeignKey("Order", on_delete=models.CASCADE)

    content_type = models.ForeignKey(ContentType, on_delete=models.CASCADE)  # 可关联普通课程或学位
    object_id = models.PositiveIntegerField()
    content_object = GenericForeignKey('content_type', 'object_id')

    original_price = models.FloatField("课程原价")
    price = models.FloatField("折后价格")
    valid_period_display = models.CharField("有效期显示", max_length=32)  # 在订单页显示
    valid_period = models.PositiveIntegerField("有效期(days)")  # 课程有效期
    memo = models.CharField(max_length=255, blank=True, null=True, verbose_name="备忘录")

    def __str__(self):
        return "%s - %s - %s" % (self.order, self.content_type, self.price)

    class Meta:
        verbose_name_plural = "student-订单详细"
        db_table = verbose_name_plural
        verbose_name = verbose_name_plural


class TransactionRecord(models.Model):
    """贝里交易纪录"""
    account = models.ForeignKey(to=UserInfo, on_delete=models.CASCADE)
    amount = models.FloatField("金额")
    balance = models.FloatField("账户余额")
    transaction_type_choices = ((0, '收入'), (1, '支出'), (2, '退款'), (3, "提现"))  # 2 为了处理 订单过期未支付时，锁定期贝里的回退
    transaction_type = models.SmallIntegerField(choices=transaction_type_choices)
    transaction_number = models.CharField(unique=True, verbose_name="流水号", max_length=128)
    date = models.DateTimeField(auto_now_add=True)
    memo = models.CharField(max_length=128, blank=True, null=True, verbose_name="备忘录")

    class Meta:
        verbose_name_plural = "student-贝里交易记录"
        db_table = verbose_name_plural
        verbose_name = verbose_name_plural

    def __str__(self):
        return "%s" % self.transaction_number


class StudyCourse(models.Model):


    account = models.ForeignKey(to=UserInfo, verbose_name="用户",on_delete=models.CASCADE)
    course = models.OneToOneField(verbose_name='购买学习的课程', to='Course', on_delete=models.CASCADE)

    def homework(self):
        return self.course.course_chapters.homework_set.all()

    class Meta:
        verbose_name_plural = "student-购买的课程记录"
        db_table = verbose_name_plural
        verbose_name = verbose_name_plural
        unique_together = ("course", "account")