import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/list_view_total_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:text_search/text_search.dart';

class ListarPecasWidget extends StatefulWidget {
  const ListarPecasWidget({Key? key}) : super(key: key);

  @override
  _ListarPecasWidgetState createState() => _ListarPecasWidgetState();
}

class _ListarPecasWidgetState extends State<ListarPecasWidget> {
  List<PecasRecord> simpleSearchResults = [];
  TextEditingController? searchFieldController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    searchFieldController = TextEditingController();
  }

  @override
  void dispose() {
    searchFieldController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: Color(0xFFCF0413),
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () async {
            context.pushNamed('HomePage');
          },
        ),
        title: Text(
          FFLocalizations.of(context).getText(
            'g2stmzfu' /* Todas as Peças */,
          ),
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Outfit',
                color: Colors.white,
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Material(
                color: Colors.transparent,
                elevation: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4,
                        color: Color(0x430F1113),
                        offset: Offset(0, 2),
                      )
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(2, 4, 2, 4),
                    child: TextFormField(
                      controller: searchFieldController,
                      onChanged: (_) => EasyDebounce.debounce(
                        'searchFieldController',
                        Duration(milliseconds: 2000),
                        () async {
                          await queryPecasRecordOnce()
                              .then(
                                (records) => simpleSearchResults = TextSearch(
                                  records
                                      .map(
                                        (record) => TextSearchItem(record, [
                                          record.referenciaPeca!,
                                          record.decricaoPeca!
                                        ]),
                                      )
                                      .toList(),
                                )
                                    .search(searchFieldController!.text)
                                    .map((r) => r.object)
                                    .toList(),
                              )
                              .onError((_, __) => simpleSearchResults = [])
                              .whenComplete(() => setState(() {}));
                        },
                      ),
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: FFLocalizations.of(context).getText(
                          'wesg4mwq' /* Pesquise aqui... */,
                        ),
                        hintStyle: FlutterFlowTheme.of(context).bodyText2,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        prefixIcon: Icon(
                          Icons.search_rounded,
                          color: Color(0xFF95A1AC),
                        ),
                        suffixIcon: searchFieldController!.text.isNotEmpty
                            ? InkWell(
                                onTap: () async {
                                  searchFieldController?.clear();
                                  await queryPecasRecordOnce()
                                      .then(
                                        (records) => simpleSearchResults =
                                            TextSearch(
                                          records
                                              .map(
                                                (record) => TextSearchItem(
                                                    record, [
                                                  record.referenciaPeca!,
                                                  record.decricaoPeca!
                                                ]),
                                              )
                                              .toList(),
                                        )
                                                .search(
                                                    searchFieldController!.text)
                                                .map((r) => r.object)
                                                .toList(),
                                      )
                                      .onError(
                                          (_, __) => simpleSearchResults = [])
                                      .whenComplete(() => setState(() {}));

                                  setState(() {});
                                },
                                child: Icon(
                                  Icons.clear,
                                  color: Color(0xFF757575),
                                  size: 20,
                                ),
                              )
                            : null,
                      ),
                      style: FlutterFlowTheme.of(context).bodyText1,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Stack(
              children: [
                if (simpleSearchResults.length > 0)
                  Builder(
                    builder: (context) {
                      final pesquisaPecas = simpleSearchResults.toList();
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        primary: false,
                        scrollDirection: Axis.vertical,
                        itemCount: pesquisaPecas.length,
                        itemBuilder: (context, pesquisaPecasIndex) {
                          final pesquisaPecasItem =
                              pesquisaPecas[pesquisaPecasIndex];
                          return Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 12, 16, 20),
                            child: Container(
                              width: double.infinity,
                              height: 184,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                image: DecorationImage(
                                  fit: BoxFit.fitWidth,
                                  image: Image.network(
                                    pesquisaPecasItem.imagePeca!,
                                  ).image,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 3,
                                    color: Color(0x33000000),
                                    offset: Offset(0, 2),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Color(0x65090F13),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: Image.network(
                                      pesquisaPecasItem.imagePeca!,
                                    ).image,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4,
                                      color: Color(0x33000000),
                                      offset: Offset(0, 2),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(8),
                                  shape: BoxShape.rectangle,
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 2),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16, 16, 16, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                pesquisaPecasItem
                                                    .referenciaPeca!,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .title1
                                                        .override(
                                                          fontFamily:
                                                              'Lexend Deca',
                                                          color: Colors.white,
                                                          fontSize: 24,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                              ),
                                            ),
                                            Icon(
                                              Icons.chevron_right_rounded,
                                              color: Colors.white,
                                              size: 24,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Align(
                                        alignment: AlignmentDirectional(0, 0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16, 4, 16, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  pesquisaPecasItem
                                                      .decricaoPeca!,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText2
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        color: Colors.white,
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16, 4, 16, 16),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              if (pesquisaPecasItem
                                                      .uuidProprietario !=
                                                  currentUserUid)
                                                FFButtonWidget(
                                                  onPressed: () async {
                                                    context.pushNamed(
                                                      'ComprarPecaFiltrado',
                                                      queryParams: {
                                                        'pecasItem':
                                                            serializeParam(
                                                          pesquisaPecasItem,
                                                          ParamType.Document,
                                                        ),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
                                                        'pecasItem':
                                                            pesquisaPecasItem,
                                                      },
                                                    );
                                                  },
                                                  text: pesquisaPecasItem
                                                      .valorPeca!
                                                      .toString(),
                                                  icon: Icon(
                                                    Icons.add_rounded,
                                                    color: Colors.white,
                                                    size: 15,
                                                  ),
                                                  options: FFButtonOptions(
                                                    width: 120,
                                                    height: 40,
                                                    color: Color(0xFFBF0413),
                                                    textStyle:
                                                        GoogleFonts.getFont(
                                                      'Lexend Deca',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .black600,
                                                      fontSize: 14,
                                                    ),
                                                    elevation: 3,
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1,
                                                    ),
                                                  ),
                                                ),
                                              Expanded(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 0, 4),
                                                      child: Text(
                                                        pesquisaPecasItem
                                                            .localizacaoPeca!,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .title3
                                                            .override(
                                                              fontFamily:
                                                                  'Lexend Deca',
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                      ),
                                                    ),
                                                    Text(
                                                      pesquisaPecasItem.anoPeca!
                                                          .toString(),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyText1
                                                          .override(
                                                            fontFamily:
                                                                'Lexend Deca',
                                                            color: Colors.white,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                if (simpleSearchResults.length == 0)
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: ListViewTotalWidget(),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
