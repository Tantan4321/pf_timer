import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

class TimeStore {
  TimeStore({this.id, this.seconds});
  int id;
  int seconds;
}

abstract class Database {
  Future<void> createTimer(int index);
  Future<void> setTime(TimeStore timer);
  Future<void> deleteTimer(TimeStore timer);
  Future<int> getValue(int index);
  Stream<List<TimeStore>> timersStream();
}

// Cloud Firestore
class AppFirestore implements Database {

  Future<void> createTimer(int index) async {
    TimeStore timer = TimeStore(id: index, seconds: 0);
    await setTime(timer);
  }
  Future<void> setTime(TimeStore timer) async {

    _documentReference(timer).setData({
      'value' : timer.seconds,
    });
  }

  Future<void> deleteTimer(TimeStore timer) async {
    _documentReference(timer).delete();
  }

  Future<int> getValue(int index) async {
    int ret;
    _documentReference(TimeStore(id: index))
        .get().then((documentSnapshot) =>
        ret = documentSnapshot.data['key']
    );

    return ret;
  }

  Stream<List<TimeStore>> timersStream() {
    return _FirestoreStream<List<TimeStore>>(
      apiPath: rootPath,
      parser: FirestoreCountersParser(),
    ).stream;
  }

  DocumentReference _documentReference(TimeStore counter) {
    return Firestore.instance.collection(rootPath).document('${counter.id}');
  }

  static final String rootPath = 'timers';
}

abstract class FirestoreNodeParser<T> {

  T parse(QuerySnapshot querySnapshot);
}

class FirestoreCountersParser extends FirestoreNodeParser<List<TimeStore>> {
  List<TimeStore> parse(QuerySnapshot querySnapshot) {
    var counters = querySnapshot.documents.map((documentSnapshot) {
      return TimeStore(
        id: int.parse(documentSnapshot.documentID),
        seconds: documentSnapshot['value'],
      );
    }).toList();
    counters.sort((lhs, rhs) => rhs.id.compareTo(lhs.id));
    return counters;
  }
}

class _FirestoreStream<T> {
  _FirestoreStream({String apiPath, FirestoreNodeParser<T> parser}) {
    CollectionReference collectionReference = Firestore.instance.collection(apiPath);
    Stream<QuerySnapshot> snapshots = collectionReference.snapshots();
    stream = snapshots.map((snapshot) => parser.parse(snapshot));
  }

  Stream<T> stream;
}
