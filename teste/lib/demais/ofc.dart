import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    int i = 0;

    void contar() {
      i++;
    }

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: Container(),
          title: Text(
            "Tarefas",
            style: TextStyle(),
          ),
        ),
        body: Container(
          color: Colors.black54,
          child: ListView(
            children: const [
              Task("Jogar de genji", 5,
                  "https://static.wikia.nocookie.net/overwatch/images/0/04/Genji_portrait.png/revision/latest?cb=20160429040512"),
              Task("Jogar de hanzo", 2,
                  "https://static.wikia.nocookie.net/overwatch/images/c/c2/Hanzo_portrait.png/revision/latest?cb=20160429042113"),
              Task("Jogar de Ana", 3,
                  "https://static.wikia.nocookie.net/overwatch/images/f/fd/Ana_portrait.png/revision/latest/top-crop/width/360/height/360?cb=20160727054536"),
              Task("Jogar de Zenyatta", 1,
                  "https://static.wikia.nocookie.net/overwatch/images/f/f5/Zenyatta_portrait.png/revision/latest?cb=20160429042336"),
              Task("Jogar de lucio", 4,
                  "https://static.wikia.nocookie.net/overwatch/images/6/60/Lucio_portrait.png/revision/latest/top-crop/width/360/height/360?cb=20160429040926"),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {}),
      ),
    );
  }
}

class Task extends StatefulWidget {
  final String nome;
  final String foto;
  final int dificultade;

  const Task(this.nome, this.dificultade, this.foto, {Key? key})
      : super(key: key);

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int nivel = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.blueGrey,
            ),
            height: 140,
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.black38,
                ),
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.black87,

                      ),
                      width: 72,
                      height: 100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(

                          widget.foto,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 200,
                          child: Text(widget.nome,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  overflow: TextOverflow.ellipsis)),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              size: 15,
                              color: (widget.dificultade >= 1)
                                  ? Colors.blue
                                  : Colors.blue[100],
                            ),
                            Icon(
                              Icons.star,
                              size: 15,
                              color: (widget.dificultade >= 2)
                                  ? Colors.blue
                                  : Colors.blue[100],
                            ),
                            Icon(
                              Icons.star,
                              size: 15,
                              color: (widget.dificultade >= 3)
                                  ? Colors.blue
                                  : Colors.blue[100],
                            ),
                            Icon(
                              Icons.star,
                              size: 15,
                              color: (widget.dificultade >= 4)
                                  ? Colors.blue
                                  : Colors.blue[100],
                            ),
                            Icon(
                              Icons.star,
                              size: 15,
                              color: (widget.dificultade >= 5)
                                  ? Colors.blue
                                  : Colors.blue[100],
                            ),
                          ],
                        )
                      ],
                    ),
                    Container(
                      height: 52,
                      width: 52,
                      child: ElevatedButton(
                          onPressed: () {
                            print(nivel);
                            setState(() {
                              if(nivel==0){
                                nivel++;
                              }else if(nivel!= 10*widget.dificultade)
                                nivel++;
                              else{
                                print("parou");
                              }

                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: const [
                              Icon(Icons.arrow_drop_up),
                              Text(
                                "Up",
                                style: TextStyle(fontSize: 12),
                              )
                            ],
                          )),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                      width: 200,
                      child: LinearProgressIndicator(
                        color: Colors.white,
                        value: (widget.dificultade > 0)
                            ? (nivel / widget.dificultade) / 10
                            : 1,
                      ),
                    ),
                  ),
                  Text(
                    "Nível $nivel",
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
