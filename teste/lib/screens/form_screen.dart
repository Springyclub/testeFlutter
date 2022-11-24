import 'package:flutter/material.dart';
import '../data/task_inherited.dart';

///class
class FormScreen extends StatefulWidget {
  ///construtor
  const FormScreen({Key? key, required this.taskContext}) : super(key: key);
  ///final
  final BuildContext taskContext;

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController difficultyController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool valueValidator(String? value) {
    if (value != null && value.isEmpty) {
      return true;
    }
    return false;
  }

  bool difficulty(String? value) {
    if (value != null && value.isEmpty) {
      return true;
    }
    if (int.parse(value!) > 5 || int.parse(value) < 1) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Criando novo campeão')),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              height: 600,
              width: 400,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(99999999, 100, 100, 200),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(width: 3)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: TextFormField(
                      toolbarOptions: const ToolbarOptions(),
                      textCapitalization: TextCapitalization.words,//importante
                      validator: (value) {
                        if (valueValidator(value)) {
                          return 'Insira o nome da tarefa';
                        }
                        return null;
                      },
                      controller: nameController,
                      textAlign: TextAlign.start,
                      decoration: const InputDecoration(
                        label: Text.rich(
                          TextSpan(
                            children: <InlineSpan>[
                              WidgetSpan(
                                child: Text('Tarefa'),
                              ),
                              WidgetSpan(
                                child: Text(
                                  '*',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            ],
                          ),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      validator: (value) {
                        if (difficulty(value)) {
                          return 'Insira uma dificuldade entre 1 e 5';
                        }
                        return null;
                      },
                      controller: difficultyController,
                      textAlign: TextAlign.start,
                      decoration: const InputDecoration(
                        label: Text.rich(
                          TextSpan(
                            children: <InlineSpan>[
                              WidgetSpan(
                                child: Text('Dificuldade'),
                              ),
                              WidgetSpan(
                                child: Text(
                                  '*',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            ],
                          ),
                        ),
                        //border: OutlineInputBorder(), está fora do esperado
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      onSaved: (value) {
                      },
                      validator: (value) {
                        if (valueValidator(value)) {
                          return 'Insira uma URL de imagem';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.url,
                      onChanged: (text) {
                        setState(() {});
                      },
                      controller: imageController,
                      textAlign: TextAlign.start,
                      decoration: const InputDecoration(
                        label: Text.rich(
                          TextSpan(
                            children: <InlineSpan>[
                              WidgetSpan(
                                child: Text('Imagem'),
                              ),
                              WidgetSpan(
                                  child: Text(
                                '*',
                                style: TextStyle(color: Colors.red),
                              ))
                            ],
                          ),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 72,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(width: 4)),
                    child: ClipRRect(
                      child: Image.network(
                        fit: BoxFit.cover,
                        imageController.text,
                        errorBuilder: (context, exception,
                            stackTrace) {
                          return Image.asset(
                              'assets/images/camera-removebg-preview.png');
                        },
                      ),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // print(nameController.text);
                          // print(difficultyController.text);
                          // print(imageController.text);
                          TaskInherited.of(widget.taskContext).newTask(
                              nameController.text,
                              int.parse(difficultyController.text),
                              imageController.text);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Salvando Tarefa nova...')),
                          );
                          Navigator.pop(context);
                        }
                      },
                      child: const Text('Adicionar')),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          splashColor: Colors.red,
          onPressed: () {

          },
          child: const Icon(Icons.check),
        ),
      ),
    );
  }
}

