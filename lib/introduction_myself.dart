import 'package:flutter/material.dart';

class IntroductionMyself extends StatelessWidget {
  const IntroductionMyself({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 1000,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 15,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("關於我",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromRGBO(103, 80, 164, 1),),),
            const Divider(),
            const Text("1",style: TextStyle(fontSize: 18, height: 1.5),),
            const SizedBox(height: 15,),
            const Text("關於我",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromRGBO(103, 80, 164, 1),),),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
