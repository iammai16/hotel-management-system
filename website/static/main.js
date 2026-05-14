// ─── STATE (Thay thế bằng mảng rỗng để đợi API đổ data vào) ───
let ROOMS = [];
let BOOKINGS = [];
let EMPLOYEES = [];
let SERVICES = [];
let ACTIVITY = [];
let REPORT_DATA = [];
let COMMENTS = [];

let currentUser = null;
let currentRoom = null;
let selectedRecepRoom = null;
let guestCount = 1;
let selectedCustType = 'DOMESTIC';

// ─── NAVIGATION ────────────────────────────────────────────
function nav(page) {
  document.querySelectorAll('.page').forEach(p => p.classList.remove('active'));
  document.getElementById('page-' + page).classList.add('active');
  if (page === 'home') renderRooms(ROOMS);
  if (page === 'admin') renderAdmin();
  if (page === 'receptionist') renderReceptionist();
  window.scrollTo(0,0);
}

function renderNav() {
  const links = document.getElementById('nav-links');
  if (!currentUser) {
    links.innerHTML = `
      <a onclick="nav('home')">Trang chủ</a>
      <a onclick="nav('home')">Phòng</a>
      <a onclick="nav('register')">Đăng ký</a>
      <a onclick="nav('login')" class="nav-btn-primary btn" style="margin-left:.5rem">Đăng nhập</a>`;
  } else {
    const badge = `<span class="badge-role">${currentUser.role}</span>`;
    const dashLink = currentUser.role === 'MANAGER'
      ? `<a onclick="nav('admin')">Dashboard ${badge}</a>`
      : currentUser.role === 'RECEPTIONIST'
      ? `<a onclick="nav('receptionist')">Dashboard ${badge}</a>`
      : `<a onclick="nav('home')">Trang chủ ${badge}</a>`;
    links.innerHTML = `
      <a onclick="nav('home')">Phòng</a>
      ${dashLink}
      <span style="font-size:.85rem;color:var(--slate);padding:.45rem .5rem">${currentUser.name}</span>
      <button onclick="apiDoLogout()" class="btn btn-ghost btn-sm">Đăng xuất</button>`;
  }
}

// ─── HOME / ROOMS ───────────────────────────────────────────
function fmt(n) { return n.toLocaleString('vi-VN') + 'đ'; }

function renderRooms(rooms) {
  const grid = document.getElementById('rooms-grid');
  if (!rooms.length) {
    grid.innerHTML = '<div class="empty-state" style="grid-column:1/-1"><div class="icon">🏨</div><p>Không tìm thấy phòng phù hợp</p></div>';
    return;
  }
  grid.innerHTML = rooms.map(r => `
    <div class="room-card" onclick="openDetail(${r.id})">
      <div class="room-img">
        <div class="room-img-inner">🛏</div>
        <div class="tag">${r.type}</div>
        ${r.available ? '<div class="room-avail"></div>' : ''}
      </div>
      <div class="room-body">
        <h3>${r.name}</h3>
        <div class="room-type">${r.type} · ${r.cap} người</div>
        <div class="room-features">${r.features.map(f=>`<span class="room-feature">✓ ${f}</span>`).join('')}</div>
        <div class="room-footer">
          <div>
            <div class="room-price">${fmt(r.price)} <span>/đêm</span></div>
          </div>
          <button class="btn btn-primary btn-sm" onclick="event.stopPropagation();openDetail(${r.id})">Xem chi tiết →</button>
        </div>
      </div>
    </div>`).join('');
}

function selectType(t, el) {
  selectedCustType = t;
  document.querySelectorAll('.type-option').forEach(e => e.classList.remove('selected'));
  el.classList.add('selected');
}

