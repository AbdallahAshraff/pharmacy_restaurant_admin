import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacy_restaurant_admin/features/auth/presentation/screens/login.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://gwzvpnetxlpqpjsemttw.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imd3enZwbmV0eGxwcXBqc2VtdHR3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzE1NDMyNDMsImV4cCI6MjA0NzExOTI0M30.M_gXPVEvhH0z69l1VxMt7VwuybOZqQ2gAAnHC1ZMBn0',
  );
   runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690), // الحجم اللي صممت عليه
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'ScreenUtil Demo',
          theme: ThemeData(primarySwatch: Colors.blue),
          home: const LoginPage(),
        );
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Responsive UI',
          style: TextStyle(fontSize: 20.sp), // حجم الخط يتناسب مع الشاشة
        ),
      ),
      body: Center(
        child: Container(
          width: 200.w,
          // العرض يتناسب مع الشاشة
          height: 100.h,
          // الطول يتناسب مع الشاشة
          color: Colors.amber,
          alignment: Alignment.center,
          child: Text('Hello!', style: TextStyle(fontSize: 24.sp)),
        ),
      ),
    );
  }
}
