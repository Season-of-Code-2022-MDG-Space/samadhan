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
}

updateIC(
  icomplaint,
  ilocation,
) async {
  await FirebaseFirestore.instance.collection('Users').doc(_auth.currentUser!.uid).update({'Internet Complaint': icomplaint, 'Internet Complaint Location': ilocation});
}

updateFC(
  fcomplaint,
  flocation,
) async {
  await FirebaseFirestore.instance.collection('Users').doc(_auth.currentUser!.uid).update({'Food Complaint': fcomplaint, 'Food Complaint Location': flocation});
}

updatePC(
  pcomplaint,
  plocation,
) async {
  await FirebaseFirestore.instance.collection('Users').doc(_auth.currentUser!.uid).update({'Plumbing Complaint': pcomplaint, 'Plumbing Complaint Location': plocation});
}

updateEC(
  ecomplaint,
  elocation,
) async {
  print(_auth.currentUser!.uid);
  await FirebaseFirestore.instance.collection('Users').doc(_auth.currentUser!.uid).update({'Electricity Complaint': ecomplaint, 'Electricity Complaint Location': elocation});
}

updateOC(
  ocomplaint,
) async {
  await FirebaseFirestore.instance.collection('Users').doc(_auth.currentUser!.uid).update({'Other Complaint': ocomplaint});
}