function openDetail(id) {
  currentRoom = ROOMS.find(r => r.id === id);
  if (!currentRoom) return;
  document.getElementById('detail-name').textContent = currentRoom.name;
  document.getElementById('detail-type').textContent = currentRoom.type + ' · ' + currentRoom.cap + ' người';
  document.getElementById('detail-price').textContent = fmt(currentRoom.price);
  document.getElementById('detail-features').innerHTML = currentRoom.features.map(f=>`<div class="chip">✓ ${f}</div>`).join('');
  document.getElementById('detail-comments').innerHTML = COMMENTS.map(c=>`
    <div class="comment-item">
      <div class="comment-header">
        <div class="avatar">${c.avatar}</div>
        <div><div class="comment-user">${c.user}</div><div class="comment-time">${c.time}</div></div>
      </div>
      <div class="comment-text">${c.text}</div>
    </div>`).join('');
  nav('detail');
}

function showResCheck() {
  const name = document.getElementById('book-name').value;
  const id   = document.getElementById('book-id').value;
  const type = document.getElementById('book-type').value;
  const cin  = document.getElementById('book-in').value;
  const cout = document.getElementById('book-out').value;
  if (!name||!id||!cin||!cout) { toast('Vui lòng điền đầy đủ thông tin!','error'); return; }
  if (cin >= cout) { toast('Ngày trả phòng phải sau ngày nhận phòng!','error'); return; }

  const nights = Math.max(1,(new Date(cout)-new Date(cin))/(86400000));
  const deposit = currentRoom.price * 0.3;

  document.getElementById('rc-room').textContent = currentRoom.name;
  document.getElementById('rc-type').textContent = currentRoom.type;
  document.getElementById('rc-in').textContent = cin;
  document.getElementById('rc-out').textContent = cout;
  document.getElementById('rc-guests').innerHTML = `
    <tr><td style="padding:.5rem .8rem">1</td><td style="padding:.5rem .8rem">${name}</td><td style="padding:.5rem .8rem"><span class="badge badge-blue">${type}</span></td><td style="padding:.5rem .8rem">${id}</td></tr>`;
  document.getElementById('rc-deposit').textContent = fmt(deposit);
  nav('rescheck');
}

document.getElementById('book-out').addEventListener('change', updateDeposit);
document.getElementById('book-in').addEventListener('change', updateDeposit);
function updateDeposit() {
  if (!currentRoom) return;
  document.getElementById('deposit-amt').textContent = fmt(currentRoom.price * 0.3);
}

function submitComment() {
  const txt = document.getElementById('comment-input').value;
  if (!txt) return;
  COMMENTS.unshift({user: currentUser ? currentUser.u : 'Khách', avatar:'K', text:txt, time:new Date().toLocaleDateString('vi-VN')});
  document.getElementById('comment-input').value = '';
  openDetail(currentRoom.id);
  toast('Đã gửi đánh giá!','success');
}

// ─── RECEPTIONIST ───────────────────────────────────────────
function renderReceptionist() {
  const list = document.getElementById('recep-room-list');
  list.innerHTML = ROOMS.filter(r=>r.available).map(r=>`
    <div class="room-select-item" id="rsi-${r.id}" onclick="selectRecepRoom(${r.id})">
      <h4>${r.name}</h4>
      <p>${r.type} · ${fmt(r.price)}/đêm · ${r.cap} người</p>
    </div>`).join('');

  const tbody = document.getElementById('reservation-tbody');
  tbody.innerHTML = BOOKINGS.map(b=>`
    <tr>
      <td>#${b.id}</td>
      <td>${b.guest}</td>
      <td>${b.room}</td>
      <td>${b.checkin}</td>
      <td>${b.checkout}</td>
      <td>${fmt(b.deposit)}</td>
      <td><span class="badge ${b.paid?'badge-green':'badge-amber'}">${b.paid?'Đã cọc':'Chưa cọc'}</span></td>
      <td class="td-actions">
        <button class="btn btn-sm btn-primary" onclick="apiDoCheckin(${b.id})">Check-in</button>
      </td>
    </tr>`).join('');
}

