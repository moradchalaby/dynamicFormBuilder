# منشئ النماذج الديناميكي Flutter

تتيح لك هذه الحزمة استخدام نماذج النماذج التي تم إنشاؤها باستخدام [jQuery formBuilder](https://formbuilder.online/) في تطبيقات Flutter. تحول بيانات النموذج بتنسيق JSON إلى عناصر واجهة Flutter.
<p align="center">
  <a href="https://www.buymeacoffee.com/mancir" target="_blank">
    <img src="https://cdn.buymeacoffee.com/buttons/v2/default-black.png" alt="Buy Me A Coffee ;)" text="get" height="50">
  </a>
</p>
## البدء

1. أضف الحزمة إلى مشروعك:

```yaml
dependencies:
  dynamic_form_builder: ^0.0.1
```

2. قم باستيراد الحزمة:

```dart
import 'package:dynamic_form_builder/dynamic_form_builder.dart';
```

## الاستخدام

يمكنك استخدام بيانات JSON مباشرة من jQuery formBuilder:

```dart
// بيانات JSON من formBuilder.io
final formData = [
  {
    "type": "text",
    "required": true,
    "label": "الاسم الكامل",
    "name": "fullname",
    "placeholder": "أدخل اسمك الكامل"
  },
  {
    "type": "email",
    "required": true,
    "label": "البريد الإلكتروني",
    "name": "email",
    "placeholder": "أدخل عنوان بريدك الإلكتروني"
  }
];

// النموذج
DynamicFormBuilder(
  formData: formData,
  onSubmit: (values) {
    print(values); // طباعة قيم النموذج
  },
)
```

لمزيد من الأمثلة، راجع دليل [example](./example).

## التخصيص

يمكنك استخدام معلمة النسق لتخصيص مظهر النموذج:

```dart
DynamicFormBuilder(
  formData: formData,
  locale: const Locale('ar'),//ar, en(default), tr, ru, fr, it, az, pt
  theme: FormBuilderTheme(
    inputDecoration: InputDecoration(
      border: OutlineInputBorder(),
      filled: true,
    ),
    spacing: 16.0,
    padding: EdgeInsets.all(16.0),
  ),
  onSubmit: (values) {
    // عمليات النموذج
  },
)
```

## معلومات إضافية

- يمكنك استخدام البيانات JSON التي تم الحصول عليها من FormBuilder.io.

### اللغات المدعومة

- العربية (ar)
- الإنجليزية (en)
- التركية (tr)
- الروسية (ru)
- الفرنسية (fr)
- الإيطالية (it)
- الأردنية (az)
- البرتغالية (pt)

### عناصر النموذج المدعومة

| نوع العنصر | الخصائص |
|--------------|------------|
| حقل النص | التحقق، النص التوضيحي، مطلوب |
| منطقة النص | الصفوف، الحد الأقصى للطول، مطلوب |
| القائمة المنسدلة | متعدد، خيارات، مطلوب |
| مجموعة الراديو | مضمن، خيارات، أخرى |
| مجموعة خانات الاختيار | مضمن، خيارات، تبديل |
| الإكمال التلقائي | خيارات، مطلوب |
| منتقي التاريخ | الحد الأدنى، الحد الأقصى، التنسيق |
| إدخال الأرقام | الحد الأدنى، الحد الأقصى، الخطوة |
| تحميل الملفات | متعدد، قبول |
| زر | النمط، عند النقر |
| عنوان | الحجم (h1-h6) |
| فقرة | النص |
| مخفي | القيمة |

### المساهمة

1. انسخ المشروع
2. أنشئ فرعًا للميزة (`git checkout -b feature/amazing-feature`)
3. قم بتأكيد تغييراتك (`git commit -m 'feat: Add amazing feature'`)
4. ادفع إلى الفرع (`git push origin feature/amazing-feature`)
5. افتح طلب سحب

### الترخيص

ترخيص MIT - يمكن العثور على التفاصيل في ملف [LICENSE](LICENSE).

### تاريخ الإصدارات

- 0.0.1
  - الإصدار الأولي
  - دعم عناصر النموذج الأساسية
  - التحقق من صحة النموذج
  - تخصيص النسق
