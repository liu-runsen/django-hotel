from django.contrib import admin
from sqlalchemy import create_engine
from hotelapp.models import *

admin.site.site_header = '酒店管理系统'
admin.site.site_title = '酒店管理系统'
admin.site.index_title = '酒店管理系统'

class AccommodationAdmin(admin.ModelAdmin):

    '''设置列表可显示的字段'''
    list_display = ("顾客id","客房编号","入住时间")

    '''设置过滤选项'''
    list_filter = ("顾客id","客房编号","入住时间")

    '''每页显示条目数'''
    list_per_page = 15

    '''设置可编辑字段'''
    # list_editable = ('status',)

class ClientAdmin(admin.ModelAdmin):

    '''设置列表可显示的字段'''
    list_display = ("顾客id","姓名","身份证号")

    '''设置过滤选项'''
    list_filter = ("顾客id","姓名","身份证号")

    '''每页显示条目数'''
    list_per_page = 15

    '''设置可编辑字段'''
    # list_editable = ('status',)

class FoodAdmin(admin.ModelAdmin):

    '''设置列表可显示的字段'''
    list_display = ("菜品编号","菜名","价格","厨师id")

    '''设置过滤选项'''
    list_filter = ("菜品编号","菜名","价格","厨师id")

    '''每页显示条目数'''
    list_per_page = 15

    '''设置可编辑字段'''
    # list_editable = ('status',)

class OrderAdmin(admin.ModelAdmin):

    '''设置列表可显示的字段'''
    list_display = ("顾客编号","菜品编号","服务员编号","桌号")

    '''设置过滤选项'''
    list_filter = ("顾客编号","菜品编号","服务员编号","桌号")

    '''每页显示条目数'''
    list_per_page = 15

    '''设置可编辑字段'''
    # list_editable = ('status',)

class ParkAdmin(admin.ModelAdmin):

    '''设置列表可显示的字段'''
    list_display = ("车位编号","当前状态","车辆牌号")

    '''设置过滤选项'''
    list_filter = ("车位编号","当前状态","车辆牌号")

    '''每页显示条目数'''
    list_per_page = 15

    '''设置可编辑字段'''
    # list_editable = ('status',)

class RoomAdmin(admin.ModelAdmin):

    '''设置列表可显示的字段'''
    list_display = ("房间号","客房类型","价格","负责人编号")

    '''设置过滤选项'''
    list_filter = ("房间号","客房类型","价格","负责人编号")

    '''每页显示条目数'''
    list_per_page = 15

    '''设置可编辑字段'''
    # list_editable = ('status',)
class StaffAdmin(admin.ModelAdmin):

    '''设置列表可显示的字段'''
    list_display = ("员工id","姓名","职务","月薪","工龄")

    '''设置过滤选项'''
    list_filter = ("员工id","姓名","职务","月薪","工龄")

    '''每页显示条目数'''
    list_per_page = 15

    '''设置可编辑字段'''
    # list_editable = ('status',)
class VipAdmin(admin.ModelAdmin):

    '''设置列表可显示的字段'''
    list_display = ("会员编号","姓名","会员等级","联系方式")

    '''设置过滤选项'''
    list_filter = ("会员编号","姓名","会员等级","联系方式")

    '''每页显示条目数'''
    list_per_page = 15

    '''设置可编辑字段'''
    # list_editable = ('status',)
admin.site.register(Accommodation, AccommodationAdmin)
admin.site.register(Client, ClientAdmin)
admin.site.register(Food, FoodAdmin)
admin.site.register(Order, OrderAdmin)
admin.site.register(Park, ParkAdmin)
admin.site.register(Room, RoomAdmin)
admin.site.register(Vip, VipAdmin)
admin.site.register(Staff, StaffAdmin)