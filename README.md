# Mini Katalog Uygulaması (Software Persona E-Commerce)

Bu proje; 5 günlük Flutter mühendislik eğitimi kapsamında geliştirilmiş, harici state management kütüphanelerine bağımlılığı bulunmayan, katmanlı mimariye (Layered Architecture) ve Null-Safety standartlarına tam uyumlu bir e-ticaret katalog uygulamasıdır.

## 🚀 Özellikler
- **Login Ekranı**: Form validasyonları ve `shared_preferences` entegrasyonu ile yerel veri saklama.
- **Keşfet (Home) Ekranı**: Banner alanı, arama çubuğu, `GridView.builder` ile 2 sütunlu ürün listesi ve `Hero` animasyonları.
- **Ürün Detay Ekranı**: Dinamik görsel geçişi, ürün teknik bilgileri ve sepete ekleme aksiyonu (`SnackBar` bildirimi).
- **Sepet Ekranı**: `ListView.builder` ile eklenen ürünlerin listelenmesi, anlık ürün çıkarma, dinamik sepet rozeti (badge) ve boş sepet durumu (`CartEmptyBox`).

## 🛠️ Kullanılan Teknolojiler ve Bağımlılıklar
- **Flutter SDK**: `>=3.0.0 <4.0.0` (Material 3)
- **http**: `^1.2.0` (REST API veri çekme)
- **shared_preferences**: `^2.2.2` (Yerel veri saklama)
- **cupertino_icons**: `^1.0.6`

## ⚙️ Kurulum ve Çalıştırma

1. Bağımlılıkları yükleyin:
   ```bash
   flutter pub get
   ```

2. Uygulamayı simülatörde veya bağlı cihazda başlatın:
   ```bash
   flutter run
   ```

## 📦 Dağıtım (Production Build) Komutları

- **Android APK (Split ABI)**:
  ```bash
  flutter build apk --split-per-abi
  ```
- **Android App Bundle (Google Play)**:
  ```bash
  flutter build appbundle
  ```
- **iOS IPA (App Store)**:
  ```bash
  flutter build ipa
  ```
