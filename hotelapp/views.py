from django.shortcuts import render
from django.shortcuts import HttpResponse
from hotelapp.models import Staff
from hotelapp.models import Room
from hotelapp.models import Client
from hotelapp.models import Food
from hotelapp.models import Vip
from hotelapp.models import Park
from hotelapp.models import Order
from hotelapp.models import Accommodation
# Create your views here.

#定义展示函数
def index(request):
    people_list = Staff.objects.all()
    return render(request, "index.html", {"people_list":people_list})

def login(request):
    return render(request, "login.html")
#定义插入函数
def insert(request):
    if request.method == "POST":
        id = request.POST.get("id", None)
        name = request.POST.get("name", None)
        job = request.POST.get("job", None)
        salary = request.POST.get("salary", None)
        work_time = request.POST.get("time_work", None)
        #print(name, work_time)
        twz = Staff.objects.create(员工id=id, 姓名=name, 职务=job, 月薪=salary, 工龄=work_time)
        twz.save()
    return render(request, "index.html")

#顾客信息录入
def insert_client(request):
    if request.method == "POST":
        id = request.POST.get("id", None)
        name = request.POST.get("name", None)
        identify = request.POST.get("identify", None)
        twz = Client.objects.create(顾客id=id, 姓名=name, 身份证号=identify)
        twz.save()
    return render(request, 'html1.html')
'''
def delete_staff(request):
    if request.method == "POST":
        id = request.POST.get("id", None)
        twz = Staff.objects.filter(员工id=id)
        twz.delete()
    return render(request, 'index.html')
'''

#员工信息删除
def delete_staff(request):
    if request.method == "GET":
        id = request.GET.get("id")
        Staff.objects.filter(员工id=id).delete()
    return render(request, 'index.html')

#员工信息查询
def search_staff(request):
    if request.method == "POST":
        columns = request.POST.get("columns", None)
        value = request.POST.get("value", None)
        staffs = eval('Staff.objects.filter('+columns+'=' + '"'+value+'"' + ')')
        #print("1", columns, id)
        #Staff.objects.get(columns=id)
    return render(request, 'index.html', {"staffs": staffs})

'''
def single(request):
    context={}
    context['rlt'] = Staff.objects.all()
    if request.POST:
        getname = request.POST['id']
        print(getname)
        response = Staff.objects.filter(员工id=getname)
        if len(response) != 0:
            context['rlt'] = response
        else:
            context['rlt'] = Staff.objects.all()
    else:
       context['rlt'] = Staff.objects.all()
    return render(request, "index.html", context)
'''

#员工信息修改
def update_staff(request):
    if request.method == "POST":
        id = request.POST.get("id")
        job = request.POST.get("job")
        salary = request.POST.get("salary")
        time = request.POST.get("time")
        print(id, job, salary, time)
        Staff.objects.filter(员工id=id).update(职务=job, 月薪=salary, 工龄=time)
        return render(request, 'index.html')
    #return render(request, 'html4.html')

#菜品展示函数
def show_food(request):
    food_list = Food.objects.all()
    return render(request, 'index.html2', {"food_list": food_list})

#顾客信息展示
def show_client(request):
    people_list = Client.objects.all()
    return render(request, "html1.html", {"people_list":people_list})

#顾客信息删除
def delete_client(request):
    if request.method == "GET":
        id = request.GET.get("id")
        Client.objects.filter(顾客id=id).delete()
    return render(request, 'html1.html')

#顾客信息修改
def update_client(request):
    if request.method == "POST":
        id = request.POST.get("id")
        name = request.POST.get("name")
        identify = request.POST.get("identify")
        print(id, name, identify)
        Client.objects.filter(顾客id=id).update(姓名=name, 身份证号=identify)
        return render(request, 'html1.html')



#顾客信息查询
def search_client(request):
    if request.method == "POST":
        columns = request.POST.get("columns", None)
        value = request.POST.get("value", None)
        clients = eval('Client.objects.filter('+columns+'=' + '"'+value+'"' + ')')
    return render(request, 'html1.html', {"clients": clients})

'''
#展示厨师编号
def show_cook(request):
    cook = Staff.objects.filter(职务='厨师')
    return render(request, 'html4.html', {"cook": cook})
'''

