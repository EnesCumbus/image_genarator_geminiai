# 🖼️ Flutter Image Generator Uygulaması 🚀

Bu Flutter uygulaması, Hugging Face API kullanarak metin girdilerine göre resim üretebilen bir araçtır. Kullanıcı dostu arayüzü ile kolay bir şekilde görüntü oluşturabilirsiniz. ✨

---

## 🌟 Özellikler
- **Metin Girdisi ile Resim Oluşturma:** Kullanıcıdan alınan metin girdisi (prompt) ile AI destekli resimler oluşturur.
- **Canlı Önizleme:** Oluşturulan resim, uygulama arayüzünde görüntülenir.
- **Hata Yönetimi:** API hatalarına karşı uyarı mesajları ve kullanıcı dostu hata bildirimleri.

---

## 🛠️ Gereksinimler
Uygulamayı çalıştırmadan önce aşağıdaki gereksinimlerin karşılandığından emin olun:

1. **Flutter SDK** kurulu olmalıdır.
2. **Hugging Face API Anahtarı**: [Hugging Face](https://huggingface.co/) üzerinden bir API anahtarı alın.

---

## 🚀 Kurulum ve Çalıştırma

1. Projeyi klonlayın veya indirin:
   ```bash
   git clone https://github.com/EnesCumbus/image_genarator_geminiai.git
   cd image_genarator_geminiai
   ```

2. Kod düzenleme aracıyla (ör. Visual Studio Code) projeyi açın.

3. **API Anahtarını Güncelleyin:**
   `_ImageGenerationScreenState` sınıfındaki `apiKey` değişkenini Hugging Face API anahtarınız ile değiştirin:
   ```dart
   final String apiKey = 'YOUR_HUGGING_FACE_API_KEY';
   ```

4. Flutter bağımlılıklarını indirin:
   ```bash
   flutter pub get
   ```

5. Uygulamayı çalıştırın:
   ```bash
   flutter run
   ```

---

## 📚 Kullanım

1. Metin alanına, oluşturmak istediğiniz resim için bir açıklama girin (örneğin: "Gün batımında bir şehir").
2. **"Generate Image"** butonuna tıklayın.
3. Oluşturulan resmi uygulama ekranında görüntüleyin.

---

## 🔧 Kütüphaneler ve Araçlar
Bu proje aşağıdaki Flutter paketlerini kullanır:
- `http`: HTTP isteklerini gerçekleştirmek için.
- `flutter/material.dart`: UI tasarımı için temel Flutter bileşenleri.

---

## Hata Yönetimi
Uygulama, aşağıdaki gibi durumlar için hata mesajları görüntüler:
- Geçersiz veya eksik API anahtarı.
- Ağ bağlantı hataları.
- API limit aşımları.

Hata durumunda ekranda bir hata diyalogu belirir ve kullanıcı bilgilendirilir.

---

## Katkıda Bulunma
Projeyi geliştirmek veya yeni özellikler eklemek için katkıda bulunabilirsiniz.



![Ekran görüntüsü 2024-12-13 010641](https://github.com/user-attachments/assets/9a1f95ab-032d-41c0-8620-b126cad197c5)


![Ekran görüntüsü 2024-12-13 010734](https://github.com/user-attachments/assets/4fcea3c7-481d-4b1d-b13e-fa34ad8f5aa8)


![Ekran görüntüsü 2024-12-13 010959](https://github.com/user-attachments/assets/01bafac2-6ca4-4146-bb51-6b9f2362abd0)