function selectRecepRoom(id) {
  document.querySelectorAll('.room-select-item').forEach(e=>e.classList.remove('selected'));
  document.getElementById('rsi-'+id)?.classList.add('selected');
  selectedRecepRoom = ROOMS.find(r=>r.id===id);
  const box = document.getElementById('rental-info-box');
  box.style.display = 'block';
  document.getElementById('ri-room-name').textContent = selectedRecepRoom.name;
  document.getElementById('ri-type').textContent = selectedRecepRoom.type;
  document.getElementById('ri-price').textContent = fmt(selectedRecepRoom.price);
  document.getElementById('ri-cap').textContent = selectedRecepRoom.cap + ' người';
  document.getElementById('ri-total').textContent = fmt(selectedRecepRoom.price);
}

function updateServicePrice() {
  if (!selectedRecepRoom) return;
  const svc = parseInt(document.getElementById('svc-select').value)||0;
  document.getElementById('ri-svc').textContent = fmt(svc);
  document.getElementById('ri-total').textContent = fmt(selectedRecepRoom.price + svc);
}

let guestIdx = 1;
function addGuest() {
  if (!selectedRecepRoom) { toast('Chọn phòng trước!','error'); return; }
  if (guestIdx >= selectedRecepRoom.cap) { toast('Đã đạt số khách tối đa!','error'); return; }
  const gl = document.getElementById('guests-list');
  const row = document.createElement('div');
  row.className = 'guest-row';
  row.innerHTML = `
    <input class="form-control" placeholder="Họ tên" id="g-name-${guestIdx}">
    <input class="form-control" placeholder="Số CCCD" id="g-id-${guestIdx}">
    <select class="form-control" id="g-type-${guestIdx}" style="min-width:100px"><option>DOMESTIC</option><option>FOREIGN</option><option>VIP</option></select>`;
  gl.appendChild(row);
  guestIdx++;
}

function calcInvoice() {
  if (!selectedRecepRoom) { toast('Chọn phòng trước!','error'); return; }
  const checkout = document.getElementById('rent-checkout').value;
  if (!checkout) { toast('Chọn ngày trả phòng!','error'); return; }
  const svc = parseInt(document.getElementById('svc-select').value)||0;
  const today = new Date(); const out = new Date(checkout);
  const nights = Math.max(1, Math.round((out-today)/86400000));
  const total = selectedRecepRoom.price * nights + svc;

  document.getElementById('invoice-preview').style.display = 'block';
  document.getElementById('invoice-content').innerHTML = `
    <div style="display:flex;justify-content:space-between;margin-bottom:.3rem"><span>Phòng: ${selectedRecepRoom.name}</span></div>
    <div style="display:flex;justify-content:space-between;margin-bottom:.3rem;color:var(--slate)"><span>Số đêm</span><span>${nights}</span></div>
    <div style="display:flex;justify-content:space-between;margin-bottom:.3rem;color:var(--slate)"><span>Đơn giá</span><span>${fmt(selectedRecepRoom.price)}</span></div>
    <div style="display:flex;justify-content:space-between;margin-bottom:.3rem;color:var(--slate)"><span>Dịch vụ</span><span>${fmt(svc)}</span></div>
    <div style="display:flex;justify-content:space-between;font-weight:600;border-top:1px solid var(--cream-dk);padding-top:.4rem;margin-top:.4rem"><span>Tổng cộng</span><span style="color:var(--gold-dk)">${fmt(total)}</span></div>`;
  toast('Đã tính hóa đơn!','success');
}

function printInvoice() { calcInvoice(); toast('Đang in hóa đơn...','info'); }
function showRecepTab(tab) {
  ['rent','checkin','checkout','reservations'].forEach(t => {
    document.getElementById('rtab-content-'+t).style.display = t===tab?'block':'none';
    document.getElementById('rtab-'+t)?.classList.toggle('active', t===tab);
  });
  if (tab==='reservations') renderReceptionist();
}

