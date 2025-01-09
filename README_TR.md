
# Flutter Dynamic Form Builder

Bu paket, [jQuery formBuilder](https://formbuilder.online/) ile oluşturulan form şablonlarını Flutter uygulamalarında kullanmanızı sağlar. JSON formatındaki form verilerini Flutter widget'larına dönüştürür.

<p align="center">
  <a href="https://www.buymeacoffee.com/mancir" target="_blank">
    <img src="https://cdn.buymeacoffee.com/buttons/v2/default-black.png" alt="Buy Me A Coffee ;)" text="get" height="50">
  </a>
</p>

## Özellikler

✅ JSON verilerinden dinamik form oluşturma
✅ Form validasyonu
✅ Özelleştirilebilir tema desteği
✅ 12+ form elementi desteği:

- Text Field
- Textarea
- Select (Dropdown)
- Radio Group
- Checkbox Group
- Autocomplete
- Date Picker
- Number Input
- File Upload
- Button
- Header
- Paragraph
- Hidden Field


## Başlarken

1. Paketi projenize ekleyin:

```yaml
dependencies:
  json_form_builder: ^0.0.2
```

2. Paketi import edin:

```dart
import 'package:json_form_builder/json_form_builder.dart';
```

## Kullanım

jQuery formBuilder'dan aldığınız JSON verisini doğrudan kullanabilirsiniz:

```dart
// formBuilder.io'dan alınan JSON verisi
final formData = [
  {
    "type": "text",
    "required": true,
    "label": "Ad Soyad",
    "name": "fullname",
    "placeholder": "Adınızı ve soyadınızı giriniz"
  },
  {
    "type": "email",
    "required": true,
    "label": "E-posta",
    "name": "email",
    "placeholder": "E-posta adresinizi giriniz"
  }
];

// Form widget'ı
json_form_builder(
  formData: formData,
  locale: const Locale('tr'),//tr, en(default), ru, fr, it, az, ar, pt
  onSubmit: (values) {
    print(values); // Form değerlerini yazdır
  },
)
```

Daha fazla örnek için [example](./example) klasörüne bakabilirsiniz.

## Özelleştirme

Form görünümünü özelleştirmek için tema parametresini kullanabilirsiniz:

```dart
json_form_builder(
  formData: formData,
  locale: const Locale('tr'),
  theme: FormBuilderTheme(
    inputDecoration: InputDecoration(
      border: OutlineInputBorder(),
      filled: true,
    ),
    spacing: 16.0,
    padding: EdgeInsets.all(16.0),
  ),
  onSubmit: (values) {
    // Form işlemleri
  },
)
```

## Ek Bilgiler

- FormBuilder.io'dan alınan JSON verisini kullanabilirsiniz.


## Diller

- English (en)
- Turkish (tr)
- Russian (ru)
- French (fr)
- Italian (it)
- Azerbaijani (az)
- Arabic (ar)
- Portuguese (pt)

### Desteklenen Form Elementleri

| Element Tipi | Özellikler |
|--------------|------------|
| Text Field | validation, placeholder, required |
| Textarea | rows, maxLength, required |
| Select | multiple, options, required |
| Radio Group | inline, options, other |
| Checkbox Group | inline, options, toggle |
| Autocomplete | options, required |
| Date Picker | min, max, format |
| Number Input | min, max, step |
| File Upload | multiple, accept |
| Button | style, onClick |
| Header | size (h1-h6) |
| Paragraph | text |
| Hidden | value |

### Katkıda Bulunma

1. Fork yapın
2. Feature branch oluşturun (`git checkout -b feature/amazing-feature`)
3. Değişikliklerinizi commit edin (`git commit -m 'feat: Add amazing feature'`)
4. Branch'inizi push edin (`git push origin feature/amazing-feature`)
5. Pull Request oluşturun

### Lisans

MIT License - detaylar için [LICENSE](LICENSE) dosyasına bakın.

### İletişim

- GitHub Issues: [Issues](https://github.com/yourusername/json_form_builder/issues)
- E-posta: your.email@example.com

### Sürüm Geçmişi

- 0.0.1
  - İlk sürüm
  - Temel form elementleri desteği
  - Form validasyonu
  - Tema özelleştirme
- 0.0.2
  - Çok dilli destek
  - Form taşması sorunu
  - Form doğrulama iyileştirmesi
  - Yeni form elementleri
