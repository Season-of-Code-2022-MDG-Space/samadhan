// ignore_for_file: non_constant_identifier_names, unused_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
final _auth = FirebaseAuth.instance;
Future<void> create(name, emailid, bhawan, phoneno, enrolmentno) async {
  print(_auth.currentUser!.uid);
  await FirebaseFirestore.instance.collection('Users').doc(_auth.currentUser!.uid).set({
    'Name': name,
    'Email Id': emailid,
    'Bhawan Name': bhawan,
    'Enrolment Number': enrolmentno,
    'Phone Number': phoneno,
  });
  print("User credentials created");
}

updateIC(
  icomplaint,
  ilocation,
) async {
  await FirebaseFirestore.instance.collection('Users').doc(_auth.currentUser!.uid).update({'Internet Complaint': icomplaint, 'Internet Complaint Location': ilocation});
  print('Complaints Updated');
}

updateFC(
  fcomplaint,
  flocation,
) async {
  await FirebaseFirestore.instance.collection('Users').doc(_auth.currentUser!.uid).update({'Food Complaint': fcomplaint, 'Food Complaint Location': flocation});
  print('Complaints Updated');
}

updatePC(
  pcomplaint,
  plocation,
) async {
  await FirebaseFirestore.instance.collection('Users').doc(_auth.currentUser!.uid).update({'Plumbing Complaint': pcomplaint, 'Plumbing Complaint Location': plocation});
  print('Complaints Updated');
}

updateEC(
  ecomplaint,
  elocation,
) async {
  print(_auth.currentUser!.uid);
  await FirebaseFirestore.instance.collection('Users').doc(_auth.currentUser!.uid).update({'Electricity Complaint': ecomplaint, 'Electricity Complaint Location': elocation});

  print('Complaints Updated');
}

updateOC(
  ocomplaint,
) async {
  await FirebaseFirestore.instance.collection('Users').doc(_auth.currentUser!.uid).update({'Other Complaint': ocomplaint});
  print('Complaints Updated');
}

// CollectionReference Icomplaints = FirebaseFirestore.instance.collection('Internet Complaints');
// createIC(String name, bhawan, phoneno, complaint) async {
//   await FirebaseFirestore.instance.collection('Internet Complaints').doc().set({
//     'Name': name,
//     'Bhawan Name': bhawan,
//     'Phone Number': phoneno,
//     'Complaint': complaint,
//   }).then((value) => print("Internet Complaint registered successfully"));
// }

// CollectionReference Ecomplaints = FirebaseFirestore.instance.collection('Electricity Complaints');
// createEC(String name, bhawan, phoneno, complaint) async {
//   await FirebaseFirestore.instance.collection('Water Complaints').doc().set({
//     'Name': name,
//     'Bhawan Name': bhawan,
//     'Phone Number': phoneno,
//     'Complaint': complaint,
//   }).then((value) => print("Electricity Complaint registered successfully"));
// }

// CollectionReference Wcomplaints = FirebaseFirestore.instance.collection('Water Complaints');
// createWC(String name, bhawan, phoneno, complaint) async {
//   await FirebaseFirestore.instance.collection('Water Complaints').doc().set({
//     'Name': name,
//     'Bhawan Name': bhawan,
//     'Phone Number': phoneno,
//     'Complaint': complaint,
//   }).then((value) => print("Water related Complaint registered successfully"));
// }

// CollectionReference Fcomplaints = FirebaseFirestore.instance.collection('Food Complaints');
// createFC(String name, bhawan, phoneno, complaint) async {
//   await FirebaseFirestore.instance.collection('Food Complaints').doc().set({
//     'Name': name,
//     'Bhawan Name': bhawan,
//     'Phone Number': phoneno,
//     'Complaint': complaint,
//   }).then((value) => print("Food Complaint registered successfully"));
// }

// CollectionReference othercomplaints = FirebaseFirestore.instance.collection('Other Complaints');
// createOC(String name, bhawan, phoneno, complaint) async {
//   await FirebaseFirestore.instance.collection('Other Complaints').doc().set({
//     'Name': name,
//     'Bhawan Name': bhawan,
//     'Phone Number': phoneno,
//     'Complaint': complaint,
//   }).then((value) => print("Complaint registered successfully"));
// }