// ─── ADMIN ──────────────────────────────────────────────────
function renderAdmin() {
  renderBarChart();
  renderBookingsTable();
  renderRoomsAdmin();
  renderEmployees();
  renderServices();
  renderReports();
  renderActivity();
}

function renderBarChart() {
  const data = [180,220,195,260,240,284];
  const months = ['T1','T2','T3','T4','T5','T6'];
  const max = Math.max(...data);
  document.getElementById('revenue-chart').innerHTML = data.map((v,i)=>`
    <div class="bar-wrap">
      <div class="bar" style="height:${Math.round(v/max*120)}px" title="${v}M VND"></div>
      <div class="bar-label">${months[i]}</div>
    </div>`).join('');
}

function renderBookingsTable() {
  document.getElementById('booking-count').textContent = `Tất cả (${BOOKINGS.length})`;
  document.getElementById('bookings-tbody').innerHTML = BOOKINGS.map(b=>`
    <tr>
      <td>#${b.id}</td>
      <td><strong>${b.guest}</strong></td>
      <td>${b.room}</td>
      <td><span class="badge badge-gray">${b.type}</span></td>
      <td>${b.checkin}</td>
      <td>${b.checkout}</td>
      <td>${fmt(b.deposit)}</td>
      <td><span class="badge ${b.paid?'badge-green':'badge-amber'}">${b.paid?'Đã cọc':'Pending'}</span></td>
      <td class="td-actions">
        <button class="btn btn-sm btn-ghost" onclick="toast('Xem chi tiết #${b.id}','info')">Xem</button>
        <button class="btn btn-sm btn-danger" onclick="apiDeleteBooking(${b.id})">Xóa</button>
      </td>
    </tr>`).join('');
}

function filterBookings() {
  const q = document.getElementById('booking-search').value.toLowerCase();
  const filtered = BOOKINGS.filter(b => b.guest.toLowerCase().includes(q) || b.room.toLowerCase().includes(q));
  document.getElementById('bookings-tbody').innerHTML = filtered.map(b=>`
    <tr>
      <td>#${b.id}</td><td><strong>${b.guest}</strong></td><td>${b.room}</td>
      <td><span class="badge badge-gray">${b.type}</span></td>
      <td>${b.checkin}</td><td>${b.checkout}</td><td>${fmt(b.deposit)}</td>
      <td><span class="badge ${b.paid?'badge-green':'badge-amber'}">${b.paid?'Đã cọc':'Pending'}</span></td>
      <td class="td-actions">
        <button class="btn btn-sm btn-ghost">Xem</button>
        <button class="btn btn-sm btn-danger" onclick="apiDeleteBooking(${b.id})">Xóa</button>
      </td>
    </tr>`).join('');
}

function renderRoomsAdmin(filter='') {
  const rooms = filter ? ROOMS.filter(r=>r.type===filter) : ROOMS;
  document.getElementById('rooms-admin-tbody').innerHTML = rooms.map(r=>`
    <tr>
      <td><input type="checkbox"></td>
      <td>#${r.id}</td>
      <td><strong>${r.name}</strong></td>
      <td>${r.type}</td>
      <td>${fmt(r.price)}</td>
      <td><span class="badge ${r.available?'badge-green':'badge-red'}">${r.available?'Còn trống':'Đang thuê'}</span></td>
      <td class="td-actions">
        <button class="btn btn-sm btn-ghost" onclick="toast('Sửa phòng ${r.name}','info')">✏ Sửa</button>
        <button class="btn btn-sm btn-danger" onclick="toast('Xóa phòng ${r.name}','error')">🗑</button>
      </td>
    </tr>`).join('');
}

function filterRooms(v) { renderRoomsAdmin(v); }

