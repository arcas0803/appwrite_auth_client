import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'appwrite_auth_localizations_en.dart';
import 'appwrite_auth_localizations_es.dart';
import 'appwrite_auth_localizations_pt.dart';

/// Callers can lookup localized strings with an instance of AppwriteAuthLocalizations
/// returned by `AppwriteAuthLocalizations.of(context)`.
///
/// Applications need to include `AppwriteAuthLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'localization/appwrite_auth_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppwriteAuthLocalizations.localizationsDelegates,
///   supportedLocales: AppwriteAuthLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppwriteAuthLocalizations.supportedLocales
/// property.
abstract class AppwriteAuthLocalizations {
  AppwriteAuthLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppwriteAuthLocalizations? of(BuildContext context) {
    return Localizations.of<AppwriteAuthLocalizations>(context, AppwriteAuthLocalizations);
  }

  static const LocalizationsDelegate<AppwriteAuthLocalizations> delegate = _AppwriteAuthLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('es'),
    Locale('en'),
    Locale('pt')
  ];

  /// No description provided for @emailAlreadyExists.
  ///
  /// In es, this message translates to:
  /// **'El correo electrónico ya existe. Por favor, elija otro.'**
  String get emailAlreadyExists;

  /// No description provided for @invalidCredentials.
  ///
  /// In es, this message translates to:
  /// **'Credenciales inválidas. Por favor, inténtelo de nuevo con credenciales válidas.'**
  String get invalidCredentials;

  /// No description provided for @userDisabled.
  ///
  /// In es, this message translates to:
  /// **'El usuario ha sido deshabilitado. Por favor, póngase en contacto con el administrador.'**
  String get userDisabled;

  /// No description provided for @userNotFound.
  ///
  /// In es, this message translates to:
  /// **'El usuario no se ha encontrado. Por favor, inténtelo de nuevo con credenciales válidas.'**
  String get userNotFound;

  /// No description provided for @weakPassword.
  ///
  /// In es, this message translates to:
  /// **'La contraseña es demasiado débil. Por favor, elija una contraseña más fuerte con al menos 8 caracteres.'**
  String get weakPassword;

  /// No description provided for @emailUnverified.
  ///
  /// In es, this message translates to:
  /// **'El correo electrónico no ha sido verificado. Por favor, verifique su correo electrónico.'**
  String get emailUnverified;

  /// No description provided for @unauthenticated.
  ///
  /// In es, this message translates to:
  /// **'No autenticado. Por favor, inicie sesión para continuar.'**
  String get unauthenticated;

  /// No description provided for @passwordMistmatch.
  ///
  /// In es, this message translates to:
  /// **'Las contraseñas no coinciden. Por favor, inténtelo de nuevo.'**
  String get passwordMistmatch;

  /// No description provided for @passwordRecentlyUsed.
  ///
  /// In es, this message translates to:
  /// **'La contraseña se ha utilizado recientemente. Por favor, elija una contraseña diferente.'**
  String get passwordRecentlyUsed;

  /// No description provided for @passwordPersonalData.
  ///
  /// In es, this message translates to:
  /// **'La contraseña contiene datos personales. Por favor, elija una contraseña diferente.'**
  String get passwordPersonalData;

  /// No description provided for @userBlocked.
  ///
  /// In es, this message translates to:
  /// **'El usuario ha sido bloqueado. Por favor, póngase en contacto con el administrador.'**
  String get userBlocked;

  /// No description provided for @passwordResetRequired.
  ///
  /// In es, this message translates to:
  /// **'Se requiere restablecimiento de contraseña. Por favor, restablezca su contraseña.'**
  String get passwordResetRequired;

  /// No description provided for @unknownError.
  ///
  /// In es, this message translates to:
  /// **'Ha ocurrido un error desconocido. Por favor, inténtelo de nuevo.'**
  String get unknownError;
}

class _AppwriteAuthLocalizationsDelegate extends LocalizationsDelegate<AppwriteAuthLocalizations> {
  const _AppwriteAuthLocalizationsDelegate();

  @override
  Future<AppwriteAuthLocalizations> load(Locale locale) {
    return SynchronousFuture<AppwriteAuthLocalizations>(lookupAppwriteAuthLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'es', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppwriteAuthLocalizationsDelegate old) => false;
}

AppwriteAuthLocalizations lookupAppwriteAuthLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppwriteAuthLocalizationsEn();
    case 'es': return AppwriteAuthLocalizationsEs();
    case 'pt': return AppwriteAuthLocalizationsPt();
  }

  throw FlutterError(
    'AppwriteAuthLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
