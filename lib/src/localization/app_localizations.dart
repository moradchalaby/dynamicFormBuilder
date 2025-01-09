import 'package:flutter/material.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  static final Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'fieldRequired': 'This field is required',
      'selectDate': 'Select Date',
      'cancel': 'Cancel',
      'ok': 'OK',
      'pickColor': 'Pick Color',
      'submit': 'Submit',
      'error': 'Error',
      'success': 'Success',
      'fieldInvalidEmail': 'Enter a valid email address',
      'fieldInvalidPhone': 'Enter a valid phone number',
    },
    'tr': {
      'fieldRequired': 'Bu alan zorunludur',
      'selectDate': 'Tarih Seçin',
      'cancel': 'İptal',
      'ok': 'Tamam',
      'pickColor': 'Renk Seç',
      'submit': 'Gönder',
      'error': 'Hata',
      'success': 'Başarılı',
      'fieldInvalidEmail': 'Geçerli bir e-posta adresi giriniz',
      'fieldInvalidPhone': 'Geçerli bir telefon numarası giriniz',
    },
    'de': {
      'fieldRequired': 'Dieses Feld ist erforderlich',
      'selectDate': 'Datum auswählen',
      'cancel': 'Abbrechen',
      'ok': 'OK',
      'pickColor': 'Farbe auswählen',
      'submit': 'Senden',
      'error': 'Fehler',
      'success': 'Erfolg',
      'fieldInvalidEmail': 'Gültige E-Mail-Adresse eingeben',
      'fieldInvalidPhone': 'Gültige Telefonnummer eingeben',
    },
    'fr': {
      'fieldRequired': 'Ce champ est obligatoire',
      'selectDate': 'Sélectionner une date',
      'cancel': 'Annuler',
      'ok': 'OK',
      'pickColor': 'Sélectionner une couleur',
      'submit': 'Envoyer',
      'error': 'Erreur',
      'success': 'Succès',
      'fieldInvalidEmail': 'Entrez une adresse e-mail valide',
      'fieldInvalidPhone': 'Entrez un numéro de téléphone valide',
    },
    'it': {
      'fieldRequired': 'Questo campo è obbligatorio',
      'selectDate': 'Seleziona una data',
      'cancel': 'Annulla',
      'ok': 'OK',
      'pickColor': 'Seleziona un colore',
      'submit': 'Invia',
      'error': 'Errore',
      'success': 'Successo',
      'fieldInvalidEmail': 'Inserisci un\'indirizzo e-mail valido',
      'fieldInvalidPhone': 'Inserisci un numero di telefono valido',
    },
    'ru': {
      'fieldRequired': 'Это поле обязательно',
      'selectDate': 'Выберите дату',
      'cancel': 'Отмена',
      'ok': 'OK',
      'pickColor': 'Выберите цвет',
      'submit': 'Отправить',
      'error': 'Ошибка',
      'success': 'Успех',
      'fieldInvalidEmail': 'Введите действительный адрес электронной почты',
      'fieldInvalidPhone': 'Введите действительный номер телефона',
    },
    'az': {
      'fieldRequired': 'Bu alan zorunludur',
      'selectDate': 'Tarix seçin',
      'cancel': 'İmtina',
      'ok': 'OK',
      'pickColor': 'Renk seç',
      'submit': 'Gönder',
      'error': 'Xəta',
      'success': 'Uğur',
      'fieldInvalidEmail': 'Uçuş kodunu düzgün daxil edin',
      'fieldInvalidPhone': 'Uçuş kodunu düzgün daxil edin',
    },
    'ar': {
      'fieldRequired': 'هذا الحقل مطلوب',
      'selectDate': 'اختر التاريخ',
      'cancel': 'إلغاء',
      'ok': 'OK',
      'pickColor': 'اختر اللون',
      'submit': 'إرسال',
      'error': 'خطأ',
      'success': 'نجاح',
      'fieldInvalidEmail': 'أدخل عنوان بريد إلكتروني صالح',
      'fieldInvalidPhone': 'أدخل رقم هاتف صالح',
    },
    'pt': {
      'fieldRequired': 'Este campo é obrigatório',
      'selectDate': 'Selecione uma data',
      'cancel': 'Cancelar',
      'ok': 'OK',
      'pickColor': 'Selecione uma cor',
      'submit': 'Enviar',
      'error': 'Erro',
      'success': 'Sucesso',
      'fieldInvalidEmail': 'Insira um endereço de e-mail válido',
      'fieldInvalidPhone': 'Insira um número de telefone válido',
    },
  };

  String get fieldRequired =>
      _localizedValues[locale.languageCode]!['fieldRequired']!;
  String get selectDate =>
      _localizedValues[locale.languageCode]!['selectDate']!;
  String get cancel => _localizedValues[locale.languageCode]!['cancel']!;
  String get ok => _localizedValues[locale.languageCode]!['ok']!;
  String get pickColor => _localizedValues[locale.languageCode]!['pickColor']!;
  String get submit => _localizedValues[locale.languageCode]!['submit']!;
  String get error => _localizedValues[locale.languageCode]!['error']!;
  String get success => _localizedValues[locale.languageCode]!['success']!;
  String fieldMin(int min) => _localizedValues[locale.languageCode]!['fieldMin']!;
  String fieldMax(int max) => _localizedValues[locale.languageCode]!['fieldMax']!;
  String get fieldInvalidEmail => _localizedValues[locale.languageCode]!['fieldInvalidEmail']!;
  String get fieldInvalidPhone => _localizedValues[locale.languageCode]!['fieldInvalidPhone']!;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'tr', 'de', 'fr', 'it', 'ru', 'az', 'ar', 'pt'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
