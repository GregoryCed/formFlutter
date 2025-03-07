import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const title = 'Estudo Forms';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: const MyForm(),
        ),
    );
  }
}

class MyForm extends StatefulWidget {
  const MyForm({Key? key}) : super(key: key);

  @override
  MyFormState createState() {
    return MyFormState();
  }
}

class MyFormState extends State<MyForm>{
  final nomeController = TextEditingController();
  final emailController = TextEditingController();
  final senhaController = TextEditingController();
  final confirmaSenhaController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  String? _successMessage = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.

    return Form(
      key: _formKey,
      child: ListView(
        padding: const EdgeInsets.all(32),
        children: <Widget>[
          buildNome(),
          const SizedBox(
            height: 24,
          ),
          buildEmail(),
          const SizedBox(
            height: 24,
          ),
          buildPassword(),
          const SizedBox(
            height: 24,
          ),
          buildConfirmaPassword(),
          const SizedBox(
            height: 24,
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                print('Nome: ${nomeController.text}');
                print('Email: ${emailController.text}');
                print('Password: ${senhaController.text}');
                print('Confirmar Password: ${confirmaSenhaController.text}');
                _successMessage = 'PINTOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO';
                
              }

              else{
                _successMessage = null;
              }
            },
            child: const Text('Submit'),
          ),

          SizedBox(height: 20),
          if (_successMessage != null)
            Text(
              _successMessage!,
              style: TextStyle(color: Colors.green, fontSize: 18),
            ),
        ],
      ),
    );
  }

  Widget buildEmail() => TextFormField(
        controller: emailController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Obrigatório informar o e-mail';
          }
          if (!value.contains('@')){
            return 'O email deve contar @';
          }
            return null;
        },
        decoration: InputDecoration(          
          labelText: 'E-mail',
          border: const OutlineInputBorder(),
        ),
        keyboardType: TextInputType.emailAddress,
      );

  Widget buildPassword() => TextFormField(
        controller: senhaController,        
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Obrigatório informar a senha';
          }
          if(value.length < 6) {
            return 'A senha deve ter no mínimo 6 caracteres';
          }
          return null;
        },
        obscureText: true,
        decoration: const InputDecoration(          
          labelText: 'Password',
          border: OutlineInputBorder(),
        ),
      );

  Widget buildNome() => TextFormField(
    controller: nomeController,
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Obrigatório informar o nome';
      }
      if(value.length > 6){
        return 'O Nome deve conter pelo menos 6 caracteres';
      }
      return null;
    },
    decoration: const InputDecoration(
      labelText: 'Nome',
      border: OutlineInputBorder(),
    ),
  );

  Widget buildConfirmaPassword() => TextFormField(
    controller: confirmaSenhaController,
    validator: (value){
      if (value == null || value.isEmpty) {
        return 'Obrigatório confirmar a senha';
      }
      if (value != senhaController.text){
        return 'Senha incorreta';
      }
    },
    obscureText: true,
    decoration: const InputDecoration(
      labelText: 'Confirmar Senha',
      border: OutlineInputBorder(),
    ),
  );
  
}
