import 'dart:io';

import 'package:camera_example/camara_ui.dart';
import 'package:flutter/material.dart';

class PruebaFoto extends StatefulWidget {
  PruebaFoto({Key? key}) : super(key: key);

  @override
  _PruebaFotoState createState() => _PruebaFotoState();
}

class _PruebaFotoState extends State<PruebaFoto> {
  File? image1;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showSelector(context, image1, 1);
      },
      child: Container(
        width: MediaQuery.of(context).size.width - 40,
        height: 170,
        decoration: BoxDecoration(
          border: Border.all(
            color: image1 == null ? Color(0xffBBBCBB) : Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: image1 == null
            ? Icon(Icons.add_rounded, size: 90, color: Color(0xffBBBCBB))
            : ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.file(
                  image1!,
                  fit: BoxFit.cover,
                ),
              ),
      ),
    );
  }

  File? showSelector(BuildContext context, File? imageX, int container) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () async {
                    Navigator.pop(context);
                    //** INCLUIR PARA CAMARA: Uso de la pantalla para tomar las fotos */
                    switch (container) {
                      case 1:
                        image1 = File(
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CameraExampleHome(),
                            ),
                          ),
                        );
                        print("HOME: imagen retornada");
                        print(image1);
                        break;
                      default:
                        return;
                    }
                    setState(() {});
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.photo_camera_outlined,
                        size: 25,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Abrir cámara"),
                    ],
                  ),
                ),
                SizedBox(height: 25),
                InkWell(
                  onTap: () async {
                    Navigator.pop(context);
                    switch (container) {
                      case 1:
                        image1 = null;
                        break;
                      default:
                        return;
                    }
                    setState(() {});
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.delete_outline,
                        size: 25,
                        color: Colors.red,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Eliminar foto",
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
