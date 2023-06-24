import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:gap/gap.dart';
import 'package:group_button/group_button.dart';

import '../../utils/app_layout.dart';
import '../../utils/app_styles.dart';
import '../../widgets/button/button.dart';
import '../../widgets/button/rounded_button.dart';
import '../../widgets/header/gradient_appBar.dart';
import '../../widgets/text/form_text_widget.dart';
import '../../widgets/text/head_text.dart';



class Book {
  final String author;
  final String category;
  final List<String> tags;
  final String description;
  final String status;

  Book({
    required this.author,
    required this.category,
    required this.tags,
    required this.description,
    required this.status,
  });
}



class AddBookFormScreen extends StatefulWidget {
  @override
  _AddBookFormState createState() => _AddBookFormState();
}

class _AddBookFormState extends State<AddBookFormScreen> {
  final TextEditingController _contactNumberController = TextEditingController();
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _contactNameController = TextEditingController();
  late bool isFocus = false;
  final textFieldFocusNodeContactNumber = FocusNode();
  final textFieldFocusNodeAddress = FocusNode();
  final textFieldFocusNodeEmail = FocusNode();
  final textFieldFocusNodeName = FocusNode();
  final textFieldFocusNodeContactName = FocusNode();

  late String dropdownValue = 'Fiction';

  final List<String> categories = [
    'Fiction',
    'Non-fiction',
    'Sci-Fi',
    'Mystery',
    'Thriller',
    'Biography'
  ];
  final List<String> tags = [
    'Adventure',
    'Romance',
    'Sci-Fi',
    'Mystery',
    'Thriller',
    'Biography'
  ];

  String author = '';
  String category = 'Fiction';
  List<String> selectedTags = [];
  String description = '';
  String status = '';

  @override
  Widget build(BuildContext context) {
    final size = Applayout.getSize(context);

    return


      Scaffold(
          appBar: GrandientAppBar(
            showAvatar: false,
            onNavigate: () {},
            title: Styles.bookForm_cn,
            showBack: false,
            onPressback: () {},
          ),
          body: SingleChildScrollView(
            child: Card(
                child: Padding(
                    padding: EdgeInsets.all(Applayout.getHeight(16)),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconTextTitle(title: Styles.bookFormName_cn, showIcon:false),
                          Gap(Applayout.getHeight(10)),
                          Container(
                            width: Applayout.getHeight(size.width *.3),
                            child:  FormTextField(
                              focusNode: textFieldFocusNodeName,
                              controller: _companyNameController,
                              labelText: Styles.bookFormName_cn,
                              hintText: Styles.bookFormName_cn,
                              padding: 3,
                              fillColor: Styles.mainColor2,
                              focusColor: Styles.whiteColor,
                              textInputType: TextInputType
                                  .text,
                              validator: (value) {},
                            ),
                          ),
                          Gap(Applayout.getHeight(10)),
                          IconTextTitle(title: Styles.bookFormAuthor_cn, showIcon:false),
                          Gap(Applayout.getHeight(10)),
                          Container(
                            width: Applayout.getHeight(size.width *.3),
                            child:  FormTextField(
                              focusNode: textFieldFocusNodeName,
                              controller: _companyNameController,
                              labelText: Styles.bookFormAuthor_cn,
                              hintText: Styles.bookFormAuthor_cn,
                              padding: 3,
                              fillColor: Styles.mainColor2,
                              focusColor: Styles.whiteColor,
                              textInputType: TextInputType
                                  .text,
                              validator: (value) {},
                            ),
                          ),
                          Gap(Applayout.getHeight(10)),
                          IconTextTitle(title: Styles.bookFormCate_cn, showIcon:false),
                          Gap(Applayout.getHeight(10)),
                          Container(
                            width: Applayout.getHeight(size.width *.3),
                            child:
                            DropdownButtonFormField(
                              icon: Icon(Icons.keyboard_arrow_down_rounded,),
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius
                                      .circular(
                                      Applayout.getHeight(10)),
                                  borderSide: BorderSide(
                                      color: Styles.mainColor2,
                                      width: 1),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius
                                      .circular(
                                      Applayout.getHeight(10)),
                                  borderSide: BorderSide(
                                      color: Styles.mainColor2,
                                      width: 1),
                                ),
                                filled: true,
                                fillColor: Styles.whiteColor,
                              ),
                              dropdownColor: Styles.whiteColor,
                              value: dropdownValue,
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownValue = newValue!;
                                });
                              },
                              items: categories.map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value, style: TextStyle(fontSize: 14,),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                          Gap(Applayout.getHeight(10)),
                          IconTextTitle(title: Styles.bookFormTag_cn, showIcon:false),
                          Gap(Applayout.getHeight(10)),
                          GroupButton(
                            isRadio: false,
                              maxSelected:3,
                            onSelected: (value, index, isSelected) {

                            },
                            buttons: ["12:00", "13:00", "14:30", "18:00", "19:00", "21:40"],
                          ),

                          Gap(Applayout.getHeight(10)),
                          IconTextTitle(title: Styles.bookFormDesc_cn, showIcon:false),
                          Gap(Applayout.getHeight(10)),
                          Container(
                              width: Applayout.getHeight(size.width *.8),
                              child:
                              FormTextField(
                                focusNode: textFieldFocusNodeName,
                                controller: _companyNameController,
                                labelText: Styles.bookFormDesc_cn,
                                hintText: Styles.bookFormDesc_cn,
                                padding: 3,
                                fillColor: Styles.mainColor2,
                                focusColor: Styles.whiteColor,
                                textInputType: TextInputType.text,
                                minLines: 3,
                                maxLines: 5,
                                validator: (value) {},
                              ),
                          ),
                          Gap(Applayout.getHeight(20)),

                          CustomButton(
                            onPressed: () async {
                              // String email = emailController.text
                              //     .trim();
                              // String password = passwordController.text
                              //     .trim();
                              // if (!EmailValidator.validate(email)) {
                              //   ToastUtil.showToast(Styles.emailError);
                              //
                              // } else if (notNullChecking([email, password] ,["email", "password"]) == true) {
                              //   await controller.login(email, password)
                              //       .then((value) async {
                              //     if (value != null && value == true) {
                              //       CustomNavigator.toHomePage(context);
                              //     }
                              //   });
                              // }
                            },
                            title: Styles.confirm_cn,
                          ),

                        ])


                )
            ),
          ));
  }
}
