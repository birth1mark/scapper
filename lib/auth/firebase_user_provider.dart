import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

import 'auth_util.dart';

class ScapperFirebaseUser {
  ScapperFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

ScapperFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<ScapperFirebaseUser> scapperFirebaseUserStream() => FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<ScapperFirebaseUser>(
      (user) {
        currentUser = ScapperFirebaseUser(user);
        updateUserJwtTimer(user);
        return currentUser!;
      },
    );
