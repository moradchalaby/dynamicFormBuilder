# Flutter Dynamic Form Builder

Dieses Paket ermöglicht es Ihnen, mit [jQuery formBuilder](https://formbuilder.online/) erstellte Formularvorlagen in Flutter-Anwendungen zu verwenden. Es konvertiert Formulardaten im JSON-Format in Flutter-Widgets.
<p align="center">
  <a href="https://www.buymeacoffee.com/mancir" target="_blank">
    <img src="https://cdn.buymeacoffee.com/buttons/v2/default-black.png" alt="Buy Me A Coffee ;)" text="get" height="50">
  </a>
</p>
## Erste Schritte

1. Fügen Sie das Paket Ihrem Projekt hinzu:

```yaml
dependencies:
  json_form_builder: ^0.0.2
```

2. Importieren Sie das Paket:

```dart
import 'package:json_form_builder/json_form_builder.dart';
```

## Verwendung

Sie können die JSON-Daten direkt von jQuery formBuilder verwenden:

```dart
// JSON-Daten von formBuilder.io
final formData = [
  {
    "type": "text",
    "required": true,
    "label": "Vollständiger Name",
    "name": "fullname",
    "placeholder": "Geben Sie Ihren vollständigen Namen ein"
  },
  {
    "type": "email",
    "required": true,
    "label": "E-Mail",
    "name": "email",
    "placeholder": "Geben Sie Ihre E-Mail-Adresse ein"
  }
];

// Formular-Widget
json_form_builder(
  formData: formData,
  locale: const Locale('de'),
  onSubmit: (values) {
    print(values); // Formulardaten ausgeben
  },
)
```

Weitere Beispiele finden Sie im [Beispiel](./example)-Verzeichnis.

## Anpassung

Sie können den Theme-Parameter verwenden, um das Erscheinungsbild des Formulars anzupassen:

```dart
json_form_builder(
  formData: formData,
  locale: const Locale('de'),
  theme: FormBuilderTheme(
    inputDecoration: InputDecoration(
      border: OutlineInputBorder(),
      filled: true,
    ),
    spacing: 16.0,
    padding: EdgeInsets.all(16.0),
  ),
  onSubmit: (values) {
    // Formularoperationen
  },
)
```

## Zusätzliche Informationen

- Sie können die JSON-Daten von FormBuilder.io verwenden.

### Unterstützte Sprachen

- Englisch (en)
- Deutsch (de)
- Türkisch (tr)
- Russisch (ru)
- Französisch (fr)
- Italienisch (it)
- Aserbaidschanisch (az)
- Arabisch (ar)
- Portugiesisch (pt)

### Unterstützte Formularelemente

| Elementtyp | Eigenschaften |
|------------|---------------|
| Textfeld | Validierung, Platzhalter, Pflichtfeld |
| Textbereich | Zeilen, maximale Länge, Pflichtfeld |
| Auswahl | Mehrfachauswahl, Optionen, Pflichtfeld |
| Radiogruppe | Inline, Optionen, Sonstiges |
| Checkbox-Gruppe | Inline, Optionen, Umschalten |
| Autovervollständigung | Optionen, Pflichtfeld |
| Datumsauswahl | Min, Max, Format |
| Zahleneingabe | Min, Max, Schritt |
| Datei-Upload | Mehrfach, Akzeptieren |
| Schaltfläche | Stil, Beim Klicken |
| Überschrift | Größe (h1-h6) |
| Absatz | Text |
| Versteckt | Wert |

### Mitwirken

1. Forken Sie das Projekt
2. Erstellen Sie einen Feature-Branch (`git checkout -b feature/tolle-funktion`)
3. Committen Sie Ihre Änderungen (`git commit -m 'feat: Tolle Funktion hinzugefügt'`)
4. Pushen Sie zum Branch (`git push origin feature/tolle-funktion`)
5. Öffnen Sie einen Pull Request

### Lizenz

MIT-Lizenz - Details finden Sie in der [LICENSE](LICENSE)-Datei.

### Versionshistorie

- 0.0.1
  - Erstveröffentlichung
  - Unterstützung grundlegender Formularelemente
  - Formularvalidierung
  - Theme-Anpassung
- 0.0.2
  - Mehrsprachige Unterstützung
  - Formularüberlaufproblem
  - Verbesserte Formularvalidierung
  - Neue Formularelemente
