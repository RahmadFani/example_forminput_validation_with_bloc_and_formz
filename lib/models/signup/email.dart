
part of 'signup.dart';

enum EmailInputError {
  empty,
  wrongInputFormat,
  alreadyInUse
}

class EmailInput extends FormzInput<String, EmailInputError> {



  const EmailInput.pure({this.loading = false, this.customError}) : super.pure('');

  const EmailInput.dirty({String value = '', this.customError, this.loading = false}) : super.dirty(value);

  final EmailInputError customError;
  final bool loading;

  String get errorMsg {
    if (super.invalid) {
      switch (super.error) {
        case EmailInputError.empty:
          return 'Field email tidak boleh kosong.';
          break;
        case EmailInputError.alreadyInUse:
          return 'Email sudah terpakai.';
          break;
        case EmailInputError.wrongInputFormat:
          return 'Format email salah.';
          break;
        default:
      }
    }
    return null;
  }

  EmailInput setLoading([bool loading = false]) => EmailInput.dirty(value: super.value, loading: loading, customError: this.customError);

  EmailInput setCustomError(EmailInputError customError) => EmailInput.dirty(value: super.value, customError: customError, loading: this.loading);

  @override
  EmailInputError validator(String value) {
    if (customError != null) {
      return customError;
    }
    return value?.isNotEmpty == true ? null : EmailInputError.empty;
  }

  
  
}