function renderEmployees() {
  document.getElementById('employees-tbody').innerHTML = EMPLOYEES.map(e=>`
    <tr>
      <td>#${e.id}</td>
      <td><strong>${e.name}</strong></td>
      <td><span class="badge badge-blue">${e.role}</span></td>
      <td>${e.email}</td>
      <td>${e.phone}</td>
      <td><span class="badge ${e.active?'badge-green':'badge-gray'}">${e.active?'Active':'Inactive'}</span></td>
      <td class="td-actions">
        <button class="btn btn-sm btn-ghost" onclick="toast('Sửa ${e.name}','info')">✏ Sửa</button>
        <button class="btn btn-sm btn-danger" onclick="toast('Xóa nhân viên','error')">🗑</button>
      </td>
    </tr>`).join('');
}

function renderServices() {
  document.getElementById('services-tbody').innerHTML = SERVICES.map(s=>`
    <tr>
      <td>#${s.id}</td>
      <td><strong>${s.name}</strong></td>
      <td style="color:var(--slate)">${s.desc}</td>
      <td>${fmt(s.price)}</td>
      <td>${s.uses}</td>
      <td>${fmt(s.revenue)}</td>
      <td class="td-actions">
        <button class="btn btn-sm btn-ghost">✏ Sửa</button>
      </td>
    </tr>`).join('');
}

function renderReports() {
  document.getElementById('report-tbody').innerHTML = REPORT_DATA.map(r=>`
    <tr>
      <td><strong>${r.type}</strong></td>
      <td>${r.bookings}</td>
      <td>${r.nights}</td>
      <td>${fmt(r.revenue)}</td>
      <td>
        <div style="display:flex;align-items:center;gap:.4rem">
          <div style="flex:1;height:6px;background:var(--cream-dk);border-radius:3px">
            <div style="width:${Math.round(r.revenue/REPORT_DATA.reduce((a,x)=>a+x.revenue,0)*100)}%;height:100%;background:var(--gold);border-radius:3px"></div>
          </div>
          <span style="font-size:.75rem">${Math.round(r.revenue/REPORT_DATA.reduce((a,x)=>a+x.revenue,0)*100)}%</span>
        </div>
      </td>
    </tr>`).join('');
}

function renderActivity() {
  document.getElementById('activity-tbody').innerHTML = ACTIVITY.map(a=>`
    <tr>
      <td style="color:var(--slate)">${a.time}</td>
      <td><strong>${a.action}</strong></td>
      <td>${a.user}</td>
      <td style="color:var(--slate)">${a.detail}</td>
    </tr>`).join('');
}

function showAdminTab(tab) {
  ['dashboard','bookings','rooms','reports','employees','services'].forEach(t => {
    document.getElementById('atab-content-'+t).style.display = t===tab?'block':'none';
    document.getElementById('atab-'+t)?.classList.toggle('active', t===tab);
  });
}

// ─── MODALS ─────────────────────────────────────────────────
function showModal(id) { document.getElementById(id).classList.remove('hidden'); }
function hideModal(id) { document.getElementById(id).classList.add('hidden'); }
document.querySelectorAll('.modal-bg').forEach(m => {
  m.addEventListener('click', e => { if (e.target === m) m.classList.add('hidden'); });
});

// ─── TOAST ──────────────────────────────────────────────────
function toast(msg, type='info') {
  const c = document.getElementById('toast-container');
  const t = document.createElement('div');
  t.className = `toast ${type}`;
  const icons = {success:'✓',error:'✕',info:'ℹ'};
  t.innerHTML = `<span>${icons[type]||'ℹ'}</span><span>${msg}</span>`;
  c.appendChild(t);
  setTimeout(() => { t.style.opacity='0'; t.style.transition='opacity .3s'; setTimeout(()=>t.remove(),300); }, 3000);
}

// Set default dates
const _today = new Date().toISOString().split('T')[0];
const _tom   = new Date(Date.now()+86400000).toISOString().split('T')[0];
const _week  = new Date(Date.now()+7*86400000).toISOString().split('T')[0];
document.getElementById('book-in').value  = _tom;
document.getElementById('book-out').value = _week;
document.getElementById('search-in').value  = _today;
document.getElementById('search-out').value = _week;
document.getElementById('rent-checkout').value = _week;