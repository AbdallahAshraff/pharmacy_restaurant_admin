import 'package:flutter/material.dart';
import 'package:pharmacy_restaurant_admin/core/comman/widgets/formfield.dart';
import 'package:pharmacy_restaurant_admin/core/functions/navigate.dart';
import 'package:pharmacy_restaurant_admin/features/auth/presentation/screens/dashboard_screen.dart';
import 'package:pharmacy_restaurant_admin/features/auth/presentation/widgets/home/dashboard_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool keepsignedIn = false;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image(
                    image: const AssetImage('assets/images/loginphoto.png'),
                    height: 350,
                    alignment: Alignment.centerRight,
                  ),
                ),
                Text(
                  
           
                  'Login',
                  textAlign: TextAlign.left,
                  style: Theme.of(
                    context,
                  ).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.bold, ),
                ),
                SizedBox(height: 20),
                Myformfield(
                  keyboardType: TextInputType.emailAddress,
                  labelText: 'Email',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Myformfield(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  labelText: 'Password',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Checkbox(
                      value: true,
                      onChanged: (value) {
                        keepsignedIn = value ?? false;
                      },
                      fillColor: WidgetStateProperty.all(Colors.black),
                    ),
                    Text('Keep me signed in'),
                  ],
                ),
                SizedBox(height: 20),
          
                FilledButton(
                  onPressed: () {
                    NavigateFN(context, () =>   DashboardScreen());
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.black),
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    minimumSize: WidgetStateProperty.all<Size>(
                      Size(double.infinity, 50),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('LOGIN', style: TextStyle(color: Colors.white)),
                      Icon(Icons.arrow_forward, color: Colors.white),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
