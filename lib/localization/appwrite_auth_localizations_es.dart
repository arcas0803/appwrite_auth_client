import 'appwrite_auth_localizations.dart';

/// The translations for Spanish Castilian (`es`).
class AppwriteAuthLocalizationsEs extends AppwriteAuthLocalizations {
  AppwriteAuthLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get emailAlreadyExists => 'El correo electrónico ya existe. Por favor, elija otro.';

  @override
  String get invalidCredentials => 'Credenciales inválidas. Por favor, inténtelo de nuevo con credenciales válidas.';

  @override
  String get userDisabled => 'El usuario ha sido deshabilitado. Por favor, póngase en contacto con el administrador.';

  @override
  String get userNotFound => 'El usuario no se ha encontrado. Por favor, inténtelo de nuevo con credenciales válidas.';

  @override
  String get weakPassword => 'La contraseña es demasiado débil. Por favor, elija una contraseña más fuerte con al menos 8 caracteres.';

  @override
  String get emailUnverified => 'El correo electrónico no ha sido verificado. Por favor, verifique su correo electrónico.';

  @override
  String get unauthenticated => 'No autenticado. Por favor, inicie sesión para continuar.';

  @override
  String get passwordMistmatch => 'Las contraseñas no coinciden. Por favor, inténtelo de nuevo.';

  @override
  String get passwordRecentlyUsed => 'La contraseña se ha utilizado recientemente. Por favor, elija una contraseña diferente.';

  @override
  String get passwordPersonalData => 'La contraseña contiene datos personales. Por favor, elija una contraseña diferente.';

  @override
  String get userBlocked => 'El usuario ha sido bloqueado. Por favor, póngase en contacto con el administrador.';

  @override
  String get passwordResetRequired => 'Se requiere restablecimiento de contraseña. Por favor, restablezca su contraseña.';

  @override
  String get unknownError => 'Ha ocurrido un error desconocido. Por favor, inténtelo de nuevo.';
}
