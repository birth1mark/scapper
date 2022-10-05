import '../auth/auth_util.dart';
import '../auth/firebase_user_provider.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_language_selector.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'columnOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
    'textOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
  };
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).grayIcon,
      drawer: Drawer(
        elevation: 16,
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: Color(0xFFBF0413),
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                child: AuthUserStreamWidget(
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.contain,
                        image: Image.network(
                          currentUserPhoto,
                        ).image,
                      ),
                      gradient: LinearGradient(
                        colors: [Color(0xFFBF0413), Color(0xFFBF0413)],
                        stops: [0, 1],
                        begin: AlignmentDirectional(0, -1),
                        end: AlignmentDirectional(0, 1),
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: InkWell(
                      onTap: () async {
                        context.pushNamed('UserProfile');
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0, 0.8),
                            child: Text(
                              currentUserDisplayName,
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              if (loggedIn == false)
                InkWell(
                  onTap: () async {
                    context.pushNamed('login');
                  },
                  child: ListTile(
                    title: Text(
                      FFLocalizations.of(context).getText(
                        'csr28gpa' /* Login */,
                      ),
                      style: FlutterFlowTheme.of(context).title3.override(
                            fontFamily: 'Outfit',
                            color: FlutterFlowTheme.of(context).primaryBtnText,
                          ),
                    ),
                    subtitle: Text(
                      FFLocalizations.of(context).getText(
                        'uk30fq03' /* Faça Login Na Aplicação */,
                      ),
                      style: FlutterFlowTheme.of(context).subtitle2.override(
                            fontFamily: 'Inter',
                            color: FlutterFlowTheme.of(context).primaryBtnText,
                          ),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: FlutterFlowTheme.of(context).primaryBtnText,
                      size: 20,
                    ),
                    tileColor: Color(0xFFF5F5F5),
                    dense: false,
                  ),
                ),
              if (loggedIn)
                InkWell(
                  onTap: () async {
                    context.pushNamed('InserirPeca');
                  },
                  child: ListTile(
                    title: Text(
                      FFLocalizations.of(context).getText(
                        'dsb80tpg' /* Anunciar e Vender */,
                      ),
                      style: FlutterFlowTheme.of(context).title3.override(
                            fontFamily: 'Outfit',
                            color: FlutterFlowTheme.of(context).primaryBtnText,
                          ),
                    ),
                    subtitle: Text(
                      FFLocalizations.of(context).getText(
                        '8sc8w5ag' /* Vender Peças */,
                      ),
                      style: FlutterFlowTheme.of(context).subtitle2.override(
                            fontFamily: 'Inter',
                            color: FlutterFlowTheme.of(context).primaryBtnText,
                          ),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: FlutterFlowTheme.of(context).primaryBtnText,
                      size: 20,
                    ),
                    tileColor: Color(0xFFF5F5F5),
                    dense: false,
                  ),
                ),
              InkWell(
                onTap: () async {
                  context.pushNamed('ListarPecas');
                },
                child: ListTile(
                  title: Text(
                    FFLocalizations.of(context).getText(
                      'u5c63w8v' /* Todas as Peças */,
                    ),
                    style: FlutterFlowTheme.of(context).title3.override(
                          fontFamily: 'Outfit',
                          color: FlutterFlowTheme.of(context).primaryBtnText,
                        ),
                  ),
                  subtitle: Text(
                    FFLocalizations.of(context).getText(
                      'd6hmss1s' /* Listar todas as peças */,
                    ),
                    style: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Inter',
                          color: FlutterFlowTheme.of(context).primaryBtnText,
                        ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: FlutterFlowTheme.of(context).primaryBtnText,
                    size: 20,
                  ),
                  tileColor: Color(0xFFF5F5F5),
                  dense: false,
                ),
              ),
              if (loggedIn)
                InkWell(
                  onTap: () async {
                    context.pushNamed('mensagens');
                  },
                  child: ListTile(
                    title: Text(
                      FFLocalizations.of(context).getText(
                        'oav56hdl' /* Mensagens */,
                      ),
                      style: FlutterFlowTheme.of(context).title3.override(
                            fontFamily: 'Outfit',
                            color: FlutterFlowTheme.of(context).primaryBtnText,
                          ),
                    ),
                    subtitle: Text(
                      FFLocalizations.of(context).getText(
                        '2tynthk8' /* Ofertas / Compras */,
                      ),
                      style: FlutterFlowTheme.of(context).subtitle2.override(
                            fontFamily: 'Inter',
                            color: FlutterFlowTheme.of(context).primaryBtnText,
                          ),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: FlutterFlowTheme.of(context).primaryBtnText,
                      size: 20,
                    ),
                    tileColor: Color(0xFFF5F5F5),
                    dense: false,
                  ),
                ),
              if (loggedIn == true)
                InkWell(
                  onTap: () async {
                    context.pushNamed('UserProfile');
                  },
                  child: ListTile(
                    title: Text(
                      FFLocalizations.of(context).getText(
                        'i7hqdluf' /* Sobre mim */,
                      ),
                      style: FlutterFlowTheme.of(context).title3.override(
                            fontFamily: 'Outfit',
                            color: FlutterFlowTheme.of(context).primaryBtnText,
                          ),
                    ),
                    subtitle: Text(
                      FFLocalizations.of(context).getText(
                        'zalzq9f3' /* A minha conta */,
                      ),
                      style: FlutterFlowTheme.of(context).subtitle2.override(
                            fontFamily: 'Inter',
                            color: FlutterFlowTheme.of(context).primaryBtnText,
                          ),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: FlutterFlowTheme.of(context).primaryBtnText,
                      size: 20,
                    ),
                    tileColor: Color(0xFFF5F5F5),
                    dense: false,
                  ),
                ),
              if (loggedIn)
                InkWell(
                  onTap: () async {
                    GoRouter.of(context).prepareAuthEvent();
                    await signOut();

                    context.goNamedAuth('HomePage', mounted);
                  },
                  child: ListTile(
                    title: Text(
                      FFLocalizations.of(context).getText(
                        'sdbmc8k5' /* Logout */,
                      ),
                      style: FlutterFlowTheme.of(context).title3.override(
                            fontFamily: 'Outfit',
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                    ),
                    subtitle: Text(
                      FFLocalizations.of(context).getText(
                        '368p6q74' /* Sair da APP.. Até Já */,
                      ),
                      style: FlutterFlowTheme.of(context).subtitle2.override(
                            fontFamily: 'Inter',
                            color: FlutterFlowTheme.of(context).primaryBtnText,
                          ),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: FlutterFlowTheme.of(context).primaryBtnText,
                      size: 20,
                    ),
                    tileColor: Color(0xFFF5F5F5),
                    dense: false,
                  ),
                ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Color(0xFFBF0413),
        iconTheme: IconThemeData(color: Color(0xFF455953)),
        automaticallyImplyLeading: true,
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 1,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).grayIcon,
              shape: BoxShape.rectangle,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 100, 0, 0),
                    child: InkWell(
                      onLongPress: () async {
                        await showDialog(
                          context: context,
                          builder: (alertDialogContext) {
                            return AlertDialog(
                              title: Text('Sobre...'),
                              content: Text(
                                  'Scapper Versão 0.7 - Islagaia - Trabalho Realizado por E. Silva e P. Ribeiro'),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext),
                                  child: Text('Obrigado'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          'assets/images/logo2.png',
                          width: MediaQuery.of(context).size.width * 0.9,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          'ds5y2fv7' /* You Want, We Have */,
                        ),
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).title1.override(
                              fontFamily: 'Outfit',
                              color: Color(0xFFE02121),
                              fontWeight: FontWeight.w800,
                            ),
                      ).animateOnPageLoad(
                          animationsMap['textOnPageLoadAnimation']!),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        child: FlutterFlowLanguageSelector(
                          width: 200,
                          backgroundColor:
                              FlutterFlowTheme.of(context).lineColor,
                          borderColor: Color(0xFFBF0413),
                          dropdownColor: FlutterFlowTheme.of(context).lineColor,
                          dropdownIconColor: Color(0xFFBF0413),
                          borderRadius: 8,
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 13,
                          ),
                          hideFlags: false,
                          flagSize: 24,
                          flagTextGap: 8,
                          currentLanguage:
                              FFLocalizations.of(context).languageCode,
                          languages: FFLocalizations.languages(),
                          onChanged: (lang) => setAppLanguage(context, lang),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ).animateOnPageLoad(animationsMap['columnOnPageLoadAnimation']!),
          ),
        ),
      ),
    );
  }
}
