import 'package:acadocen/UI/pages/pages.dart';
import 'package:acadocen/domain/controller/materia/materia_controller.dart';
import 'package:acadocen/domain/services/materia/data_profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewSchedule extends StatefulWidget {
  const NewSchedule({super.key});

  @override
  State<NewSchedule> createState() => _NewScheduleState();
}

class _NewScheduleState extends State<NewSchedule> {
  DateTime now = DateTime.now();
  TimeOfDay timeInitial = TimeOfDay.now();
  TimeOfDay timeFinal = TimeOfDay.now();
  late String formattedDate = DateFormat('EEEE, MMM d, yyyy').format(now);
  DataProfile dataProfile = DataProfile();

  final TextEditingController _materia = TextEditingController();
  final TextEditingController _grupos = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Get.put(ControllerMateria());
    ControllerMateria controllerMateria = Get.find();
    var data = controllerMateria.materia!.map((e) => e.nombreCourse).toList();
    controllerMateria.getMateria().then((value) => value);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                BackgroundPage(
                  fontSize: 30,
                  title: 'Nuevo horario',
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.15,
                        vertical: 20),
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Seleccionar dia',
                              style: const TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 80, 80, 80),
                                  fontWeight: FontWeight.bold),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: MaterialButton(
                                  color: Color.fromRGBO(238, 238, 238, 1),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                            '${now.day}/${now.month}/${now.year}',
                                            textAlign: TextAlign.left,
                                            style: const TextStyle(
                                                fontSize: 14,
                                                color: Color.fromARGB(
                                                    212, 95, 95, 95))),
                                        Center(
                                            child: Icon(
                                          Icons.calendar_month_outlined,
                                          color:
                                              Color.fromARGB(212, 95, 95, 95),
                                        ))
                                      ],
                                    ),
                                  ),
                                  minWidth: 400,
                                  height: 50,
                                  onPressed: () async {
                                    DateTime? picked = await showDatePicker(
                                        context: context,
                                        initialDate: now,
                                        firstDate: DateTime(2015, 8),
                                        lastDate: DateTime(2101));
                                    if (picked == null) return;
                                    setState(() => now = picked);
                                  },
                                )),
                          ],
                        ),
                        SizedBox(height: 30),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Seleccionar hora inicial',
                              style: const TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 80, 80, 80),
                                  fontWeight: FontWeight.bold),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: MaterialButton(
                                  color: Color.fromRGBO(238, 238, 238, 1),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('${timeInitial.format(context)}',
                                            textAlign: TextAlign.left,
                                            style: const TextStyle(
                                                fontSize: 14,
                                                color: Color.fromARGB(
                                                    212, 95, 95, 95))),
                                        Center(
                                            child: Icon(
                                          Icons.access_time_outlined,
                                          color:
                                              Color.fromARGB(212, 95, 95, 95),
                                        ))
                                      ],
                                    ),
                                  ),
                                  minWidth: 400,
                                  height: 50,
                                  onPressed: () async {
                                    TimeOfDay? pickedTime =
                                        await showTimePicker(
                                            context: context,
                                            initialTime: TimeOfDay.now());
                                    if (pickedTime == null) return;
                                    setState(() => timeInitial = pickedTime);
                                  },
                                )),
                            SizedBox(height: 30),
                            Text(
                              'Seleccionar hora final',
                              style: const TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 80, 80, 80),
                                  fontWeight: FontWeight.bold),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: MaterialButton(
                                  color: Color.fromRGBO(238, 238, 238, 1),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('${timeFinal.format(context)}',
                                            textAlign: TextAlign.left,
                                            style: const TextStyle(
                                                fontSize: 14,
                                                color: Color.fromARGB(
                                                    212, 95, 95, 95))),
                                        Center(
                                            child: Icon(
                                          Icons.access_time_outlined,
                                          color:
                                              Color.fromARGB(212, 95, 95, 95),
                                        ))
                                      ],
                                    ),
                                  ),
                                  minWidth: 400,
                                  height: 50,
                                  onPressed: () async {
                                    TimeOfDay? pickedTime =
                                        await showTimePicker(
                                            context: context,
                                            initialTime: TimeOfDay.now());
                                    if (pickedTime == null) return;
                                    setState(() => timeFinal = pickedTime);
                                  },
                                )),
                          ],
                        ),
                        SizedBox(height: 30),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Seleccionar materia',
                              style: const TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 80, 80, 80),
                                  fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 0),
                              child: Combobox(
                                hintText: "Seleccionar materia",
                                list: data,
                                controllerText: _materia,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 30),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Seleccionar un grupo',
                              style: const TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 80, 80, 80),
                                  fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 0),
                              child: Combobox(
                                hintText: 'Seleccionar un grupo',
                                list: ['Grupo 01', 'Grupo 02'],
                                controllerText: _grupos,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 40),
                        Button(
                          text: 'Crear horario',
                          onPressed: () {},
                          width: 200,
                        ),
                      ],
                    ),
                  ),
                ),
                Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 50, left: 30),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back_ios_new_rounded),
                        color: Colors.white,
                        iconSize: 30,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
