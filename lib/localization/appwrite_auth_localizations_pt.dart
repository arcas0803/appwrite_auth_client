import 'appwrite_auth_localizations.dart';

/// The translations for Portuguese (`pt`).
class AppwriteAuthLocalizationsPt extends AppwriteAuthLocalizations {
  AppwriteAuthLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get emailAlreadyExists => 'O email já existe. Por favor, faça login com o seu email.';

  @override
  String get invalidCredentials => 'Credenciais inválidas. Por favor, tente novamente.';

  @override
  String get userDisabled => 'O usuário foi desativado. Por favor, entre em contato com o administrador.';

  @override
  String get userNotFound => 'O usuário não foi encontrado. Por favor, verifique o seu email.';

  @override
  String get weakPassword => 'A senha é muito fraca. Por favor, escolha uma senha mais forte com pelo menos 8 caracteres.';

  @override
  String get emailUnverified => 'O email não foi verificado. Por favor, verifique o seu email.';

  @override
  String get unauthenticated => 'O usuário não está autenticado. Por favor, faça login.';

  @override
  String get passwordMistmatch => 'A senha não corresponde. Por favor, tente novamente.';

  @override
  String get passwordRecentlyUsed => 'A senha foi usada recentemente. Por favor, escolha uma senha diferente.';

  @override
  String get passwordPersonalData => 'A senha contém dados pessoais. Por favor, escolha uma senha diferente.';

  @override
  String get userBlocked => 'O usuário foi bloqueado. Por favor, entre em contato com o administrador.';

  @override
  String get passwordResetRequired => 'A senha precisa ser redefinida. Por favor, redefina a senha.';

  @override
  String get unknownError => 'Ocorreu um erro desconhecido. Por favor, tente novamente.';
}
