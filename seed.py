from app.models import *
from app import app
from sqlalchemy import text
from datetime import datetime
import hashlib

def get_or_create_roomtype(name):
    obj = RoomType.query.filter_by(name=name).first()
    if not obj:
        obj = RoomType(name=name)
        db.session.add(obj)
        db.session.commit()
    return obj

def get_or_create_room(name, room_type_id, image, status=None, note=None):
    obj = Room.query.filter_by(name=name).first()
    if not obj:
        obj = Room(name=name, room_type_id=room_type_id, image=image)  # Bỏ status nếu không có
        db.session.add(obj)
        db.session.commit()
    return obj

def get_or_create_user(username, role, email, phone, avatar, gender=None):
    obj = User.query.filter_by(username=username).first()
    if not obj:
        obj = User(
            role=role,
            username=username,
            password=str(hashlib.md5('123456'.encode('utf-8')).hexdigest()),
            avatar=avatar,
            email=email,
            phone=phone,
            gender=gender
        )
        db.session.add(obj)
        db.session.commit()
    return obj

def get_or_create_administrator(id, name):
    obj = Administrator.query.filter_by(id=id).first()
    if not obj:
        obj = Administrator(id=id, name=name)
        db.session.add(obj)
        db.session.commit()
    return obj

def get_or_create_receptionist(id, name):
    obj = Receptionist.query.filter_by(id=id).first()
    if not obj:
        obj = Receptionist(id=id, name=name)
        db.session.add(obj)
        db.session.commit()
    return obj

def get_or_create_customer_type(type_name=None):
    obj = CustomerType.query.filter_by(type=type_name).first()
    if not obj:
        obj = CustomerType(type=type_name)
        db.session.add(obj)
        db.session.commit()
    return obj

def get_or_create_customer(id, name, identification, customer_type_id):
    obj = Customer.query.filter_by(id=id).first()
    if not obj:
        obj = Customer(id=id, name=name, identification=identification, customer_type_id=customer_type_id)
        db.session.add(obj)
        db.session.commit()
    return obj

def get_or_create_customer_type_regulation(admin_id, customer_type_id, rate=None):
    obj = CustomerTypeRegulation.query.filter_by(admin_id=admin_id, customer_type_id=customer_type_id).first()
    if not obj:
        obj = CustomerTypeRegulation(admin_id=admin_id, customer_type_id=customer_type_id, rate=rate)
        db.session.add(obj)
        db.session.commit()
    return obj

def get_or_create_room_regulation(room_type_id, admin_id, room_quantity, capacity, price):
    obj = RoomRegulation.query.filter_by(room_type_id=room_type_id, admin_id=admin_id).first()
    if not obj:
        obj = RoomRegulation(room_type_id=room_type_id, admin_id=admin_id, room_quantity=room_quantity, capacity=capacity, price=price)
        db.session.add(obj)
        db.session.commit()
    return obj

def get_or_create_comment(customer_id, content, created_date, room_id):
    obj = Comment.query.filter_by(customer_id=customer_id, content=content, created_date=created_date, room_id=room_id).first()
    if not obj:
        obj = Comment(customer_id=customer_id, content=content, created_date=created_date, room_id=room_id)
        db.session.add(obj)
        db.session.commit()
    return obj

def get_or_create_reservation(customer_id, receptionist_id, room_id, checkin_date, checkout_date, deposit=None):
    obj = Reservation.query.filter_by(customer_id=customer_id, receptionist_id=receptionist_id, room_id=room_id, checkin_date=checkin_date).first()
    if not obj:
        obj = Reservation(
            customer_id=customer_id,
            receptionist_id=receptionist_id,
            room_id=room_id,
            checkin_date=checkin_date,
            checkout_date=checkout_date,
            deposit=deposit
        )
        db.session.add(obj)
        db.session.commit()
    return obj

def get_or_create_room_rental(receptionist_id, room_id, reservation_id, checkin_date, checkout_date, deposit=None, is_paid=None):
    obj = RoomRental.query.filter_by(receptionist_id=receptionist_id, room_id=room_id, reservation_id=reservation_id, checkin_date=checkin_date).first()
    if not obj:
        obj = RoomRental(
            receptionist_id=receptionist_id,
            room_id=room_id,
            reservation_id=reservation_id,
            checkin_date=checkin_date,
            checkout_date=checkout_date,
            deposit=deposit,
            is_paid=is_paid
        )
        db.session.add(obj)
        db.session.commit()
    return obj
def get_or_create_service(name, price, description=None):
    obj = Service.query.filter_by(name=name).first()
    if not obj:
        obj = Service(name=name, price=price, description=description)
        db.session.add(obj)
        db.session.commit()
    return obj
