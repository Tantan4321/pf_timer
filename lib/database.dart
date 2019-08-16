import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

class TimeStore {
  TimeStore({this.id, this.value});
  int id;
  int value;
}

abstract class Database {
  Future<void> createTimer(int index);
  Future<void> setTime(TimeStore counter);
  Future<void> deleteTimer(TimeStore counter);
  Stream<List<TimeStore>> timersStream();
}

// Cloud Firestore
class AppFirestore implements Database {

  Future<void> createTimer(int index) async {
    TimeStore counter = TimeStore(id: index, value: 0);
    await setTime(counter);
  }
  Future<void> setTime(TimeStore counter) async {

    _documentReference(counter).setData({
      'value' : counter.value,
    });
  }

  Future<void> deleteTimer(TimeStore counter) async {
    _documentReference(counter).delete();
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
        value: documentSnapshot['value'],
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
