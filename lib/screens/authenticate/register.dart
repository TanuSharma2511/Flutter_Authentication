import 'package:Project3/services/auth.dart';
import 'package:Project3/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:Project3/screens/authenticate/sign_in.dart';


class Register extends StatefulWidget {

  final Function toggleView;
  Register({ this.toggleView });

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;

  // text field state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: false,
      body:SingleChildScrollView(
        child: Container(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
        
         new Image.asset('assets/birdLogo.png', width: 200.0, height: 200.0),
         
          Text("Create New Account",
          style: TextStyle(color: Colors.black,
          fontSize: 36.0, fontWeight: FontWeight.bold)
          ),
            SizedBox(height: 20.0),
           Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 40.0),
            
          child: Text("Please enter your details to create a new account",
          textAlign: TextAlign.center,
          
          style: TextStyle(color: Colors.grey,
          fontSize: 18.0,  )
          ),
            ),
         Padding(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
              decoration: InputDecoration(
                 enabledBorder: OutlineInputBorder(
	             borderRadius: BorderRadius.all(Radius.circular(30.0)),
		           borderSide: BorderSide( width: 1),
	              ),
	               focusedBorder: OutlineInputBorder(
	             	borderRadius: BorderRadius.all(Radius.circular(30.0)),
	             	borderSide: BorderSide(color: Colors.green[700]),
	              ),   
             border: OutlineInputBorder(
             borderSide: BorderSide(
             color: Colors.red, 
                width: 5.0),
                 ),
              hintText: 'Enter your Email'
               ),
                onChanged: (val) {
                  setState(() => email = val);
                },
                validator: (val) => val.isEmpty ? 'Enter an email' : null,
                ),
              SizedBox(height: 20.0),
             TextFormField(
                obscureText: true,
               decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
	             borderRadius: BorderRadius.all(Radius.circular(30.0)),
		           borderSide: BorderSide( width: 1),
	              ),
	               focusedBorder: OutlineInputBorder(
	             	borderRadius: BorderRadius.all(Radius.circular(30.0)),
	             	borderSide: BorderSide(color: Colors.green[700]),
	              ),   
             border: OutlineInputBorder(
             borderSide: BorderSide(
             color: Colors.red, 
                width: 5.0),
                 ),
              hintText: 'Enter your Password'
               ),
               autofocus: true,
                validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.orange[700],
                child: Text(
                  'Register',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  if(_formKey.currentState.validate()){
                    setState(() {
                        loading = true;
                      });
                    dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                    if(result == null) {
                      setState(() {
                        loading = false;
                        error = 'Please supply a valid email';
                      });
                    }
                  }
                }
              ),
              SizedBox(height: 12.0),
               InkWell(
              child: new Text("Already have an account ? login here",
               style: TextStyle(color: Colors.green[700], fontSize: 18.0),),
              onTap: () {
                Navigator.push(
                context,
               MaterialPageRoute(builder: (context) => SignIn()),
                );
              }
          ),
           SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 18.0),
              )
            ],
          ),
        ),
      ),
        ],
      ),
    ),
      )
    );
  }
}