import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class LotGurusFirebaseUser {
  LotGurusFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

LotGurusFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<LotGurusFirebaseUser> lotGurusFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<LotGurusFirebaseUser>(
            (user) => currentUser = LotGurusFirebaseUser(user));