def get_or_create_receipt(receptionist_id, rental_room_id, total_price, created_date):
    obj = Receipt.query.filter_by(receptionist_id=receptionist_id, rental_room_id=rental_room_id, created_date=created_date).first()
    if not obj:
        obj = Receipt(
            receptionist_id=receptionist_id,
            rental_room_id=rental_room_id,
            total_price=total_price,
            created_date=created_date
        )
        db.session.add(obj)
        db.session.commit()
    return obj

def get_or_create_housekeeping_task(housekeeper_id, room_id, rental_id,
                                    assigned_date, completed_date=None,
                                    status='assigned', notes=None):
    obj = HousekeepingTask.query.filter_by(
        housekeeper_id=housekeeper_id,
        room_id=room_id,
        rental_id=rental_id,
        assigned_date=assigned_date
    ).first()

    if not obj:
        obj = HousekeepingTask(
            housekeeper_id=housekeeper_id,
            room_id=room_id,
            rental_id=rental_id,
            assigned_date=assigned_date,
            completed_date=completed_date,
            status=status,
            notes=notes
        )
        db.session.add(obj)
        db.session.commit()
    return obj

if __name__ == "__main__":
    with app.app_context():
        db.session.execute(text('SET FOREIGN_KEY_CHECKS=0;'))

        # RoomType
        rt1 = get_or_create_roomtype('Single Room - Single Bed')
        rt2 = get_or_create_roomtype('Double Room - Single Bed')
        rt3 = get_or_create_roomtype('Double Bed Room')

        # Room
        r1 = get_or_create_room('Deluxe Room', 2, 'images/phong1.jpg')
        r2 = get_or_create_room('Grand Deluxe Room', 3, 'images/phong2.jpg')
        r3 = get_or_create_room('Executive Room', 2, 'images/phong3.jpg')
        r4 = get_or_create_room('Deluxe Suite', 1, 'images/phong4.jpg')
        r5 = get_or_create_room('Presidential Suite', 3, 'images/phong5.jpg')
        r6 = get_or_create_room('Royal Suite', 3, 'images/phong6.jpg')

        #https://res.cloudinary.com/dur0bydiv/image/upload/v1747547621/hotel/iyg9h1kdzgmvk9skxijd.jpg
