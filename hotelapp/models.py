from django.db import models

# Create your models here.
class Accommodation(models.Model):
    顾客id = models.ForeignKey('Client', models.DO_NOTHING, db_column='顾客id')
    客房编号 = models.ForeignKey('Room', models.DO_NOTHING, db_column='客房编号')
    入住时间 = models.CharField(max_length=45, blank=True, null=True)
    id = models.IntegerField(primary_key=True)
    def __str__(self):
        return "客房订单管理"
    class Meta:
        verbose_name = "客房订单管理"
        verbose_name_plural = verbose_name
        db_table = 'accommodation'


#
#
# class AuthGroup(models.Model):
#     name = models.CharField(unique=True, max_length=80)
#
#     class Meta:
#         db_table = 'auth_group'
#
#
# class AuthGroupPermissions(models.Model):
#     group = models.ForeignKey(AuthGroup, models.DO_NOTHING)
#     permission = models.ForeignKey('AuthPermission', models.DO_NOTHING)
#
#     class Meta:
#         db_table = 'auth_group_permissions'
#         unique_together = (('group', 'permission'),)
#
#
# class AuthPermission(models.Model):
#     name = models.CharField(max_length=255)
#     content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING)
#     codename = models.CharField(max_length=100)
#
#     class Meta:
#         db_table = 'auth_permission'
#         unique_together = (('content_type', 'codename'),)
#
#
# class AuthUser(models.Model):
#     password = models.CharField(max_length=128)
#     last_login = models.DateTimeField(blank=True, null=True)
#     is_superuser = models.IntegerField()
#     username = models.CharField(unique=True, max_length=150)
#     first_name = models.CharField(max_length=30)
#     last_name = models.CharField(max_length=150)
#     email = models.CharField(max_length=254)
#     is_staff = models.IntegerField()
#     is_active = models.IntegerField()
#     date_joined = models.DateTimeField()
#
#     class Meta:
#         db_table = 'auth_user'
#
#
# class AuthUserGroups(models.Model):
#     user = models.ForeignKey(AuthUser, models.DO_NOTHING)
#     group = models.ForeignKey(AuthGroup, models.DO_NOTHING)
#
#     class Meta:
#         db_table = 'auth_user_groups'
#         unique_together = (('user', 'group'),)
#
#
# class AuthUserUserPermissions(models.Model):
#     user = models.ForeignKey(AuthUser, models.DO_NOTHING)
#     permission = models.ForeignKey(AuthPermission, models.DO_NOTHING)
#
#     class Meta:
#         db_table = 'auth_user_user_permissions'
#         unique_together = (('user', 'permission'),)


class Client(models.Model):
    顾客id = models.AutoField(primary_key=True)
    姓名 = models.CharField(max_length=45, blank=True, null=True)
    身份证号 = models.CharField(max_length=45, blank=True, null=True)
    def __str__(self):
        return self.姓名
    class Meta:
        verbose_name = "顾客管理"
        verbose_name_plural = verbose_name
        db_table = 'client'


# class DjangoAdminLog(models.Model):
#     action_time = models.DateTimeField()
#     object_id = models.TextField(blank=True, null=True)
#     object_repr = models.CharField(max_length=200)
#     action_flag = models.PositiveSmallIntegerField()
#     change_message = models.TextField()
#     content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING, blank=True, null=True)
#     user = models.ForeignKey(AuthUser, models.DO_NOTHING)
#
#     class Meta:
#         db_table = 'django_admin_log'
#
#
# class DjangoContentType(models.Model):
#     app_label = models.CharField(max_length=100)
#     model = models.CharField(max_length=100)
#
#     class Meta:
#         db_table = 'django_content_type'
#         unique_together = (('app_label', 'model'),)
#
#
# class DjangoMigrations(models.Model):
#     app = models.CharField(max_length=255)
#     name = models.CharField(max_length=255)
#     applied = models.DateTimeField()
#
#     class Meta:
#         db_table = 'django_migrations'
#
#
# class DjangoSession(models.Model):
#     session_key = models.CharField(primary_key=True, max_length=40)
#     session_data = models.TextField()
#     expire_date = models.DateTimeField()
#
#     class Meta:
#         db_table = 'django_session'


class Food(models.Model):
    菜品编号 = models.IntegerField(primary_key=True)
    菜名 = models.CharField(max_length=45)
    价格 = models.CharField(max_length=45)
    厨师id = models.ForeignKey('Staff', models.DO_NOTHING, db_column='厨师id')
    def __str__(self):
        return self.菜名
    class Meta:
        verbose_name = "餐厅管理"
        verbose_name_plural = verbose_name
        db_table = 'food'


class Order(models.Model):
    顾客编号 = models.ForeignKey(Client, models.DO_NOTHING, db_column='顾客编号')
    菜品编号 = models.ForeignKey(Food, models.DO_NOTHING, db_column='菜品编号')
    服务员编号 = models.ForeignKey('Staff', models.DO_NOTHING, db_column='服务员编号')
    桌号 = models.IntegerField()
    id = models.IntegerField(primary_key=True)

    class Meta:
        verbose_name = "餐厅订单管理"
        verbose_name_plural = verbose_name
        db_table = 'order'


class Park(models.Model):
    车位编号 = models.IntegerField(primary_key=True)
    当前状态 = models.CharField(max_length=45)
    车辆牌号 = models.CharField(max_length=45, blank=True, null=True)

    class Meta:
        verbose_name = "停车场管理"
        verbose_name_plural = verbose_name
        db_table = 'park'


class Room(models.Model):
    房间号 = models.IntegerField(primary_key=True)
    客房类型 = models.CharField(max_length=45)
    价格 = models.IntegerField()
    负责人编号 = models.ForeignKey('Staff', models.DO_NOTHING, db_column='负责人编号')
    def __str__(self):
        return str(self.房间号)
    class Meta:
        verbose_name = "客房信息管理"
        verbose_name_plural = verbose_name
        db_table = 'room'


class Staff(models.Model):
    员工id = models.AutoField(primary_key=True)
    姓名 = models.CharField(max_length=45)
    职务 = models.CharField(max_length=45)
    月薪 = models.CharField(max_length=45)
    工龄 = models.CharField(max_length=45)

    def __str__(self):
        return self.姓名

    class Meta:
        verbose_name = "员工信息管理"
        verbose_name_plural = verbose_name
        db_table = 'staff'


class Vip(models.Model):
    会员编号 = models.AutoField(primary_key=True)
    姓名 = models.CharField(max_length=45)
    会员等级 = models.CharField(max_length=45)
    联系方式 = models.CharField(max_length=45)

    class Meta:
        verbose_name = "会员信息管理"
        verbose_name_plural = verbose_name
        db_table = 'vip'
