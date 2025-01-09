# Flutter Dynamic Form Builder

Ce package vous permet d'utiliser des modèles de formulaires créés avec [jQuery formBuilder](https://formbuilder.online/) dans les applications Flutter. Il convertit les données de formulaire au format JSON en widgets Flutter.
<p align="center">
  <a href="https://www.buymeacoffee.com/mancir" target="_blank">
    <img src="https://cdn.buymeacoffee.com/buttons/v2/default-black.png" alt="Buy Me A Coffee ;)" text="get" height="50">
  </a>
</p>
## Pour Commencer

1. Ajoutez le package à votre projet :

```yaml
dependencies:
  dynamic_form_builder: ^0.0.1
```

2. Importez le package :

```dart
import 'package:dynamic_form_builder/dynamic_form_builder.dart';
```

## Utilisation

Vous pouvez utiliser directement les données JSON de jQuery formBuilder :

```dart
// Données JSON de formBuilder.io
final formData = [
  {
    "type": "text",
    "required": true,
    "label": "Nom Complet",
    "name": "fullname",
    "placeholder": "Entrez votre nom complet"
  },
  {
    "type": "email",
    "required": true,
    "label": "Email",
    "name": "email",
    "placeholder": "Entrez votre adresse email"
  }
];

// Widget de formulaire
DynamicFormBuilder(
  formData: formData,
  locale: const Locale('fr'),//fr, en(default), tr, ru, it, az, ar, pt
  onSubmit: (values) {
    print(values); // Afficher les valeurs du formulaire
  },
)
```

Pour plus d'exemples, consultez le répertoire [exemple](./example).

## Personnalisation

Vous pouvez utiliser le paramètre de thème pour personnaliser l'apparence du formulaire :

```dart
DynamicFormBuilder(
  formData: formData,
  locale: const Locale('fr'),
  theme: FormBuilderTheme(
    inputDecoration: InputDecoration(
      border: OutlineInputBorder(),
      filled: true,
    ),
    spacing: 16.0,
    padding: EdgeInsets.all(16.0),
  ),
  onSubmit: (values) {
    // Opérations du formulaire
  },
)
```

## Informations Supplémentaires

- Vous pouvez utiliser les données JSON obtenues de FormBuilder.io.

### Langues Prises en Charge

- Anglais (en)
- Français (fr)
- Turc (tr)
- Russe (ru)
- Italien (it)
- Azerbaïdjanais (az)
- Arabe (ar)
- Portugais (pt)

### Éléments de Formulaire Pris en Charge

| Type d'Élément | Propriétés |
|----------------|------------|
| Champ de texte | validation, placeholder, obligatoire |
| Zone de texte | lignes, longueur maximale, obligatoire |
| Sélection | multiple, options, obligatoire |
| Groupe radio | en ligne, options, autre |
| Groupe de cases | en ligne, options, basculer |
| Auto-complétion | options, obligatoire |
| Sélecteur de date | min, max, format |
| Entrée numérique | min, max, pas |
| Téléchargement | multiple, accepter |
| Bouton | style, au clic |
| En-tête | taille (h1-h6) |
| Paragraphe | texte |
| Caché | valeur |

### Contribution

1. Forkez le projet
2. Créez une branche de fonctionnalité (`git checkout -b feature/nouvelle-fonctionnalite`)
3. Committez vos changements (`git commit -m 'feat: Ajout nouvelle fonctionnalité'`)
4. Poussez vers la branche (`git push origin feature/nouvelle-fonctionnalite`)
5. Ouvrez une Pull Request

### Licence

Licence MIT - les détails peuvent être trouvés dans le fichier [LICENSE](LICENSE).

### Historique des Versions

- 0.0.1
  - Version initiale
  - Support des éléments de formulaire de base
  - Validation de formulaire
  - Personnalisation du thème
