import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../call/call_screen.dart';
import '../../../constants.dart';

class HomeTab extends StatefulWidget {
  HomeTab({Key key}) : super(key: key);

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        leadingWidth: double.infinity,
        toolbarHeight: 110,
        flexibleSpace: Center(
          child: Container(
            margin: const EdgeInsets.only(top: 30),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  height: 70,
                  width: 70,
                  child: SvgPicture.asset(
                    'assets/images/DoctorImage.svg',
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "¡Bienvenido!",
                      style: boldoHeadingTextStyle.copyWith(
                          fontSize: 24, color: Constants.primaryColor500),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    const Text("Lunes, 14 de septiembre"),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: ListView(children: [
          for (String appointment in ["1", "2", "3"])
            Card(
              elevation: 5,
              margin: const EdgeInsets.only(
                  bottom: 24, left: 16, right: 16, top: 24),
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.white70, width: 1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Container(
                    height: 105,
                    padding: const EdgeInsets.all(16),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            "Sala de espera",
                            style: boldoHeadingTextStyle,
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Text(
                              "La sala de espera de tu consulta con Dr. House ya se encuentra habilitada. ",
                              style: boldoSubTextStyle.copyWith(
                                height: 1.2,
                                fontSize: 15,
                              ))
                        ]),
                  ),
                  Container(
                    width: double.infinity,
                    height: 1,
                    color: const Color(0xffE5E7EB),
                  ),
                  Container(
                    height: 52,
                    child: Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 52,
                            child: TextButton(
                              onPressed: () {
                                String appointmentId = appointment;
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CallScreen(
                                          appointmentId: appointmentId),
                                    ));
                              },
                              child: Text(
                                'Ingresar',
                                style: boldoHeadingTextStyle.copyWith(
                                    color: Constants.primaryColor500),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )

          // Text(
          //   "Agrega tu primera cita",
          //   style: TextStyle(
          //       color: Colors.grey[850],
          //       fontSize: 18,
          //       fontWeight: FontWeight.w500),
          // ),
          // const SizedBox(
          //   height: 20,
          // ),
          // Container(
          //   width: 240,
          //   child: Text(
          //     "Consulta la lista de doctores y programá tu primera cita",
          //     textAlign: TextAlign.center,
          //     style: TextStyle(
          //         color: Colors.grey[400],
          //         fontWeight: FontWeight.w400,
          //         fontSize: 17),
          //   ),
          // )
        ]),
      ),
    );
  }
}