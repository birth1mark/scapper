import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/chat/index.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MensagensWidget extends StatefulWidget {
  const MensagensWidget({Key? key}) : super(key: key);

  @override
  _MensagensWidgetState createState() => _MensagensWidgetState();
}

class _MensagensWidgetState extends State<MensagensWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).grayIcon,
      appBar: AppBar(
        backgroundColor: Color(0xFFBF0413),
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
            context.pop();
          },
        ),
        title: Text(
          FFLocalizations.of(context).getText(
            'sql2myd4' /* Mensagens */,
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
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
          child: StreamBuilder<List<ChatsRecord>>(
            stream: queryChatsRecord(
              queryBuilder: (chatsRecord) => chatsRecord
                  .where('users', arrayContains: currentUserReference)
                  .orderBy('last_message_time', descending: true),
            ),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: CircularProgressIndicator(
                      color: FlutterFlowTheme.of(context).primaryColor,
                    ),
                  ),
                );
              }
              List<ChatsRecord> listViewChatsRecordList = snapshot.data!;
              return ListView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                itemCount: listViewChatsRecordList.length,
                itemBuilder: (context, listViewIndex) {
                  final listViewChatsRecord =
                      listViewChatsRecordList[listViewIndex];
                  return StreamBuilder<FFChatInfo>(
                    stream: FFChatManager.instance
                        .getChatInfo(chatRecord: listViewChatsRecord),
                    builder: (context, snapshot) {
                      final chatInfo =
                          snapshot.data ?? FFChatInfo(listViewChatsRecord);
                      return FFChatPreview(
                        onTap: () => context.pushNamed(
                          'mensagem',
                          queryParams: {
                            'chatUser': serializeParam(
                              chatInfo.otherUsers.length == 1
                                  ? chatInfo.otherUsersList.first
                                  : null,
                              ParamType.Document,
                            ),
                            'chatRef': serializeParam(
                              chatInfo.chatRecord.reference,
                              ParamType.DocumentReference,
                            ),
                          }.withoutNulls,
                          extra: <String, dynamic>{
                            'chatUser': chatInfo.otherUsers.length == 1
                                ? chatInfo.otherUsersList.first
                                : null,
                          },
                        ),
                        lastChatText: chatInfo.chatPreviewMessage(),
                        lastChatTime: listViewChatsRecord.lastMessageTime,
                        seen: listViewChatsRecord.lastMessageSeenBy!
                            .contains(currentUserReference),
                        title: chatInfo.chatPreviewTitle(),
                        userProfilePic: chatInfo.chatPreviewPic(),
                        color: Color(0xFFEEF0F5),
                        unreadColor: Colors.blue,
                        titleTextStyle: GoogleFonts.getFont(
                          'DM Sans',
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        dateTextStyle: GoogleFonts.getFont(
                          'DM Sans',
                          color: Color(0x73000000),
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                        ),
                        previewTextStyle: GoogleFonts.getFont(
                          'DM Sans',
                          color: Color(0x73000000),
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                        ),
                        contentPadding:
                            EdgeInsetsDirectional.fromSTEB(3, 3, 3, 3),
                        borderRadius: BorderRadius.circular(0),
                      );
                    },
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
