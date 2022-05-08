import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseCollections {
  static CollectionReference PRODUCTCOLLECTION =
      FirebaseFirestore.instance.collection("products");
}
