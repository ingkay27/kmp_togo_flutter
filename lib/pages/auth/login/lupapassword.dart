import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kmp_togo_mobile/providers/auth/provider_auth.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class LupaPassword extends StatefulWidget {
  const LupaPassword({super.key});

  @override
  State<LupaPassword> createState() => _LupaPasswordState();
}

class _LupaPasswordState extends State<LupaPassword> {
  bool passhide = true;
  bool passhide1 = true;
  bool passhide2 = true;
  bool loading = false;
  TextEditingController numbercontroller = TextEditingController();
  TextEditingController passnewcontroller = TextEditingController();
  TextEditingController passnew2controller = TextEditingController();
  List<FocusNode> _focusNodes = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
  ];
  final _formKey = GlobalKey<FormState>();

  changepasswprd(String? number) async {
    if (_formKey.currentState!.validate()) {
      print('asas');
      await Provider.of<ProviderAuthLogin>(context, listen: false)
          .kirimotpresetPass(context, number);
      setState(() {
        loading = Provider.of<ProviderAuthLogin>(context, listen: false)
            .loadingLupaPassword;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Lupa Password'),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.only(right: 20.0, left: 20),
              padding: EdgeInsets.only(right: 5.0, left: 5),
              decoration: BoxDecoration(
                  border: Border.all(), borderRadius: BorderRadius.circular(3)),
              child: Row(
                children: [
                  Text(
                    '+62',
                    style: TextStyle(fontSize: 17),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: TextFormField(
                      // obscureText: passhide,

                      keyboardType: TextInputType.phone,
                      controller: numbercontroller,
                      decoration: InputDecoration(
                          // contentPadding:
                          //     const EdgeInsets.symmetric(vertical: 20),
                          // prefixIcon: Icon(
                          //   Icons.phone_android,
                          //   color: _focusNodes[0].hasFocus
                          //       ? Color(0xFF85014e)
                          //       : Colors.grey.shade400,
                          //   size: 7.w,
                          // ),

                          // labelText: "Masukan Nomor Telphone",
                          // border: const OutlineInputBorder(),
                          border: InputBorder.none,
                          hintText: 'Masukan Nomor Telphone',
                          hintStyle: TextStyle(fontSize: 17)
                          // suffixIcon: IconButton(
                          //     icon: Icon(
                          //       passhide ? Icons.visibility_off : Icons.visibility,
                          //       color: _focusNodes[1].hasFocus
                          //           ? Color(0xFF85014e)
                          //           : Colors.grey.shade400,
                          //       size: 7.w,
                          //     ),
                          //     onPressed: () {
                          //       setState(() {
                          //         passhide = !passhide;
                          //       });
                          //     })
                          ),
                      validator: (password) {
                        if (password!.isEmpty) {
                          return "Masukan Nomor Telphone";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            // Container(
            //   padding: const EdgeInsets.only(top: 20),
            //   margin: const EdgeInsets.only(right: 20.0, left: 20),
            //   child: TextFormField(
            //     obscureText: passhide1,
            //     controller: passnewcontroller,
            //     decoration: InputDecoration(
            //         contentPadding: const EdgeInsets.symmetric(vertical: 20),
            //         prefixIcon: Icon(
            //           Icons.lock,
            //           color: _focusNodes[1].hasFocus
            //               ? Color(0xFF85014e)
            //               : Colors.grey.shade400,
            //           size: 7.w,
            //         ),
            //         labelText: "Enter New Password",
            //         border: const OutlineInputBorder(),
            //         suffixIcon: IconButton(
            //             icon: Icon(
            //               passhide ? Icons.visibility_off : Icons.visibility,
            //               color: _focusNodes[1].hasFocus
            //                   ? Color(0xFF85014e)
            //                   : Colors.grey.shade400,
            //               size: 7.w,
            //             ),
            //             onPressed: () {
            //               setState(() {
            //                 passhide1 = !passhide1;
            //               });
            //             })),
            //     validator: (password) {
            //       if (password!.isEmpty) {
            //         return "You must enter password";
            //       } else {
            //         return null;
            //       }
            //     },
            //   ),
            // ),
            // Container(
            //   padding: const EdgeInsets.only(top: 20),
            //   margin: const EdgeInsets.only(right: 20.0, left: 20),
            //   child: TextFormField(
            //     obscureText: passhide2,
            //     controller: passnew2controller,
            //     decoration: InputDecoration(
            //         contentPadding: const EdgeInsets.symmetric(vertical: 20),
            //         prefixIcon: Icon(
            //           Icons.lock,
            //           color: _focusNodes[2].hasFocus
            //               ? Color(0xFF85014e)
            //               : Colors.grey.shade400,
            //           size: 7.w,
            //         ),
            //         labelText: "Enter Repeat Password",
            //         border: const OutlineInputBorder(),
            //         suffixIcon: IconButton(
            //             icon: Icon(
            //               passhide ? Icons.visibility_off : Icons.visibility,
            //               color: _focusNodes[1].hasFocus
            //                   ? Color(0xFF85014e)
            //                   : Colors.grey.shade400,
            //               size: 7.w,
            //             ),
            //             onPressed: () {
            //               setState(() {
            //                 passhide2 = !passhide2;
            //               });
            //             })),
            //     validator: (password) {
            //       if (password!.isEmpty) {
            //         return "You must enter password";
            //       } else if (password != passnewcontroller.text) {
            //         return "You must enter doest match";
            //       } else {
            //         return null;
            //       }
            //     },
            //   ),
            // ),
            loading == false
                ? Padding(
                    padding:
                        const EdgeInsets.only(right: 20.0, left: 20.0, top: 40),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          loading = true;
                        });
                        changepasswprd(numbercontroller.text);
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 70),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: const Color(0xFF85014e)),
                        child: const Text(
                          'Simpan',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize: 15),
                        ),
                      ),
                    ),
                  )
                : InkWell(
                    onTap: () {},
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.only(
                            right: 20.0, left: 20.0, top: 40),
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 70),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.grey),
                        child: Center(
                          child: SizedBox(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                            height: 2.h,
                            width: 4.w,
                          ),
                        )),
                  ),
          ]),
        ),
      ),
    );
  }
}