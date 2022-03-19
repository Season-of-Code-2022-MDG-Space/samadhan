// ignore_for_file: non_constant_identifier_names, unused_import

import 'package:cloud_firestore/cloud_firestore.dart';

//CollectionReference users = FirebaseFirestore.instance.collection('Users and their complaints');
create(String docName, name, emailid, bhawan, phoneno, enrolmentno) async {
  await FirebaseFirestore.instance.collection('Users').doc(docName).set({
    'Name': name,
    'Email Id': emailid,
    'Bhawan Name': bhawan,
    'Enrolment Number': enrolmentno,
    'Phone Number': phoneno,
  }).then((value) => print("User signed up successfully"));
}

updateIC(
  String docName,
  icomplaint,
  ilocation,
) async {
  await FirebaseFirestore.instance.collection('Users').doc(docName).update({'Internet Complaint': icomplaint, 'Internet Complaint Location': ilocation});
  //think of how to get multiple complaints.
  print('Complaints Updated');
}

updateFC(
  String docName,
  fcomplaint,
  flocation,
) async {
  await FirebaseFirestore.instance.collection('Users').doc(docName).update({'Food Complaint': fcomplaint, 'Food Complaint Location': flocation});
  //think of how to get multiple complaints.
  print('Complaints Updated');
}

updatePC(
  String docName,
  pcomplaint,
  plocation,
) async {
  await FirebaseFirestore.instance.collection('Users').doc(docName).update({'Plumbing Complaint': pcomplaint, 'Plumbing Complaint Location': plocation});
  //think of how to get multiple complaints.
  print('Complaints Updated');
}

updateEC(
  String docName,
  ecomplaint,
  elocation,
) async {
  await FirebaseFirestore.instance.collection('Users').doc(docName).update({'Electricity Complaint': ecomplaint, 'Electricity Complaint Location': elocation});
  //think of how to get multiple complaints.
  print('Complaints Updated');
}

updateOC(
  String docName,
  ocomplaint,
) async {
  await FirebaseFirestore.instance.collection('Users').doc(docName).update({'Other Complaint': ocomplaint});
  //think of how to get multiple complaints.
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
