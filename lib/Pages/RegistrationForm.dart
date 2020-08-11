import 'package:flutter/material.dart';
import 'package:qcm_quiz/Database/Collections.dart';

class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _key1 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/background.jpg"),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: LayoutBuilder(builder: (context, constraints) {
            return AnimatedContainer(
                duration: Duration(milliseconds: 500),
                color: Colors.transparent,
                padding: constraints.maxWidth < 500
                    ? EdgeInsets.zero
                    : EdgeInsets.all(30.0),
                child: Center(
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 30.0, horizontal: 25.0),
                    constraints: BoxConstraints(
                      maxWidth: 500,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xE9FFFFFF),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "QCM Rectruitement Test Application",
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Form(
                            key: _key1,
                            autovalidate: true,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: TextFormField(
                                    validator: (val) {
                                      if (val.length != 10) {
                                        return "Contact number must contain 10 digits.";
                                      } else {
                                        return null;
                                      }
                                    },
                                    onSaved: (val) {
                                      studentDetails.contactNo = val;
                                    },
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: "Personal Contact Number",
                                        labelStyle: TextStyle(fontSize: 20),
                                        hintText: "Preferably whatsapp number"),
                                    keyboardType: TextInputType.phone,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: TextFormField(
                                    validator: (val) {
                                      if (val.length != 9) {
                                        return "Scholar number must contain 9 digits.";
                                      } else {
                                        return null;
                                      }
                                    },
                                    onSaved: (val) {
                                      studentDetails.rollNo = val;
                                    },
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: "Scholar Number",
                                        labelStyle: TextStyle(fontSize: 20),
                                        hintText:
                                            "Scholar number or Roll number"),
                                    keyboardType: TextInputType.phone,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: TextFormField(
                                    validator: (val) {
                                      if (val.trim().length < 3) {
                                        return "Name too short";
                                      } else if (val.trim().length > 30) {
                                        return "Name too long";
                                      } else {
                                        return null;
                                      }
                                    },
                                    onSaved: (val) {
                                      studentDetails.name = val;
                                    },
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: "Name",
                                        labelStyle: TextStyle(fontSize: 20),
                                        hintText: "Full Name"),
                                    keyboardType: TextInputType.text,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: TextFormField(
                                    validator: (val) {
                                      if (val.trim().length < 3) {
                                        return "Incorrect branch name";
                                      } else {
                                        return null;
                                      }
                                    },
                                    onSaved: (val) {
                                      studentDetails.branch = val;
                                    },
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: "Branch",
                                        labelStyle: TextStyle(fontSize: 20),
                                        hintText:
                                            "Branch Name with section(if any)"),
                                    keyboardType: TextInputType.text,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          RaisedButton(
                              color: Colors.blue,
                              child: Text("Apply",
                                  style: TextStyle(color: Colors.white)),
                              onPressed: () {
                                submit();
                              })
                        ]),
                  ),
                ));
          })),
    );
  }

  submit() {
    _key1.currentState.save();
    //Firebase collection Set data from studentDetails object
  }
}
