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

update(String docName, Icomplaint, Fcomplaint, Pcomplaint, Ecomplaint, Ocomplaint) async {
  await FirebaseFirestore.instance.collection('Users').doc(docName).update({
    'Internet Complaint': Icomplaint,
    'Food Complaint': Fcomplaint,
    'Plumbing Complaint': Pcomplaint,
    'Electricity Complaint': Ecomplaint,
    'Other Complaint': Ocomplaint,
  });
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
