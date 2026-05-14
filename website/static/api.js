// ==========================================
// KHI TRANG VỪA LOAD: GET DỮ LIỆU TỪ FLASK API
// ==========================================
document.addEventListener('DOMContentLoaded', async () => {
    try {
        // Tích hợp fetch API vào endpoint Flask (bạn hãy viết router /api/initial-data ở file app.py)
        const response = await fetch('/api/initial-data');
        if (response.ok) {
            const data = await response.json();
            ROOMS = data.rooms || [];
            BOOKINGS = data.bookings || [];
            EMPLOYEES = data.employees || [];
            SERVICES = data.services || [];
            REPORT_DATA = data.reports || [];
            ACTIVITY = data.activity || [];
            COMMENTS = data.comments || [];
        }
    } catch (error) {
        console.error("Lỗi lấy dữ liệu: Không có Backend chạy hoặc Database chưa chuẩn bị");
        toast('Đang dùng chế độ UI (Không kết nối database)','info');
    }
    
    renderNav();
    renderRooms(ROOMS);
});

// ==========================================
// TÌM PHÒNG (GET)
// ==========================================
async function apiSearchRooms() {
    const name = document.getElementById('search-name').value;
    const type = document.getElementById('search-type').value;

    const params = new URLSearchParams();
    if (name) params.append('name', name);
    if (type) params.append('type', type);

    try {
        const response = await fetch(`/api/rooms/search?${params.toString()}`);
        if(response.ok) {
            const filteredRooms = await response.json();
            renderRooms(filteredRooms);
            toast(`Tìm thấy ${filteredRooms.length} phòng`, 'info');
        }
    } catch (error) {
        toast('Lỗi hệ thống khi tìm kiếm', 'error');
    }
}

// ==========================================
// ĐĂNG NHẬP (POST)
// ==========================================
async function apiDoLogin() {
    const u = document.getElementById('login-user').value;
    const p = document.getElementById('login-pass').value;

    try {
        const response = await fetch('/api/login', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ username: u, password: p })
        });

        const result = await response.json();

        if (response.ok) {
            currentUser = result.user; 
            toast(`Chào mừng, ${currentUser.name}!`, 'success');
            renderNav();

            if (currentUser.role === 'MANAGER') nav('admin');
            else if (currentUser.role === 'RECEPTIONIST') nav('receptionist');
            else nav('home');
        } else {
            toast(result.message || 'Sai tên đăng nhập hoặc mật khẩu!', 'error');
        }
    } catch (error) {
        toast('Lỗi kết nối đến Server!', 'error');
    }
}

function apiDoLogout() {
    currentUser = null;
    renderNav();
    nav('home');
    toast('Đã đăng xuất.','info');
}

// Để demo (Điền form tự động)
function setLogin(u, p) {
  document.getElementById('login-user').value = u;
  document.getElementById('login-pass').value = p;
}

// ==========================================
// ĐĂNG KÝ (POST)
// ==========================================
async function apiDoRegister() {
    const data = {
        name: document.getElementById('reg-name').value,
        id_card: document.getElementById('reg-id').value,
        gender: document.getElementById('reg-gender').value,
        username: document.getElementById('reg-user').value,
        password: document.getElementById('reg-pass').value,
        type: selectedCustType,
        email: document.getElementById('reg-email').value,
        phone: document.getElementById('reg-phone').value,
    };

    if (!data.name || !data.username) { toast('Vui lòng điền đầy đủ thông tin!','error'); return; }

    try {
        const response = await fetch('/api/register', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(data)
        });
        if(response.ok) {
            toast(`Đăng ký thành công! Chào mừng ${data.name}`, 'success');
            nav('login');
        } else {
            const err = await response.json();
            toast(err.message, 'error');
        }
    } catch (error) {
        toast('Lỗi hệ thống','error');
    }
}

// ==========================================
// TẠO BOOKING MỚI (POST)
// ==========================================
async function apiConfirmBooking() {
    const bookingData = {
        guest_name: document.getElementById('book-name').value,
        guest_id: document.getElementById('book-id').value,
        guest_type: document.getElementById('book-type').value,
        checkin: document.getElementById('book-in').value,
        checkout: document.getElementById('book-out').value,
        room_id: currentRoom.id,
        deposit_amount: currentRoom.price * 0.3
    };

    try {
        const response = await fetch('/api/bookings/create', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(bookingData)
        });

        if (response.ok) {
            toast('🎉 Đặt phòng thành công! Cảm ơn bạn.','success');
            nav('home');
        } else {
            toast('Lỗi đặt phòng!', 'error');
        }
    } catch (error) {
        toast('Lỗi hệ thống', 'error');
    }
}

// ==========================================
// XÓA BOOKING (DELETE)
// ==========================================
async function apiDeleteBooking(id) {
    try {
        const response = await fetch(`/api/bookings/${id}`, { method: 'DELETE' });
        if(response.ok) {
            BOOKINGS = BOOKINGS.filter(b => b.id !== id);
            renderBookingsTable();
            toast('Đã xóa booking #'+id,'info');
        }
    } catch(err) {
        toast('Không thể xóa booking','error');
    }
}

// ==========================================
// CHECK-IN (PUT/POST)
// ==========================================
async function apiDoCheckin(id) { 
    try {
        const response = await fetch(`/api/bookings/${id}/checkin`, { method: 'POST' });
        if(response.ok) {
            toast(`Check-in booking #${id} thành công!`,'success'); 
        }
    } catch(err) {
        toast('Lỗi checkin','error');
    }
}

function searchCheckin() { toast('Tìm kiếm đặt phòng... (Cần API)','info'); }
function searchCheckout() { toast('Tìm kiếm phòng đang thuê... (Cần API)','info'); }