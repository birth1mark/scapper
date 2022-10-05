import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['pt', 'en', 'de', 'es'];

  String get languageCode => locale.toString();
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? ptText = '',
    String? enText = '',
    String? deText = '',
    String? esText = '',
  }) =>
      [ptText, enText, deText, esText][languageIndex] ?? '';
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      FFLocalizations.languages().contains(locale.toString());

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    'csr28gpa': {
      'pt': 'Login',
      'de': 'Anmeldung',
      'en': 'Login',
      'es': 'Acceso',
    },
    'uk30fq03': {
      'pt': 'Faça Login Na Aplicação',
      'de': 'Melden Sie sich bei der Anwendung an',
      'en': 'Login to Application',
      'es': 'Iniciar sesión en la aplicación',
    },
    'dsb80tpg': {
      'pt': 'Anunciar e Vender',
      'de': 'Werben und verkaufen',
      'en': 'Advertise and Sell',
      'es': 'Anunciar y vender',
    },
    '8sc8w5ag': {
      'pt': 'Vender Peças',
      'de': 'Teile verkaufen',
      'en': 'sell parts',
      'es': 'vender piezas',
    },
    'u5c63w8v': {
      'pt': 'Todas as Peças',
      'de': 'Alle Stücke',
      'en': 'All the pieces',
      'es': 'todas las piezas',
    },
    'd6hmss1s': {
      'pt': 'Listar todas as peças',
      'de': 'Alle Teile auflisten',
      'en': 'List all parts',
      'es': 'Listar todas las partes',
    },
    'oav56hdl': {
      'pt': 'Mensagens',
      'de': 'Mitteilungen',
      'en': 'Messages',
      'es': 'Mensajes',
    },
    '2tynthk8': {
      'pt': 'Ofertas / Compras',
      'de': 'Angebote / Käufe',
      'en': 'Offers / Purchases',
      'es': 'Ofertas / Compras',
    },
    'i7hqdluf': {
      'pt': 'Sobre mim',
      'de': 'Über mich',
      'en': 'About me',
      'es': 'Sobre mi',
    },
    'zalzq9f3': {
      'pt': 'A minha conta',
      'de': 'Mein Konto',
      'en': 'My account',
      'es': 'Mi cuenta',
    },
    'sdbmc8k5': {
      'pt': 'Logout',
      'de': 'Ausloggen',
      'en': 'logout',
      'es': 'cerrar sesión',
    },
    '368p6q74': {
      'pt': 'Sair da APP.. Até Já',
      'de': 'Beenden Sie die APP. Bis bald',
      'en': 'Exit the APP. See you soon',
      'es': 'Sal de la APP. Hasta pronto',
    },
    'ds5y2fv7': {
      'pt': 'You Want, We Have',
      'de': 'Sie wollen, wir haben',
      'en': 'You Want, We Have',
      'es': 'Tu Quieres, Nosotros Tenemos',
    },
    'j4uefz2o': {
      'pt': 'Home',
      'de': 'Heimat',
      'en': 'home',
      'es': 'hogar',
    },
  },
  // login
  {
    'enudk3hr': {
      'pt': 'Login',
      'de': 'Anmeldung',
      'en': 'Login',
      'es': 'Acceso',
    },
    'mdvtczis': {
      'pt': 'Utilize o Formulário para Efetuar Autenticação',
      'de': 'Verwenden Sie das Authentifizierungsformular',
      'en': 'Use the Authentication Form',
      'es': 'Utilice el formulario de autenticación',
    },
    '0txepdol': {
      'pt': 'Insira o seu Email',
      'de': 'Geben sie ihre E-Mail Adresse ein',
      'en': 'Enter your Email',
      'es': 'Introduce tu correo electrónico',
    },
    'n9bsfdok': {
      'pt': 'Password',
      'de': 'Passwort',
      'en': 'password',
      'es': 'clave',
    },
    '1ffqp2wn': {
      'pt': 'Registar',
      'de': 'registrieren',
      'en': 'register',
      'es': 'Registrarse',
    },
    'bse037la': {
      'pt': 'Login',
      'de': 'Anmeldung',
      'en': 'Login',
      'es': 'Acceso',
    },
    'ea7ej5ok': {
      'pt': 'Recuperar Password',
      'de': 'Passwort abrufen',
      'en': 'Retrieve password',
      'es': 'recuperar contraseña',
    },
    '34ogqxya': {
      'pt': 'Login',
      'de': 'Anmeldung',
      'en': 'Login',
      'es': 'Acceso',
    },
    'qhxkkjdp': {
      'pt': 'Profile',
      'de': 'Profil',
      'en': 'profile',
      'es': 'perfil',
    },
  },
  // ListarPecas
  {
    'wesg4mwq': {
      'pt': 'Pesquise aqui...',
      'de': 'Suche hier...',
      'en': 'Search here...',
      'es': 'Busca aquí...',
    },
    'g2stmzfu': {
      'pt': 'Todas as Peças',
      'de': 'Alle Stücke',
      'en': 'All the pieces',
      'es': 'todas las piezas',
    },
  },
  // InserirPeca
  {
    '248zjlzw': {
      'pt': 'Referencia',
      'de': 'Bezug',
      'en': 'Reference',
      'es': 'Referencia',
    },
    '5n659k1p': {
      'pt': 'Ano Peça',
      'de': 'Jahresstück',
      'en': 'Year Piece',
      'es': 'Año Pieza',
    },
    '24o6em17': {
      'pt': 'Concelho',
      'de': 'Bezirk',
      'en': 'county',
      'es': 'condado',
    },
    'tinzpp29': {
      'pt': 'Descrição...',
      'de': 'Beschreibung...',
      'en': 'Description...',
      'es': 'Descripción...',
    },
    'auk7zw6d': {
      'pt': '',
      'de': 'Beschreibung...',
      'en': 'Description...',
      'es': 'Descripción...',
    },
    'vzj7puqy': {
      'pt': 'Valor da Peça',
      'de': 'Stückwert',
      'en': 'Piece Value',
      'es': 'Valor de la pieza',
    },
    'ros9rg23': {
      'pt': 'Vender',
      'de': 'Verkaufen',
      'en': 'Sell',
      'es': 'Vender',
    },
    '0ntlz5fc': {
      'pt': 'Field is required',
      'de': 'Feld ist erforderlich',
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    'gls002ju': {
      'pt': 'Field is required',
      'de': 'Feld ist erforderlich',
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    'cd8ndhkz': {
      'pt': 'Field is required',
      'de': 'Feld ist erforderlich',
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    'kfao51pl': {
      'pt': 'Field is required',
      'de': 'Feld ist erforderlich',
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    'uwje5tq8': {
      'pt': 'Field is required',
      'de': 'Feld ist erforderlich',
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    'w6ukpiqf': {
      'pt': 'Vender Peça',
      'de': 'Teil verkaufen',
      'en': 'sell part',
      'es': 'vender parte',
    },
  },
  // UserProfile
  {
    'pespnbpo': {
      'pt': 'Id. Utilizador',
      'de': 'ICH WÜRDE Benutzer',
      'en': 'ID User',
      'es': 'IDENTIFICACIÓN Usuario',
    },
    '4714vtv7': {
      'pt': 'Nome',
      'de': 'Name',
      'en': 'Name',
      'es': 'Nombre',
    },
    'cliqcj0f': {
      'pt': 'Email',
      'de': 'Email',
      'en': 'Email',
      'es': 'Correo electrónico',
    },
    'hi417hdb': {
      'pt': 'Esquecer-me',
      'de': 'Vergiss mich',
      'en': 'Forget me',
      'es': 'Olvidame',
    },
    't55l8c9a': {
      'pt': 'Atualizar',
      'de': 'Aktualisieren',
      'en': 'Update',
      'es': 'Actualizar',
    },
    'lnhre4xu': {
      'pt': 'Sobre Mim',
      'de': 'Über mich',
      'en': 'About me',
      'es': 'Sobre mi',
    },
  },
  // AlterarPeca
  {
    'nqg5y623': {
      'pt': 'Referencia',
      'de': 'Bezug',
      'en': 'Reference',
      'es': 'Referencia',
    },
    'f7893gxa': {
      'pt': 'Ano Peça',
      'de': 'Jahresstück',
      'en': 'Year Piece',
      'es': 'Año Pieza',
    },
    'tw9ubuce': {
      'pt': 'Concelho',
      'de': 'Bezirk',
      'en': 'county',
      'es': 'condado',
    },
    'fu5yssx3': {
      'pt': 'Enter description here..',
      'de': 'Beschreibung hier eingeben..',
      'en': 'Enter description here..',
      'es': 'Ingrese la descripción aquí..',
    },
    '9auz0ofu': {
      'pt': 'Valor da Peça',
      'de': 'Stückwert',
      'en': 'Piece Value',
      'es': 'Valor de la pieza',
    },
    'ezo02845': {
      'pt': 'Modificar',
      'de': 'Ändern',
      'en': 'Modify',
      'es': 'Modificar',
    },
    'j9nb32cf': {
      'pt': 'Field is required',
      'de': 'Feld ist erforderlich',
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    '7wrzd0b5': {
      'pt': 'Field is required',
      'de': 'Feld ist erforderlich',
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    '1rzpat7j': {
      'pt': 'Field is required',
      'de': 'Feld ist erforderlich',
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    'q1dctm14': {
      'pt': 'Field is required',
      'de': 'Feld ist erforderlich',
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    '01008w3j': {
      'pt': 'Field is required',
      'de': 'Feld ist erforderlich',
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    'g09atxb9': {
      'pt': 'Alterar Peça',
      'de': 'Teil wechseln',
      'en': 'Change Part',
      'es': 'Cambiar parte',
    },
  },
  // mensagens
  {
    'sql2myd4': {
      'pt': 'Mensagens',
      'de': 'Mitteilungen',
      'en': 'Messages',
      'es': 'Mensajes',
    },
  },
  // ComprarPecaFiltrado
  {
    'ctr4a2un': {
      'pt': 'Peça:',
      'de': 'Fragen:',
      'en': 'Ask:',
      'es': 'Pedir:',
    },
    'zy4e1gc6': {
      'pt': 'Referência',
      'de': 'Bezug',
      'en': 'Reference',
      'es': 'Referencia',
    },
    'xwe33n6a': {
      'pt': '[Some hint text...]',
      'de': '[Einige Hinweistexte...]',
      'en': '[Some hint text...]',
      'es': '[Algún texto de pista...]',
    },
    'uei84sch': {
      'pt': 'Preço',
      'de': 'Preis',
      'en': 'Price',
      'es': 'Precio',
    },
    '4vf9wth2': {
      'pt': '[Some hint text...]',
      'de': '[Einige Hinweistexte...]',
      'en': '[Some hint text...]',
      'es': '[Algún texto de pista...]',
    },
    't4un2xd4': {
      'pt': 'Descrição',
      'de': 'Beschreibung',
      'en': 'Description',
      'es': 'Descripción',
    },
    '98c03ok3': {
      'pt': '[Some hint text...]',
      'de': '[Einige Hinweistexte...]',
      'en': '[Some hint text...]',
      'es': '[Algún texto de pista...]',
    },
    'ovib76ix': {
      'pt': 'Localização',
      'de': 'Ort',
      'en': 'Location',
      'es': 'Ubicación',
    },
    'aljnzlui': {
      'pt': '[Some hint text...]',
      'de': '[Einige Hinweistexte...]',
      'en': '[Some hint text...]',
      'es': '[Algún texto de pista...]',
    },
    '60d0pztt': {
      'pt': 'Comprar',
      'de': 'Kaufen',
      'en': 'Purchase',
      'es': 'Compra',
    },
    'sbjwgnco': {
      'pt': 'Faça Login para Comprar',
      'de': 'Melden Sie sich an, um zu kaufen',
      'en': 'Login to Buy',
      'es': 'Iniciar sesión para comprar',
    },
    'njcv6v89': {
      'pt': 'Comprar Peça',
      'de': 'Teil kaufen',
      'en': 'buy part',
      'es': 'comprar parte',
    },
  },
  // mensagem
  {
    '1hibns9c': {
      'pt': ' - Ref.',
      'de': '- Art.-Nr.',
      'en': '- Ref.',
      'es': '- ref.',
    },
  },
  // ComprarPeca
  {
    '4vsybcx1': {
      'pt': 'Peça:',
      'de': 'Fragen:',
      'en': 'Ask:',
      'es': 'Pedir:',
    },
    'yk7hd8gr': {
      'pt': 'Referência',
      'de': 'Bezug',
      'en': 'Reference',
      'es': 'Referencia',
    },
    'p80mdmxn': {
      'pt': '[Some hint text...]',
      'de': '[Einige Hinweistexte...]',
      'en': '[Some hint text...]',
      'es': '[Algún texto de pista...]',
    },
    'rj5n8ib6': {
      'pt': '[Some hint text...]',
      'de': '[Einige Hinweistexte...]',
      'en': '[Some hint text...]',
      'es': '[Algún texto de pista...]',
    },
    '9apkkt4t': {
      'pt': 'Descrição',
      'de': 'Beschreibung',
      'en': 'Description',
      'es': 'Descripción',
    },
    '2wrttoqw': {
      'pt': '[Some hint text...]',
      'de': '[Einige Hinweistexte...]',
      'en': '[Some hint text...]',
      'es': '[Algún texto de pista...]',
    },
    'bddquzyx': {
      'pt': 'Localização',
      'de': 'Ort',
      'en': 'Location',
      'es': 'Ubicación',
    },
    'j6r5dpb3': {
      'pt': '[Some hint text...]',
      'de': '[Einige Hinweistexte...]',
      'en': '[Some hint text...]',
      'es': '[Algún texto de pista...]',
    },
    'z8i52n84': {
      'pt': 'Comprar',
      'de': 'Kaufen',
      'en': 'Purchase',
      'es': 'Compra',
    },
    'l2s9huf5': {
      'pt': 'Faça Login para Comprar',
      'de': 'Melden Sie sich an, um zu kaufen',
      'en': 'Login to Buy',
      'es': 'Iniciar sesión para comprar',
    },
    '2kpaikak': {
      'pt': 'Comprar Peça',
      'de': 'Teil kaufen',
      'en': 'buy part',
      'es': 'comprar parte',
    },
  },
  // Miscellaneous
  {
    't5cp46f4': {
      'pt': '',
      'de': '',
      'en': '',
      'es': '',
    },
    'njo20luc': {
      'pt': '',
      'de': '',
      'en': '',
      'es': '',
    },
    'u9hfe0lg': {
      'pt': '',
      'de': '',
      'en': '',
      'es': '',
    },
    'qo0lgld5': {
      'pt': '',
      'de': '',
      'en': '',
      'es': '',
    },
    '3jcrednn': {
      'pt': '',
      'de': '',
      'en': '',
      'es': '',
    },
    'etlchmgl': {
      'pt': '',
      'de': '',
      'en': '',
      'es': '',
    },
    'gd51gx2s': {
      'pt': '',
      'de': '',
      'en': '',
      'es': '',
    },
    'f1cad89d': {
      'pt': '',
      'de': '',
      'en': '',
      'es': '',
    },
    '1ze1tihj': {
      'pt': '',
      'de': '',
      'en': '',
      'es': '',
    },
    'ozucdiyu': {
      'pt': '',
      'de': '',
      'en': '',
      'es': '',
    },
    'f3q6ou24': {
      'pt': '',
      'de': '',
      'en': '',
      'es': '',
    },
    '6uxdj5uq': {
      'pt': '',
      'de': '',
      'en': '',
      'es': '',
    },
    '559nv6r9': {
      'pt': '',
      'de': '',
      'en': '',
      'es': '',
    },
    '7dw7462y': {
      'pt': '',
      'de': '',
      'en': '',
      'es': '',
    },
    '3y5fkq8t': {
      'pt': '',
      'de': '',
      'en': '',
      'es': '',
    },
    'ym9zrzf1': {
      'pt': '',
      'de': '',
      'en': '',
      'es': '',
    },
    '8ub74p52': {
      'pt': '',
      'de': '',
      'en': '',
      'es': '',
    },
    'al2ft39v': {
      'pt': '',
      'de': '',
      'en': '',
      'es': '',
    },
    'rs2kjpxn': {
      'pt': '',
      'de': '',
      'en': '',
      'es': '',
    },
    'vr208ruy': {
      'pt': '',
      'de': '',
      'en': '',
      'es': '',
    },
    'nztb94pj': {
      'pt': '',
      'de': '',
      'en': '',
      'es': '',
    },
    'nzaba1x7': {
      'pt': '',
      'de': '',
      'en': '',
      'es': '',
    },
  },
].reduce((a, b) => a..addAll(b));