# https://res.cloudinary.com/dur0bydiv/image/upload/v1747547623/hotel/sqbdpbsxmdtnxbrxnoig.jpg
# https://res.cloudinary.com/dur0bydiv/image/upload/v1747547627/hotel/iqnluakeur3yxdxzcrlz.png
# https://res.cloudinary.com/dur0bydiv/image/upload/v1747547628/hotel/urythrt08zxctmjloq5m.jpg
# https://res.cloudinary.com/dur0bydiv/image/upload/v1747547628/hotel/hvjojevo1vot0mxh2pwb.jpg
# https://res.cloudinary.com/dur0bydiv/image/upload/v1747547629/hotel/txkv7rnr1cxj9j4hr8e0.jpg
# https://res.cloudinary.com/dur0bydiv/image/upload/v1747547629/hotel/nsjcibpiladtpq1dogm2.jpg
# https://res.cloudinary.com/dur0bydiv/image/upload/v1747547634/hotel/qddplxfc4qdhb0ss0pxp.png
# https://res.cloudinary.com/dur0bydiv/image/upload/v1747547635/hotel/lp0c4wctgjmss2fzp3wc.jpg
# https://res.cloudinary.com/dur0bydiv/image/upload/v1747547635/hotel/jygkp2ui4goegc32x7uy.jpg
# https://res.cloudinary.com/dur0bydiv/image/upload/v1747547636/hotel/fvppabfc2kyojm5zm1pn.jpg
# https://res.cloudinary.com/dur0bydiv/image/upload/v1747547637/hotel/fd2vpfjnmqnhflvdn6fx.jpg
# https://res.cloudinary.com/dur0bydiv/image/upload/v1747547637/hotel/izmrnufhyjvtu5h3yp45.jpg
# https://res.cloudinary.com/dur0bydiv/image/upload/v1747547638/hotel/lcahh9o78qhfau5ydlyj.jpg
# https://res.cloudinary.com/dur0bydiv/image/upload/v1747547639/hotel/jzswbeivzyeifcjo8b7d.jpg
# https://res.cloudinary.com/dur0bydiv/image/upload/v1747547639/hotel/nn47hkesm9t60oa9tgzm.jpg
# https://res.cloudinary.com/dur0bydiv/image/upload/v1747547640/hotel/fg6y1w4cxfcfpxb6l09u.jpg
# https://res.cloudinary.com/dur0bydiv/image/upload/v1747547643/hotel/yqbc4gle5knexrhka7ic.png

        user1 = get_or_create_user('linh23', UserRole.ADMIN, 'khanhlinh4201@gmail.com', '0375290878',
                                   'https://res.cloudinary.com/dur0bydiv/image/upload/v1747547623/hotel/sqbdpbsxmdtnxbrxnoig.jpg')
        user2 = get_or_create_user('tung05', UserRole.CUSTOMER, 'dinhtung@ou.edu.vn', '0123456789',
                                   'https://res.cloudinary.com/dur0bydiv/image/upload/v1747547627/hotel/iqnluakeur3yxdxzcrlz.png')
        user3 = get_or_create_user('vananh21', UserRole.CUSTOMER, 'vananh21@ou.edu.vn', '7312936921',
                                   'https://res.cloudinary.com/dur0bydiv/image/upload/v1747547635/hotel/lp0c4wctgjmss2fzp3wc.jpg')
        user4 = get_or_create_user('dieuthuy27', UserRole.CUSTOMER, 'dieuthuy27@gmail.com', '3485692348',
                                   'https://res.cloudinary.com/dg1zsnywc/image/upload/v1715772103/il4g2k9ndrvvj187vkqg.jpg')
        user5 = get_or_create_user('huyhuy12', UserRole.CUSTOMER, 'huyhuy12@gmail.com', '31231234124',
                                   'https://res.cloudinary.com/dur0bydiv/image/upload/v1747547640/hotel/fg6y1w4cxfcfpxb6l09u.jpg')
        user6 = get_or_create_user('thanhtung13', UserRole.CUSTOMER, 'thanhtung13@gmail.com', '56978560756',
                                   'https://res.cloudinary.com/dur0bydiv/image/upload/v1747547637/hotel/izmrnufhyjvtu5h3yp45.jpg')
        user7 = get_or_create_user('minhanh88', UserRole.RECEPTIONIST, 'minhanh88@gmail.com', '8354084534324', None, gender=False)
        user8 = get_or_create_user('tranminhhaiduong', UserRole.HOUSEKEEPER, 'haiduongminhtran@gmail.com', '23345434', None, gender=False)

        # Administrator
        get_or_create_administrator(1, ' Đình Tùng')

        # Receptionist
        get_or_create_receptionist(7, 'Khánh Linh')

        # CustomerType
        ct1 = get_or_create_customer_type()
        ct2 = get_or_create_customer_type('FOREIGN')

        # Customer
        get_or_create_customer(2, 'Trần Minh Khoa', '1231234124', 1)
        get_or_create_customer(3, 'Phạm Thị Hồng Nhung', '3453456347', 1)
        get_or_create_customer(4, 'Đoàn Quốc Bảo', '7567657567', 2)
        get_or_create_customer(5, 'Vũ Nhật Nam', '34534578', 2)
        get_or_create_customer(6, 'Lý Gia Hân', '46457457323', 1)

        # CustomerTypeRegulation
        get_or_create_customer_type_regulation(1, 1)
        get_or_create_customer_type_regulation(1, 2, rate=1.5)

        # RoomRegulation
        get_or_create_room_regulation(1, 1, 10, 3, 7000000)
        get_or_create_room_regulation(2, 1, 15, 5, 9000000)
        get_or_create_room_regulation(3, 1, 20, 7, 12000000)

        # Comment
        get_or_create_comment(2, 'Khách sạn này tuyệt vời ', datetime(2024, 3, 31, 13, 31), 1)
        get_or_create_comment(3, 'Thật bất ngờ vì vẻ đẹp của khách sạn', datetime(2024, 2, 4, 15, 3), 1)
        get_or_create_comment(4, 'sẽ ủng hộ nhiều ạ ', datetime(2024, 5, 6, 12, 4), 2)
        get_or_create_comment(5, 'Một trải nghiệm thật tuyệt vời', datetime(2023, 6, 19, 21, 45), 2)
        get_or_create_comment(6, 'I love your Hotel', datetime(2024, 1, 31, 8, 20), 2)
        get_or_create_comment(2, 'chất lượng tuyệt vời', datetime(2024, 3, 1, 20, 8), 3)
        get_or_create_comment(3, 'thoải mái , bình yên , lãng mạn', datetime(2024, 3, 6, 15, 56), 3)
        get_or_create_comment(4, 'Thật là một nơi đáng để nghỉ dưỡng', datetime(2023, 8, 13, 17, 5), 3)
        get_or_create_comment(5, 'Xứng đáng với số tiền bỏ ra', datetime(2023, 12, 12, 12, 12), 3)
        get_or_create_comment(6, 'Nhân viên lễ tân cute xĩu ^^', datetime(2023, 11, 11, 11, 11), 3)
        get_or_create_comment(2, 'địa điểm đáng để chú ý trong kì kĩ dưỡng sắp tới của bạn!', datetime(2023, 12, 21, 12, 12), 4)
        get_or_create_comment(3, 'không có gì để chê', datetime(2023, 8, 8, 8, 8), 4)
        get_or_create_comment(4, 'Nơi này rất thoải mái và tiện nghi, có view đỉnh lắm ạ!', datetime(2023, 7, 7, 7, 7), 4)
        get_or_create_comment(5, 'đi đi mọi người khách sạn tuyệt phẩm', datetime(2023, 11, 30, 6, 12), 4)
        get_or_create_comment(6, 'tư vấn phòng này và trải nghiệm rất tốt', datetime(2024, 2, 9, 15, 18), 4)
        get_or_create_comment(2, 'phòng rộng rãi, sạch sẽ, thơm tho', datetime(2024, 1, 9, 17, 1), 5)
        get_or_create_comment(3, 'thanh toán thật dễ dàng', datetime(2024, 2, 28, 12, 15), 5)
        get_or_create_comment(4, 'Luxury Hotel <3', datetime(2023, 8, 31, 9, 21), 5)

        # Reservation
        reservation_data = [
            {'customer_id': 2, 'receptionist_id': 7, 'room_id': 4,
             'checkin_date': datetime(2024, 1, 31, 20, 15),
             'checkout_date': datetime(2024, 2, 28, 15, 20), 'deposit': 9000000},

            {'customer_id': 1, 'receptionist_id': 7, 'room_id': 2,
             'checkin_date': datetime(2024, 3, 25, 21, 10),
             'checkout_date': datetime(2024, 3, 29, 10, 21), 'deposit': 15000000},

            {'customer_id': 2, 'receptionist_id': 7, 'room_id': 2,
             'checkin_date': datetime(2023, 12, 11, 13, 21),
             'checkout_date': datetime(2023, 12, 21, 21, 13), 'deposit': 5000000},

            {'customer_id': 1, 'receptionist_id': 7, 'room_id': 1,
             'checkin_date': datetime(2024, 1, 18, 16, 30),
             'checkout_date': datetime(2024, 2, 29, 3, 4), 'deposit': 15000000},

            {'customer_id': 4, 'receptionist_id': 7, 'room_id': 1,
             'checkin_date': datetime(2024, 5, 3, 17, 5),
             'checkout_date': datetime(2024, 5, 8, 5, 17), 'deposit': 10000000},

            {'customer_id': 5, 'receptionist_id': 7, 'room_id': 2,
             'checkin_date': datetime(2023, 2, 21, 9, 15),
             'checkout_date': datetime(2023, 3, 19, 15 ,9), 'deposit': 18500000},

            {'customer_id': 2, 'receptionist_id': 7, 'room_id': 1,
             'checkin_date': datetime(2023, 7, 21, 17, 12),
             'checkout_date': datetime(2023, 8, 21, 12, 17), 'deposit': 20000000},
        ]
        for data in reservation_data:
            get_or_create_reservation(**data)

        # RoomRental
        room_rental_data = [
            {'receptionist_id': 7, 'room_id': 4, 'reservation_id': 1,
             'checkin_date': datetime(2024, 3, 17, 11, 33, 12),
             'checkout_date': datetime(2024, 5, 21, 12, 44, 51),
             'deposit': 5000000, 'is_paid': True},

            {'receptionist_id': 7, 'room_id': 2, 'reservation_id': 2,
             'checkin_date': datetime(2024, 3, 8, 12, 45, 1),
             'checkout_date': datetime(2024, 3, 21, 21, 6, 8),
             'deposit': None, 'is_paid': True},

            {'receptionist_id': 7, 'room_id': 3, 'reservation_id': None,
             'checkin_date': datetime(2024, 4, 3, 20, 22, 17),
             'checkout_date': datetime(2024, 5, 16, 9, 23, 12),
             'deposit': 21000000, 'is_paid': True},

            {'receptionist_id': 7, 'room_id': 2, 'reservation_id': 3,
             'checkin_date': datetime(2024, 2, 27, 18, 1, 25),
             'checkout_date': datetime(2024, 3, 7, 15, 32, 11),
             'deposit': 8000000, 'is_paid': True},

            {'receptionist_id': 7, 'room_id': 1, 'reservation_id': 4,
             'checkin_date': datetime(2024, 8, 3, 6, 3, 24),
             'checkout_date': datetime(2024, 8, 24, 8, 6, 12),
             'deposit': 10000000, 'is_paid': True},

            {'receptionist_id': 7, 'room_id': 1, 'reservation_id': 5,
             'checkin_date': datetime(2024, 1, 20, 9, 22, 32),
             'checkout_date': datetime(2024, 2, 3, 21, 44, 23),
             'deposit': None, 'is_paid': True},

            {'receptionist_id': 7, 'room_id': 3, 'reservation_id': None,
             'checkin_date': datetime(2024, 4, 12, 10, 2, 50),
             'checkout_date': datetime(2024, 4, 26, 21, 5, 18),
             'deposit': 21000000, 'is_paid': True},

            {'receptionist_id': 7, 'room_id': 2, 'reservation_id': 6,
             'checkin_date': datetime(2024, 6, 18, 7, 30, 21),
             'checkout_date': datetime(2024, 3, 21, 9, 15, 21),
             'deposit': None, 'is_paid': True},

            {'receptionist_id': 7, 'room_id': 1, 'reservation_id': 7,
             'checkin_date': datetime(2024, 2, 9, 8, 20, 5),
             'checkout_date': datetime(2024, 3, 10, 20, 8, 8),
             'deposit': 15000000, 'is_paid': True},
        ]
        for data in room_rental_data:
            get_or_create_room_rental(**data)
        get_or_create_service('Giặt là', 50000, 'Dịch vụ giặt là quần áo')
        get_or_create_service('Đưa đón sân bay', 200000, 'Dịch vụ đưa đón khách tại sân bay')
        get_or_create_service('Ăn sáng', 100000, 'Buffet sáng tại khách sạn')
        get_or_create_service('Spa', 300000, 'Dịch vụ spa thư giãn')
        get_or_create_service('Thuê xe', 150000, 'Dịch vụ thuê xe máy/ô tô')
        # Receipt
        receipt_data = [
            {'receptionist_id': 7, 'rental_room_id': 1, 'total_price': 5000000,
             'created_date': datetime(2024, 5, 21, 12, 45)},

            {'receptionist_id': 7, 'rental_room_id': 2, 'total_price': 3000000,
             'created_date': datetime(2024, 3, 21, 21, 6)},

            {'receptionist_id': 7, 'rental_room_id': 3, 'total_price': 21000000,
             'created_date': datetime(2024, 5, 16, 9, 23)},

            {'receptionist_id': 7, 'rental_room_id': 4, 'total_price': 8000000,
             'created_date': datetime(2024, 2, 3, 21, 45)},

            {'receptionist_id': 7, 'rental_room_id': 5, 'total_price': 12000000,
             'created_date': datetime(2024, 8, 24, 8, 6)},

            {'receptionist_id': 7, 'rental_room_id': 6, 'total_price': 3000000,
             'created_date': datetime(2024, 2, 3, 9, 44)},

            {'receptionist_id': 7, 'rental_room_id': 7, 'total_price': 21000000,
             'created_date': datetime(2024, 4, 26, 9, 5)},

            {'receptionist_id': 7, 'rental_room_id': 8, 'total_price': 3000000,
             'created_date': datetime(2024, 3, 21, 9, 15)},

            {'receptionist_id': 7, 'rental_room_id': 9, 'total_price': 15000000,
             'created_date': datetime(2024, 3, 10, 20, 8)},
        ]
        for data in receipt_data:
            get_or_create_receipt(**data)
        get_or_create_housekeeping_task(
            housekeeper_id=8, room_id=1, rental_id=1,
            assigned_date=datetime(2024, 5, 20, 9, 0),
            completed_date=datetime(2024, 5, 20, 12, 0),
            status='completed',
            notes='Làm sạch sàn và thay ga trải giường'
        )

        get_or_create_housekeeping_task(
            housekeeper_id=8, room_id=2, rental_id=2,
            assigned_date=datetime(2024, 5, 21, 10, 0),
            status='assigned',
            notes='Chuẩn bị khăn tắm và nước suối'
        )

        get_or_create_housekeeping_task(
            housekeeper_id=8, room_id=3, rental_id=3,
            assigned_date=datetime(2024, 5, 22, 8, 30),
            completed_date=datetime(2024, 5, 22, 10, 0),
            status='completed',
            notes='Khử mùi phòng và kiểm tra thiết bị'
        )
        db.session.execute(text('SET FOREIGN_KEY_CHECKS=1;'))
        db.session.commit()
# Housekeeping Tasks
