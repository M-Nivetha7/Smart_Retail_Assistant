# 🛒 Smart Shopping Cart

An AI-powered Smart Shopping Cart system built using Flutter with a Flask backend.  
It helps users quickly search products, manage cart items, track expenses, and navigate store aisles efficiently.

---

## 🚀 Features

- 🔍 Smart product search and filtering
- 🛒 Shopping cart system with total price calculation
- 🗺 Store aisle navigation UI
- 🤖 ML-ready backend (Flask API for recommendations)
- 📦 Scalable product dataset support
- 🎨 Clean and modern UI (Material Design)

---

## 🧠 Tech Stack

- Flutter (Frontend UI)
- Dart
- Python (Backend + ML logic)
- Flask (API server)
- Android Emulator / Web / Desktop support

---

<img width="372" height="759" alt="Screenshot 2026-05-26 at 11 42 13 AM" src="https://github.com/user-attachments/assets/7be8d04e-b37a-47b4-a6de-6dc5e8da13cf" />

<img width="337" height="735" alt="Screenshot 2026-05-26 at 11 56 30 AM" src="https://github.com/user-attachments/assets/7f764d17-a3d3-4b8d-aabf-87f8c2f82da2" />



# 📁 Project Structure

```bash
Smart_Retail_Assistant/
│
├── lib/
│   ├── data/
│   │   ├── cart.dart
│   │   ├── cart_data.dart
│   │   └── products.dart
│   │
│   ├── models/
│   │   └── product.dart
│   │
│   ├── screens/
│   │   ├── home_screen.dart
│   │   ├── search_screen.dart
│   │   ├── cart.dart
│   │   ├── navigation_screen.dart
│   │   ├── payment_qr.dart
│   │   └── map_screen.dart
│   │
│   ├── services/
│   │   ├── api_service.dart
│   │   └── api.dart
│   │
│   ├── widgets/
│   │   └── product_tile.dart
│   │
│   ├── ml/
│   │   └── recommender.dart
│   │
│   └── main.dart
│
├── smart_backend/
│   ├── app.py
│   ├── ml_model.py
│   └── graph.py
│
├── android/
├── ios/
├── web/
├── windows/
├── linux/
├── macos/
│
├── pubspec.yaml
├── pubspec.lock
└── README.md

```
---

## ⚙️ Setup Instructions

### 1️⃣ Clone the Repository

```bash
git clone https://github.com/M-Nivetha7/Smart_Retail_Assistant.git
cd Smart_Retail_Assistant
2️⃣ Install Flutter Dependencies
flutter pub get
3️⃣ Run Flutter App (Android Emulator)
flutter emulators --launch Pixel_6_API_30
flutter run -d emulator-5554

OR

flutter run
🧪 Run Backend (Flask API)
cd smart_backend

python3 -m venv venv
source venv/bin/activate

pip install flask
python app.py
```

📱 Supported Platforms
📱 Android Emulator
🌐 Web (Chrome)
🖥 macOS Desktop
🪟 Windows Desktop
🎯 Project Objective

This system solves real supermarket problems:

⏱ Reduces time spent searching products
🛍 Improves shopping experience
🧾 Helps track expenses efficiently
🚶 Provides aisle-based navigation
🤖 Enables AI-based product recommendations
🔥 Future Improvements
Real ML model (Apriori algorithm)
Shortest path navigation (Dijkstra algorithm)
Barcode scanning system
Voice-based product search
Smart billing system
👩‍💻 Author

Nivetha
Smart Retail Assistant Project 🚀
