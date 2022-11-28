import 'package:acadocen/UI/ui.dart';
import 'package:flutter/material.dart';

import '../../domain/services/user/data_profile.dart';

class CardCourse extends StatelessWidget {
  final String name;
  final VoidCallback onPressed;
  const CardCourse({super.key, required this.name, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: InkWell(
          onTap: onPressed,
          onLongPress: () {
            _eliminarmateria(context, name);
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  ColorsApp.gradiant1,
                  ColorsApp.gradiant2,
                ],
              ),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 17.0, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(name,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w800)),
                  Image.asset('assets/images/arrow.png', width: 20)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _eliminarmateria(context, String materia) {
    DataProfile dataProfile = DataProfile();
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: const Text('Eliminar Materia'),
              content: Text('Realmente desea eliminar ${materia}'),
              actions: [
                TextButton(
                    onPressed: () {
                      dataProfile.deleteMateria(materia);
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Eliminar',
                      style: TextStyle(color: Colors.red),
                    )),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Cancelar',
                      style: TextStyle(color: Colors.blue),
                    ))
              ],
            ));
  }
}