#菜品信息录入
def insert_food(request):
    if request.method == "POST":
        id = request.POST.get("id", None)
        name = request.POST.get("name", None)
        price = request.POST.get("price", None)
        cooker = request.POST.get("cooker", None)
        cook = Staff.objects.filter(职务='厨师').get(员工id=cooker)
        twz = Food.objects.create(菜品编号=id, 菜名=name, 价格=price, 厨师id=cook)
        twz.save()
    return render(request, 'html4.html')


#菜品信息展示
def show_food(request):
    people_list = Food.objects.all()
    return render(request, "html4.html", {"people_list": people_list})

#菜品信息删除
def delete_food(request):
    if request.method == "GET":
        id = request.GET.get("id")
        Food.objects.filter(菜品编号=id).delete()
    return render(request, 'html4.html')


#菜品信息修改
def update_food(request):
    if request.method == "POST":
        id = request.POST.get("id")
        price = request.POST.get("price")
        cooker = request.POST.get("cooker")
        print(id, price, cooker)
        Food.objects.filter(菜品编号=id).update(价格=price, 厨师id=Staff.objects.filter(职务='厨师').get(员工id=cooker))
        return render(request, 'html4.html')


#菜品信息查询
def search_food(request):
    if request.method == "POST":
        columns = request.POST.get("columns", None)
        value = request.POST.get("value", None)
        food = eval('Food.objects.filter('+columns+'=' + '"'+value+'"' + ')')
    return render(request, 'html4.html', {"food": food})


#会员信息录入
def insert_vip(request):
    if request.method == "POST":
        id = request.POST.get("id", None)
        name = request.POST.get("name", None)
        rank = request.POST.get("rank", None)
        tel = request.POST.get("tel", None)
        twz = Vip.objects.create(会员编号=id, 姓名=name, 会员等级=rank, 联系方式=tel)
        twz.save()
    return render(request, 'vip.html')


#会员信息展示
def show_vip(request):
    people_list = Vip.objects.all()
    return render(request, "vip.html", {"people_list": people_list})


#会员信息删除
def delete_vip(request):
    if request.method == "GET":
        id = request.GET.get("id")
        Vip.objects.filter(会员编号=id).delete()
    return render(request, 'vip.html')


#员工信息修改
def update_vip(request):
    if request.method == "POST":
        id = request.POST.get("id")
        rank = request.POST.get("rank")
        tel = request.POST.get("tel")
        Vip.objects.filter(会员编号=id).update(会员等级=rank, 联系方式=tel)
        return render(request, 'vip.html')


#会员信息查询
def search_vip(request):
    if request.method == "POST":
        columns = request.POST.get("columns", None)
        value = request.POST.get("value", None)
        vips = eval('Vip.objects.filter('+columns+'=' + '"'+value+'"' + ')')
    return render(request, 'vip.html', {"vips": vips})


#停车场信息录入
def insert_park(request):
    if request.method == "POST":
        id = request.POST.get("id", None)
        status = request.POST.get("status", None)
        num = request.POST.get("num", None)
        print(num)
        twz = Park.objects.create(车位编号=id, 当前状态=status, 车辆牌号=num)
        twz.save()
    return render(request, 'park.html')


#停车场信息展示
def show_park(request):
    people_list = Park.objects.all()
    return render(request, "park.html", {"people_list": people_list})


#停车场信息删除
def delete_park(request):
    if request.method == "GET":
        id = request.GET.get("id")
        print(id)
        Park.objects.filter(车位编号=id).delete()
    return render(request, 'park.html')


#停车信息修改
def update_park(request):
    if request.method == "POST":
        id = request.POST.get("id")
        status = request.POST.get("status")
        num = request.POST.get("num")
        Park.objects.filter(车位编号=id).update(当前状态=status, 车辆牌号=num)
        return render(request, 'park.html')


#车位信息查询
def search_park(request):
    if request.method == "POST":
        columns = request.POST.get("columns", None)
        value = request.POST.get("value", None)
        parks = eval('Park.objects.filter('+columns+'=' + '"'+value+'"' + ')')
    return render(request, 'park.html', {"parks": parks})


#客房信息录入
def insert_room(request):
    if request.method == "POST":
        id = request.POST.get("id", None)
        type = request.POST.get("type", None)
        price = request.POST.get("price", None)
        waiter = request.POST.get("waiter", None)
        cook = Staff.objects.filter(职务='服务员').get(员工id=waiter)
        twz = Room.objects.create(房间号=id, 客房类型=type, 价格=price, 负责人编号=cook)
        twz.save()
    return render(request, 'room.html')


