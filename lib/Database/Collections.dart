class StudentDetails {
  String name;
  String rollNo;
  String email;
  String branch;
  String id;
  String contactNo;
  String dpURL;

  StudentDetails({
    this.email,
    this.id,
    this.dpURL,
    this.name,
    this.contactNo,
    this.branch,
    this.rollNo,
  });

//  factory StudentDetails.deSerialize(DocumentSnapshot doc) {
//    return StudentDetails(
//      name: doc["name"],
//      rollNo: doc["rollno"],
//      email: doc["email"],
//      branch: doc["branch"],
//      id: doc["id"],
//      contactNo: doc["contactNo"],
//      dpURL: doc["dpURL"],
//    );
//  }
}

StudentDetails studentDetails = StudentDetails();
