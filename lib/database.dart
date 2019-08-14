import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

class Counter {
  Counter({this.id, this.value});
  int id;
  int value;
}

abstract class Database {
  Future<void> createCounter();
  Future<void> setCounter(Counter counter);
  Future<void> deleteCounter(Counter counter);
  Stream<List<Counter>> countersStream();
}

// Cloud Firestore
class AppFirestore implements Database {

  Future<void> createCounter() async {
    int now = DateTime.now().millisecondsSinceEpoch;
    Counter counter = Counter(id: now, value: 0);
    await setCounter(counter);
  }
  Future<void> setCounter(Counter counter) async {

    _documentReference(counter).setData({
      'value' : counter.value,
    });
  }

  Future<void> deleteCounter(Counter counter) async {
    _documentReference(counter).delete();
  }

  Stream<List<Counter>> countersStream() {
    return _FirestoreStream<List<Counter>>(
      apiPath: rootPath,
      parser: FirestoreCountersParser(),
    ).stream;
  }

  DocumentReference _documentReference(Counter counter) {
    return Firestore.instance.collection(rootPath).document('${counter.id}');
  }

  static final String rootPath = 'counters';
}

abstract class FirestoreNodeParser<T> {

  T parse(QuerySnapshot querySnapshot);
}

class FirestoreCountersParser extends FirestoreNodeParser<List<Counter>> {
  List<Counter> parse(QuerySnapshot querySnapshot) {
    var counters = querySnapshot.documents.map((documentSnapshot) {
      return Counter(
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
