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
          title:  Text(
            "Tarefas",
            style: TextStyle(),
          ),
        ),
        body: Container(
          color: Colors.black54,
          child: ListView(
            children: const [

              Task("Jogar de sssssssssssssssssssss","https://static.wikia.nocookie.net/overwatch/images/0/04/Genji_portrait.png/revision/latest?cb=20160429040512"),
              Task("Jogar de hanzo","https://static.wikia.nocookie.net/overwatch/images/c/c2/Hanzo_portrait.png/revision/latest?cb=20160429042113"),
              Task("Jogar de Ana","https://static.wikia.nocookie.net/overwatch/images/f/fd/Ana_portrait.png/revision/latest/top-crop/width/360/height/360?cb=20160727054536"),
              Task("Jogar de Zenyatta", "https://static.wikia.nocookie.net/overwatch/images/f/f5/Zenyatta_portrait.png/revision/latest?cb=20160429042336"),
              Task("Jogar de lucio", "https://static.wikia.nocookie.net/overwatch/images/6/60/Lucio_portrait.png/revision/latest/top-crop/width/360/height/360?cb=20160429040926"),
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

  const Task(this.nome, this.foto,{Key? key}) : super(key: key);

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
            color: Colors.blueGrey,
            height: 140,
          ),
          Column(
            children: [
              Container(
                color: Colors.black38,
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      color: Colors.black87,
                      width: 72,
                      height: 100,
                      child: Image.network(
                        widget.foto
                        ,fit: BoxFit.cover,),
                    ),
                    Container(
                      width: 200,
                      child: ListView(
                          padding: EdgeInsets.fromLTRB(0, 32, 0, 0),
                          scrollDirection: Axis.horizontal,
                          children: [
                            Text(widget.nome,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    overflow: TextOverflow.ellipsis)
                            ),
                          ]
                      ),
                    ),
                    Row(
                      children: [



                      ],
                    ),
                    Container(
                      height: 52,
                      width: 52,
                      child: ElevatedButton(
                          onPressed: () {
                            print(nivel);
                            setState(() {
                              nivel++;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: const [
                              Icon(Icons.arrow_drop_up),
                              Text("Up",style:  TextStyle(fontSize: 12),)
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
                        value: nivel / 10,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Text(
                    "Nivel $nivel",
                    style: TextStyle(color: Colors.white),
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

