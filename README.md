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

## 📁 Project Structure


lib/
├── data/ # Product and cart data
├── models/ # Data models
├── screens/ # UI screens (Home, Search, Cart, Map)
├── services/ # API services
└── main.dart # App entry point

smart_backend/
├── app.py # Flask API
├── ml_model.py # Recommendation logic
└── graph.py # Navigation logic


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
