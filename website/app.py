from flask import Flask, render_template, request, jsonify

app = Flask(__name__)

# 1. ROUTE GIAO DIỆN: Khi người dùng vào link gốc, Flask sẽ gọi file index.html
@app.route('/')
def home():
    # Flask tự động tìm file index.html trong thư mục "templates"
    return render_template('index.html')

# 2. CÁC ĐƯỜNG DẪN API (Nơi JS gọi fetch)
@app.route('/api/initial-data', methods=['GET'])
def get_initial_data():
    # Demo data trả về cho Frontend
    mock_data = {
        "rooms": [
            {"id": 1, "name": "Grand Deluxe Room", "type": "Double Bed Room", "price": 12000000, "cap": 2, "available": True, "features": ["City View", "WiFi"]}
        ],
        "bookings": [],
        # Lấy data thật từ database ở đây...
    }
    return jsonify(mock_data), 200

# Chạy server
if __name__ == '__main__':
    # Chạy ở cổng 5000, bật debug để tự động cập nhật khi sửa code
    app.run(debug=True, port=5000)