import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:talkster/Screens/login_page.dart';
import 'package:talkster/model/user_model.dart';

class Databasecontroller extends GetxController {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  CollectionReference? _collectionReference;

  void SetupCollection() {
    _collectionReference = _firestore
        .collection('users')
        .withConverter<UserModel>(
            fromFirestore: (snapshot, _) =>
                UserModel.fromJson(snapshot.data()!),
            toFirestore: (UserModel, _) => UserModel.toMap());
  }

  Future<void> createUserProfile({required UserModel usermodel}) async {
    print('database creating .......');
    await _collectionReference?.doc(usermodel.uid).set(usermodel);
    print('Completedddddd');
  }

  Stream<QuerySnapshot<UserModel>> getUserProfiles() {
    return _collectionReference
        ?.where('uid', isNotEqualTo: authcontroller.user!.uid)
        .snapshots() as Stream<QuerySnapshot<UserModel>>;
  }

  @override
  void onInit() {
    SetupCollection();

    super.onInit();
  }
}
