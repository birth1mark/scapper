import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ListViewTotalWidget extends StatefulWidget {
  const ListViewTotalWidget({Key? key}) : super(key: key);

  @override
  _ListViewTotalWidgetState createState() => _ListViewTotalWidgetState();
}

class _ListViewTotalWidgetState extends State<ListViewTotalWidget> {
  PagingController<DocumentSnapshot?, PecasRecord>? _pagingController;
  Query? _pagingQuery;
  List<StreamSubscription?> _streamSubscriptions = [];

  @override
  void dispose() {
    _streamSubscriptions.forEach((s) => s?.cancel());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PagedListView<DocumentSnapshot<Object?>?, PecasRecord>(
      pagingController: () {
        final Query<Object?> Function(Query<Object?>) queryBuilder =
            (pecasRecord) => pecasRecord;
        if (_pagingController != null) {
          final query = queryBuilder(PecasRecord.collection);
          if (query != _pagingQuery) {
            // The query has changed
            _pagingQuery = query;
            _streamSubscriptions.forEach((s) => s?.cancel());
            _streamSubscriptions.clear();
            _pagingController!.refresh();
          }
          return _pagingController!;
        }

        _pagingController = PagingController(firstPageKey: null);
        _pagingQuery = queryBuilder(PecasRecord.collection);
        _pagingController!.addPageRequestListener((nextPageMarker) {
          queryPecasRecordPage(
            queryBuilder: (pecasRecord) => pecasRecord,
            nextPageMarker: nextPageMarker,
            pageSize: 10,
            isStream: true,
          ).then((page) {
            _pagingController!.appendPage(
              page.data,
              page.nextPageMarker,
            );
            final streamSubscription = page.dataStream?.listen((data) {
              final itemIndexes = _pagingController!.itemList!
                  .asMap()
                  .map((k, v) => MapEntry(v.reference.id, k));
              data.forEach((item) {
                final index = itemIndexes[item.reference.id];
                final items = _pagingController!.itemList!;
                if (index != null) {
                  items.replaceRange(index, index + 1, [item]);
                  _pagingController!.itemList = {
                    for (var item in items) item.reference: item
                  }.values.toList();
                }
              });
              setState(() {});
            });
            _streamSubscriptions.add(streamSubscription);
          });
        });
        return _pagingController!;
      }(),
      padding: EdgeInsets.zero,
      scrollDirection: Axis.vertical,
      builderDelegate: PagedChildBuilderDelegate<PecasRecord>(
        // Customize what your widget looks like when it's loading the first page.
        firstPageProgressIndicatorBuilder: (_) => Center(
          child: SizedBox(
            width: 50,
            height: 50,
            child: CircularProgressIndicator(
              color: FlutterFlowTheme.of(context).primaryColor,
            ),
          ),
        ),

        itemBuilder: (context, _, listViewTotalIndex) {
          final listViewTotalPecasRecord =
              _pagingController!.itemList![listViewTotalIndex];
          return Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 20),
            child: Container(
              width: double.infinity,
              height: 184,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: Image.network(
                    listViewTotalPecasRecord.imagePeca!,
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
                      listViewTotalPecasRecord.imagePeca!,
                    ).image,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 2),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                listViewTotalPecasRecord.referenciaPeca!,
                                style: FlutterFlowTheme.of(context)
                                    .title1
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
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
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 4, 16, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                listViewTotalPecasRecord.decricaoPeca!,
                                style: FlutterFlowTheme.of(context)
                                    .bodyText2
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFF39D2C0),
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(16, 4, 16, 16),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              if (listViewTotalPecasRecord.uuidProprietario !=
                                  currentUserUid)
                                FFButtonWidget(
                                  onPressed: () async {
                                    context.pushNamed(
                                      'ComprarPeca',
                                      queryParams: {
                                        'pecasItem': serializeParam(
                                          listViewTotalPecasRecord,
                                          ParamType.Document,
                                        ),
                                      }.withoutNulls,
                                      extra: <String, dynamic>{
                                        'pecasItem': listViewTotalPecasRecord,
                                      },
                                    );
                                  },
                                  text: listViewTotalPecasRecord.valorPeca!
                                      .toString(),
                                  icon: Icon(
                                    Icons.shopping_cart_outlined,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                  options: FFButtonOptions(
                                    width: 120,
                                    height: 40,
                                    color: Color(0xFF39D2C0),
                                    textStyle: GoogleFonts.getFont(
                                      'Lexend Deca',
                                      color: Colors.white,
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
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 4),
                                      child: Text(
                                        listViewTotalPecasRecord
                                            .localizacaoPeca!,
                                        style: FlutterFlowTheme.of(context)
                                            .title3
                                            .override(
                                              fontFamily: 'Lexend Deca',
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                    Text(
                                      listViewTotalPecasRecord.anoPeca!
                                          .toString(),
                                      textAlign: TextAlign.end,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Lexend Deca',
                                            color: Color(0xB4FFFFFF),
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
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
      ),
    );
  }
}
