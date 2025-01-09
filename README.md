# Flutter Dynamic Form Builder

This package allows you to use form templates created with [jQuery formBuilder](https://formbuilder.online/) in Flutter applications. It converts JSON format form data into Flutter widgets.
<p align="center">
  <a href="https://www.buymeacoffee.com/mancir" target="_blank">
    <img src="https://cdn.buymeacoffee.com/buttons/v2/default-black.png" alt="Buy Me A Coffee ;)" text="get" height="50">
  </a>
</p>
## Features

✅ Dynamic form creation from JSON data
✅ Form validation
✅ Customizable theme support
✅ 12+ form elements support:

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

## Getting Started

1. Add the package to your project:

```yaml
dependencies:
  json_form_builder: ^0.0.1
```

2. Import the package:

```dart
import 'package:json_form_builder/json_form_builder.dart';
```

## Usage

You can directly use the JSON data from jQuery formBuilder:

```dart
// JSON data from formBuilder.io
final formData = [
  {
    "type": "text",
    "required": true,
    "label": "Full Name",
    "name": "fullname",
    "placeholder": "Enter your full name"
  },
  {
    "type": "email",
    "required": true,
    "label": "Email",
    "name": "email",
    "placeholder": "Enter your email address"
  }
];

// Form widget
json_form_builder(
  formData: formData,
  locale: const Locale('tr'),//tr, en(default), ru, fr, it, az, ar, pt
  onSubmit: (values) {
    print(values); // Print form values
  },
)
```

For more examples, check the [example](./example) directory.

## Customization

You can use the theme parameter to customize the form appearance:

```dart
json_form_builder(
  formData: formData,
  locale: const Locale('tr'),//tr, en(default), ru, fr, it, az, ar, pt
  theme: FormBuilderTheme(
    inputDecoration: InputDecoration(
      border: OutlineInputBorder(),
      filled: true,
    ),
    spacing: 16.0,
    padding: EdgeInsets.all(16.0),
  ),
  onSubmit: (values) {
    // Form operations
  },
)
```

## Additional Information
- You can use JSON data obtained from FormBuilder.io.

### Supported Languages

- English (en)
- Turkish (tr)
- Russian (ru)
- French (fr)
- Italian (it)
- Azerbaijani (az)
- Arabic (ar)
- Portuguese (pt)

### Supported Form Elements

| Element Type | Properties |
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

### Contributing

1. Fork the project
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'feat: Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### License

MIT License - details can be found in the [LICENSE](LICENSE) file.

### Contact

- GitHub Issues: [Issues](https://github.com/moradchalaby/json_form_builder/issues)
- Email: mrdcelebi@gmail.com

### Version History

- 0.0.1
  - Initial release
  - Basic form elements support
  - Form validation
  - Theme customization
