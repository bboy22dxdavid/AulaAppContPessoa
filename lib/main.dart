import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  HomePage(),
    );
  }
}



class HomePage extends StatefulWidget {
   HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;

  //funcao de decremental
  void decrement() {
    setState(() {
      // debugando a funcao
      print("decrement ${count}");
      count--;
    });

  }

  //funcao de incremental
  void increment() {
    setState(() {
      // debugando a funcao
      print("incremental = ${count}");
      count++;
    });

  }

  bool get isEmpty => count == 0;
  bool get isFull => count == 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/sorvete.jpg"),
            fit: BoxFit.cover
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text(
              isFull ? "Lotado" :  "Pode entrar!",
              style: const  TextStyle(
                fontSize: 30,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
             Padding(
              padding: const EdgeInsets.all(32),
              child: Text(
                count.toString(),
                style:  TextStyle(
                  color: isFull ? Colors.red.withOpacity(0.5) : Colors.white,
                  fontSize: 100,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: isEmpty ? null : decrement,
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: isEmpty ? Colors.white.withOpacity(0.2) : Colors.white,
                    fixedSize: const Size(100, 100),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: const Text(
                    "Saiu",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 32,
                ),
                TextButton(
                  onPressed: isFull ? null :increment,
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: isFull ? Colors.white.withOpacity(0.2) : Colors.white,
                    fixedSize: const Size(100, 100),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: const Text(
                    "Entrou",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
