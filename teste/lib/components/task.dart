import 'package:flutter/material.dart';
import 'difficulty.dart';

class Task extends StatefulWidget {
  ///names
  final String nome;

  ///photos
  final String foto;

  ///difficulty
  final int dificultade;

  ///exp
  int nivel = 0;

  ///constructor
  Task(this.nome, this.dificultade, this.foto, {Key? key}) : super(key: key);

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  max() {
    if (specification < 6 && ((widget.nivel / widget.dificultade) / 10) != 10) {
      return true;
    }
      return false;
  }

  bool box = true;

  int i = 0;
  int specification = 0;
  Color color1 = Colors.black12;
  int red = 100;
  int green = 100;
  int blue = 200;

  bool assetOrNetwork() {
    if (widget.foto.contains('http')) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          box = !box;
        });
      },
      child: box == true
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  Container(
                    //Parte de baixo

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: color1 =
                          Color.fromARGB(99999999, red, green, blue),
                    ),

                    height: 140,
                  ),
                  Column(
                    children: [
                      Container(
                        //Parte de cima
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color.fromARGB(99999999, 200, 200, 100),
                        ),
                        height: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              //fundo imagem
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: const Color.fromARGB(
                                    99999999, 200, 200, 100),
                              ),
                              width: 72,
                              height: 100,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: assetOrNetwork()
                                    ? Image.asset(
                                        widget.foto,
                                        fit: BoxFit.cover,
                                      )
                                    : Image.network(
                                        widget.foto,
                                        fit: BoxFit.cover,
                                      ),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 200,
                                  child: Text(widget.nome,
                                      style: const TextStyle(
                                          color: Color.fromARGB(
                                              999999999, 100, 100, 200),
                                          fontSize: 20,
                                          overflow: TextOverflow.ellipsis)),
                                ),
                                Difficulty(
                                  DifficultyLevel: widget.dificultade,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 60,
                              width: 60,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: ElevatedButton(
                                    style: OutlinedButton.styleFrom(
                                        backgroundColor: const Color.fromARGB(
                                            9999999999, 100, 100, 200)),
                                    onPressed: specification < 6
                                        ? () {
                                            setState(
                                              () {
                                                if (specification < 6) {
                                                  if (((widget.nivel /
                                                          widget
                                                              .dificultade)) ==
                                                      10) {
                                                    specification++;
                                                    widget.nivel = 1;
                                                  } else {
                                                    widget.nivel++;
                                                  }
                                                } else {
                                                  widget.nivel = 10;
                                                }

                                                switch (specification) {
                                                  case 1:
                                                    {
                                                      red = 0;
                                                      green = 200;
                                                      blue = 0;
                                                    }
                                                    break;

                                                  case 2:
                                                    {
                                                      green = 200;
                                                      red = 200;
                                                    }
                                                    break;

                                                  case 3:
                                                    {
                                                      red = 255;
                                                      green = 140;
                                                    }
                                                    break;

                                                  case 4:
                                                    {
                                                      red = 255;
                                                      green = 0;
                                                      blue = 255;
                                                    }
                                                    break;
                                                  case 5:
                                                    {
                                                      red = 0;
                                                      green = 0;
                                                      blue = 0;
                                                    }
                                                    break;
                                                  default:
                                                    {}
                                                    break;
                                                }
                                              },
                                            );
                                          }
                                        : () {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                duration: Duration(
                                                    milliseconds: 500),
                                                behavior:
                                                    SnackBarBehavior.floating,
                                                content: Text(
                                                    'Está no nível máximo'),
                                              ),
                                            );
                                          },
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: const [
                                        Icon(Icons.arrow_drop_up),
                                        Text(
                                          'Up',
                                          style: TextStyle(fontSize: 12),
                                        )
                                      ],
                                    )),
                              ),
                            )
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 250,
                            child: max()
                                ? Padding(
                                    padding: const EdgeInsets.only(
                                        top: 15, left: 20),
                                    child: LinearProgressIndicator(
                                      color: Colors.black,
                                      value: (widget.dificultade > 0) ||
                                              (widget.nivel < 10)
                                          ? (widget.nivel /
                                                  widget.dificultade) /
                                              10
                                          : 10,
                                    ),
                                  )
                                : const Padding(
                                    padding: EdgeInsets.only(top: 13, left: 20),
                                    child: Text(
                                      'Nivel máximo',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 13,
                            ),
                            child: Text(
                              max() ? 'EXP: ${widget.nivel}' : 'EXP: Max',
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 13,
                            ),
                            child: Text(
                              max() ? 'Nível: $specification' : 'Nivel: 5',
                              style: const TextStyle(color: Colors.white),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )
          : Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    children: [
                      Container(
                        height: 60,
                        width: 395,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color.fromARGB(99999999, red, green, blue),
                        ),
                        child: specification < 6
                            ? const Icon(
                                Icons.remove_red_eye_outlined,
                                color: Colors.black,
                              )
                            : const Icon(
                                Icons.remove_red_eye_outlined,
                                color: Colors.white,
                              ),
                      ),
                      const Padding(
                        padding:  EdgeInsets.only(left: 370),
                        child:  Icon(Icons.arrow_drop_down),
                      )
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