#客房信息展示
def show_room(request):
    people_list = Room.objects.all()
    return render(request, "room.html", {"people_list": people_list})


#客房信息查询
def search_room(request):
    if request.method == "POST":
        columns = request.POST.get("columns", None)
        value = request.POST.get("value", None)
        print(columns, value)
        room = eval('Room.objects.filter('+columns+'=' + '"'+value+'"' + ')')
    return render(request, 'room.html', {"room": room})


#客房信息删除
def delete_room(request):
    if request.method == "GET":
        id = request.GET.get("id")
        Room.objects.filter(房间号=id).delete()
    return render(request, 'room.html')


#客房信息修改
def update_room(request):
    if request.method == "POST":
        id = request.POST.get("id")
        type = request.POST.get("type")
        price = request.POST.get("price")
        waiter = request.POST.get("waiter")
        print(id, type, price, waiter)
        Room.objects.filter(房间号=id).update(客房类型=type, 价格=price, 负责人编号=Staff.objects.filter(职务='服务员').get(员工id=waiter))
        return render(request, 'room.html')


#菜品订单录入
def insert_order(request):
    if request.method == "POST":
        id = request.POST.get("id", None)
        client =request.POST.get("client",None)
        food = request.POST.get("food", None)
        waiter = request.POST.get("waiter", None)
        table = request.POST.get("table", None)
        cli = Client.objects.get(顾客id=client)
        foodid = Food.objects.get(菜品编号=food)
        cook = Staff.objects.filter(职务='服务员').get(员工id=waiter)
        twz = Order.objects.create(id=id, 顾客编号=cli, 菜品编号=foodid, 服务员编号=cook, 桌号=table)
        twz.save()
    return render(request, 'order.html')


#菜品订单信息展示
def show_order(request):
    people_list = Order.objects.all()
    return render(request, "order.html", {"people_list": people_list})


#菜品订单信息删除
def delete_order(request):
    if request.method == "GET":
        id = request.GET.get("id")
        Order.objects.filter(id=id).delete()
    return render(request, 'order.html')


#菜品订单查询
def search_order(request):
    if request.method == "POST":
        id = request.POST.get("id", None)
        foodid = Order.objects.filter(顾客编号=id)
        print(foodid)
        food_id_set = []
        for f in foodid:
            id = f.菜品编号.菜品编号
            food_id_set.append(id)
        print(food_id_set)
        food_list = []
        for food_id in food_id_set:
            food = Food.objects.get(菜品编号=food_id)
            name = food.菜名
            price = food.价格
            li = {
                "菜名": name,
                "价格": price,
            }
            food_list.append(li)
        print(food_list)
    return render(request, 'order.html', {"food_list": food_list})


#客房信息录入
def insert_accomodation(request):
    if request.method == "POST":
        id = request.POST.get("id", None)
        client = request.POST.get("client",None)
        room = request.POST.get("room", None)
        time = request.POST.get("time", None)
        cli = Client.objects.get(顾客id=client)
        roomid = Room.objects.get(房间号=room)
        twz = Accommodation.objects.create(id=id, 顾客id=cli, 客房编号=roomid, 入住时间=time)
        twz.save()
    return render(request, 'accomodation.html')


#客房订单删除
def delete_accomodation(request):
    if request.method == "GET":
        id = request.GET.get("id")
        Accommodation.objects.filter(id=id).delete()
    return render(request, 'accomodation.html')


#客房订单信息展示
def show_accomodation(request):
    people_list = Accommodation.objects.all()
    return render(request, "accomodation.html", {"people_list": people_list})


#客房订单查询
def search_accomodation(request):
    if request.method == "POST":
        id = request.POST.get("id", None)
        roomid = Accommodation.objects.filter(顾客id=id)
        print(roomid)
        room_id_set = []
        time = None
        for f in roomid:
            id = f.客房编号.房间号
            room_id_set.append(id)
            time = f.入住时间
        print(room_id_set)
        room_list = []
        for room_id in room_id_set:
            room = Room.objects.get(房间号=room_id)
            num = room.房间号
            type = room.客房类型
            price = room.价格
            li = {
                "房间号": num,
                "客房类型": type,
                "价格": price,
                "入住时间": time
            }
            room_list.append(li)
        print(room_list)
    return render(request, 'accomodation.html', {"room_list": room_list})





