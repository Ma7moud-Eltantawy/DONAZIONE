import 'dart:developer';

import 'package:blood_donar/core/Models/Request_model.dart';
import 'package:blood_donar/core/Models/userdatamodel.dart';
import 'package:blood_donar/core/constants.dart';
import 'package:blood_donar/core/entities/useralldata.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


import '../../core/Models/moreinfomodel.dart';
import '../../core/Models/question_model.dart';
import '../../core/Models/useralldata.dart';
import '../../core/enums.dart';
import '../../core/networking/request_result.dart';

abstract class DonersBaseDataSource{
 Future<RequestResult<List<AllUsersdatamodel>>> Getallusers();
 Future<RequestResult<List<Requestdatamodel>>> GetRequests({required String id});
 Future<RequestResult> Adddonate({required String reciveid});
 Future<RequestResult> AddRequest({required String reciveid,required Requestdatamodel req});

 //Future<RequestResult<List<>>> Getallusers();


}

class Donersremotedatasource implements DonersBaseDataSource{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<RequestResult<List<AllUsersdatamodel>>> Getallusers() async {
    List<AllUsersdatamodel> allusers=<AllUsersdatamodel>[];
    try {
      QuerySnapshot snapshot = await _firestore.collection("user_data").get();

      for (DocumentSnapshot document in snapshot.docs) {
        Userdatamodel user = Userdatamodel.fromJson(document.data() as Map<String, dynamic>);
        print(user.name);
        QuerySnapshot snapshot2 = await _firestore.collection("user_data").doc("${user.id}").collection("moreinfo").get();
        print(snapshot2.docs);
      DocumentSnapshot document2 = await _firestore
          .collection("user_data")
          .doc(user.id)
          .collection("moreinfo")
          .doc(user.id)
          .get();

      if (document2.exists) {
        moreinfodatamodel usermoreinfo = moreinfodatamodel.fromJson(
            document2.data() as Map<String, dynamic>);
        print(usermoreinfo.platelets.toString());
        print(user.bloodtype);
        AllUsersdatamodel userinfo_data = AllUsersdatamodel(
          id: user.id,
          timedonated: "2",
          pic: usermoreinfo.pic,
          phone: user.phone,
          location: user.location,
          bloodtype: user.bloodtype,
          name: user.name,
        );
        allusers.add(userinfo_data);
        print("---------------------");
      } else {
        print("Document not found");
      }
      }

      return RequestResult(requestState: RequestState.success, data: allusers);
    } catch (error) {
      // Handle error appropriately, e.g., log it
      print("Error fetching users: $error");
      return RequestResult(requestState: RequestState.failed, errorMessage: error.toString());
    }
  }

  @override
  Future<RequestResult<List<Requestdatamodel>>> GetRequests({required String id}) async {
    List<Requestdatamodel> Requests=<Requestdatamodel>[];
    try {

      QuerySnapshot snapshot = await _firestore.collection("Requests").doc(id).collection(id).get();

      for (DocumentSnapshot document in snapshot.docs) {
        Requestdatamodel req = Requestdatamodel.fromJson(document.data() as Map<String, dynamic>);
        Requests.add(req);

      }
      print(Requests[0].phone);

      return RequestResult(requestState: RequestState.success, data: Requests);
    } catch (error) {
      // Handle error appropriately, e.g., log it
      print("Error fetching users: $error");
      return RequestResult(requestState: RequestState.failed, errorMessage: error.toString());
    }
  }

  @override
  Future<RequestResult> AddRequest({required String reciveid, required Requestdatamodel req}) async {
    print(currentuserdata!.id);
    print("reciveid  $reciveid");
    try {
      await _firestore.collection("Requests").doc(reciveid).collection(reciveid).doc(req.id).set(req.toJson());
      return RequestResult(
          requestState: RequestState.success);
    } catch (e) {
      return RequestResult(
          requestState: RequestState.failed, errorMessage: e.toString());
    }
  }

  @override
  Future<RequestResult> Adddonate({required String reciveid}) async{
    try {
      await _firestore.collection("Requests").doc(currentuserdata!.id!).collection(currentuserdata!.id!).doc(reciveid).update({
        "donated":true

      });
      return RequestResult(
          requestState: RequestState.success);
    } catch (e) {
      return RequestResult(
          requestState: RequestState.failed, errorMessage: e.toString());
    }
  }

 /* @override
  Future<RequestResult<RequestState>>AddRequest ({required String id, required Requestdatamodel req}) async {
    try {
      await _firestore.collection("Requests").doc(id).set(req.toJson());
      return RequestResult(
          requestState: RequestState.success, data: RequestState.success);
    } catch (e) {
      return RequestResult(
          requestState: RequestState.failed, errorMessage: e.toString());
    }
  }*/

}
