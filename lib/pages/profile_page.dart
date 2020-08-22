import 'package:flutter/material.dart';
import 'package:smart_health/custom_widgets/appbar.dart';
import 'package:smart_health/custom_widgets/drawer.dart';
import 'package:smart_health/custom_widgets/emergency_float_button.dart';
import 'package:smart_health/custom_widgets/user_details_column.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _editBasicDetails = false;
  bool _editMedicalDetails = false;
  bool _editEmergencyContact = false;
  IconData _editBasicDetailsIcon = Icons.mode_edit;
  IconData _editMedicalDetailsIcon = Icons.mode_edit;
  IconData _editEmergencyContactIcon = Icons.mode_edit;
  final GlobalKey<FormState> _basicInfoFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _medicalInfoFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _emergencyContactFormKey = GlobalKey<FormState>();
  Map<String, dynamic> _basicInfoFormData = {
    'name': null,
    'age': null,
    'email': null,
    'phone': null
  };
  Map<String, dynamic> _medicalInfoFormData = {
    'height': null,
    'weight': null,
    'bloodType': null,
    'alergies': null,
    'doctor': null
  };
  Map<String, dynamic> _emergencyContactFormData = {
    'name': null,
    'phone': null,
    'email': null,
    'relation': null
  };

  Widget _buildBasicInfoTextField(
      BuildContext context,
      String initialValue,
      String labelText,
      String formProperty,
      TextInputType keyboardType,
      bool readOnly) {
    return Container(
      height: 50.0,
      padding: EdgeInsets.only(left: 15.0, right: 15.0),
      child: TextFormField(
        readOnly: !readOnly,
        enabled: readOnly,
        keyboardType: keyboardType,
        initialValue: initialValue,
        cursorColor: Colors.grey,
        decoration: InputDecoration(
          focusColor: Colors.grey,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          labelText: "$labelText:",
        ),
        validator: (String typed) {
          if (typed.isEmpty) {
            return "$labelText can't be empty.";
          }
          return null;
        },
        onSaved: (String typed) {
          _basicInfoFormData[formProperty] = typed;
        },
      ),
    );
  }

  Widget _buildMedicalInfoTextField(
      BuildContext context,
      String initialValue,
      String labelText,
      String formProperty,
      TextInputType keyboardType,
      bool readOnly) {
    return Container(
      height: 50.0,
      padding: EdgeInsets.only(left: 15.0, right: 15.0),
      child: TextFormField(
        readOnly: !readOnly,
        enabled: readOnly,
        keyboardType: keyboardType,
        initialValue: initialValue,
        cursorColor: Colors.grey,
        decoration: InputDecoration(
          focusColor: Colors.grey,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          labelText: "$labelText:",
        ),
        validator: (String typed) {
          if (typed.isEmpty) {
            return "$labelText can't be empty.";
          }
          return null;
        },
        onSaved: (String typed) {
          _medicalInfoFormData[formProperty] = typed;
        },
      ),
    );
  }

  Widget _buildEmergencyContactTextField(
      BuildContext context,
      String initialValue,
      String labelText,
      String formProperty,
      TextInputType keyboardType,
      bool readOnly) {
    return Container(
      height: 50.0,
      padding: EdgeInsets.only(left: 15.0, right: 15.0),
      child: TextFormField(
        readOnly: !readOnly,
        enabled: readOnly,
        keyboardType: keyboardType,
        initialValue: initialValue,
        cursorColor: Colors.grey,
        decoration: InputDecoration(
          focusColor: Colors.grey,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          labelText: "$labelText:",
        ),
        validator: (String typed) {
          if (typed.isEmpty) {
            return "$labelText can't be empty.";
          }
          return null;
        },
        onSaved: (String typed) {
          _emergencyContactFormData[formProperty] = typed;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: EmergencyFloatButton(),
        appBar: CustomAppBar(),
        drawer: CustomDrawer(),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                UserDetailsColumn(profileDetails: true),
                Divider(),

                // Basic information form

                Padding(
                  padding: EdgeInsets.only(left: 15.0, bottom: 9.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Basic information",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 18.0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: GestureDetector(
                          child: Icon(_editBasicDetailsIcon, size: 20.0),
                          onTap: () {
                            setState(() {
                              _editBasicDetailsIcon = Icons.save;
                              _editBasicDetails = true;
                            });
                          },
                        ),
                      ),
                      Visibility(
                        visible: _editBasicDetails,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: GestureDetector(
                            child: Icon(Icons.cancel, size: 20.0),
                            onTap: () {
                              setState(() {
                                _editBasicDetailsIcon = Icons.mode_edit;
                                _editBasicDetails = false;
                              });
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Form(
                    key: _basicInfoFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        _buildBasicInfoTextField(context, "Keith Scott", "Name",
                            'name', TextInputType.text, _editBasicDetails),
                        SizedBox(height: 10.0),
                        _buildBasicInfoTextField(context, "33", "Age", 'age',
                            TextInputType.number, _editBasicDetails),
                        SizedBox(height: 10.0),
                        _buildBasicInfoTextField(
                            context,
                            "keith.scott@mymail.com",
                            "Email",
                            'email',
                            TextInputType.emailAddress,
                            _editBasicDetails),
                        SizedBox(height: 10.0),
                        _buildBasicInfoTextField(
                            context,
                            "+1-541-754-3010",
                            "Phone number",
                            'phone',
                            TextInputType.number,
                            _editBasicDetails),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10.0),

                // Medical information form

                Padding(
                  padding: EdgeInsets.only(left: 15.0, bottom: 9.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Medical information",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 18.0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: GestureDetector(
                          child: Icon(_editMedicalDetailsIcon, size: 20.0),
                          onTap: () {
                            setState(() {
                              _editMedicalDetailsIcon = Icons.save;
                              _editMedicalDetails = true;
                            });
                          },
                        ),
                      ),
                      Visibility(
                        visible: _editMedicalDetails,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: GestureDetector(
                            child: Icon(Icons.cancel, size: 20.0),
                            onTap: () {
                              setState(() {
                                _editMedicalDetailsIcon = Icons.mode_edit;
                                _editMedicalDetails = false;
                              });
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Form(
                    key: _medicalInfoFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        _buildMedicalInfoTextField(
                            context,
                            "180",
                            "Height",
                            'height',
                            TextInputType.number,
                            _editMedicalDetails),
                        SizedBox(height: 10.0),
                        _buildMedicalInfoTextField(
                            context,
                            "90",
                            "Weight",
                            'weight',
                            TextInputType.number,
                            _editMedicalDetails),
                        SizedBox(height: 10.0),
                        _buildMedicalInfoTextField(
                            context,
                            "AB+",
                            "Blood type",
                            'bloodType',
                            TextInputType.text,
                            _editMedicalDetails),
                        SizedBox(height: 10.0),
                        _buildMedicalInfoTextField(
                            context,
                            "Nuts, Sea food",
                            "Alergies",
                            'alergies',
                            TextInputType.text,
                            _editMedicalDetails),
                        SizedBox(height: 10.0),
                        _buildMedicalInfoTextField(
                            context,
                            "Brad Towns",
                            "Assigned doctor",
                            'doctor',
                            TextInputType.text,
                            _editMedicalDetails),
                        SizedBox(height: 10.0)
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10.0),

                // Emergency contact information form

                Padding(
                  padding: EdgeInsets.only(left: 15.0, bottom: 9.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Emergency contact",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 18.0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: GestureDetector(
                          child: Icon(_editEmergencyContactIcon, size: 20.0),
                          onTap: () {
                            setState(() {
                              _editEmergencyContactIcon = Icons.save;
                              _editEmergencyContact = true;
                            });
                          },
                        ),
                      ),
                      Visibility(
                        visible: _editEmergencyContact,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: GestureDetector(
                            child: Icon(Icons.cancel, size: 20.0),
                            onTap: () {
                              setState(() {
                                _editEmergencyContactIcon = Icons.mode_edit;
                                _editEmergencyContact = false;
                              });
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Form(
                    key: _emergencyContactFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        _buildEmergencyContactTextField(
                            context,
                            "John Knoxvell",
                            "Name",
                            'name',
                            TextInputType.text,
                            _editEmergencyContact),
                        SizedBox(height: 10.0),
                        _buildEmergencyContactTextField(
                            context,
                            "+1-770-651-9826",
                            "Phone",
                            'phone',
                            TextInputType.number,
                            _editEmergencyContact),
                        SizedBox(height: 10.0),
                        _buildEmergencyContactTextField(
                            context,
                            "john.knoxvell@mymail.com",
                            "Email",
                            'email',
                            TextInputType.emailAddress,
                            _editEmergencyContact),
                        SizedBox(height: 10.0),
                        _buildEmergencyContactTextField(
                            context,
                            "Friend",
                            "Relation",
                            'relation',
                            TextInputType.text,
                            _editEmergencyContact),
                        SizedBox(height: 10.0)
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10.0)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
