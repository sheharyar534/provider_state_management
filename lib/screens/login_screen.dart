import 'package:flutter/material.dart';
import 'package:flutter_provider_state/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Log In ",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Login", style: TextStyle(fontSize: 50)),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'Enter Email',
                suffixIcon: Icon(Icons.email),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                hintText: 'Enter Password',
                suffixIcon: IconButton(
                    onPressed: () {}, icon: Icon(Icons.remove_red_eye)),
              ),
            ),
            SizedBox(
              height: 50,
            ),
             Consumer<AuthProvider>(builder: (context, value, child){
              return  GestureDetector(
              onTap: () {
                final email = emailController.text.trim();
                final password = passwordController.text.trim();
                value.logIn(email, password);
              },
              child: Container(
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(30)),
                child: Center(
                    child: value.isLoading
                        ? CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Text("login",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20))),
              ),
            );
             }
             )
          ],
        ),
      ),
    );
  }
}
