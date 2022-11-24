import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int i = 0;
  void contar() {
    i++;
    print(i);
  }
  void menos(){
    i--;
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                color: Colors.purple,
                width: 100,
                height: 100,
              ),
              Container(
                color: Colors.orange,
                width: 50,
                height: 50,
              )
            ],
          ),
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                color: Colors.orange,
                width: 100,
                height: 100,
              ),
              Container(
                color: Colors.purple,
                width: 50,
                height: 50,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                color: Color.fromARGB(999, 32, 123, 3),
                width: 50,
                height: 50,
              ),
              Container(
                color: Colors.green,
                width: 50,
                height: 50,
              ),
              Container(
                color: Colors.yellow,
                width: 50,
                height: 50,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    contar();
                  });

                },
                child: Text("Aumentar"),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    menos();
                  });

                },
                child: Text("Diminui"),
              ),
            ],


          ),



          Container(
            color: i <10 ? Colors.deepPurpleAccent : Colors.blue ,
            height: 30,
            width: 400,
            child: Text(

              "Num: $i",
              style: const TextStyle(
                color: Colors.orange,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
