class FormTranslations {
  final String required;
  final String invalidEmail;
  final String invalidPhone;
  final String submit;
  final String cancel;
  final String selectFile;
  final String chooseDate;

  const FormTranslations(item,{
    this.required = 'Bu alan zorunludur',
    this.invalidEmail = 'Geçerli bir e-posta adresi giriniz',
    this.invalidPhone = 'Geçerli bir telefon numarası giriniz',
    this.submit = 'Gönder',
    this.cancel = 'İptal',
    this.selectFile = 'Dosya Seç',
    this.chooseDate = 'Tarih Seç',
  });
} 