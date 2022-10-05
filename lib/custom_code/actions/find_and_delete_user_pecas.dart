// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';

// Begin custom action code
findAndDeleteUserPecas(String userId) async {
  WriteBatch batch = FirebaseFirestore.instance.batch();
  await FirebaseFirestore.instance
      .collection('pecas')
      .where('uuidProprietario', isEqualTo: userId)
      .get()
      .then((querySnapshot) => {
            querySnapshot.docs.forEach((document) {
              batch.delete(document.reference);
            })
          });
  await batch.commit();
}
