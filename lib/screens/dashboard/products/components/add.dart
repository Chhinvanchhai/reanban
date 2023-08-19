import 'package:flutter/material.dart';
import 'package:reanban/constants.dart';
import 'package:reanban/widgets/input.dart';

class Add extends StatelessWidget {
  const Add({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextButton(
          onPressed: () => showDialog<String>(
            context: context,
            builder: (BuildContext context) => Dialog(
              child: Container(
                width: 300,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: defaultHeight,
                        child: TextField(
                          obscureText: true,
                          decoration: const InputDecoration(
                              label: Text('Name'),
                              prefixIcon: Icon(Icons.security_outlined),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 7, horizontal: 12),
                              border: OutlineInputBorder(),
                              hintText: "Password"),
                        ),
                      ),
                      SizedBox(
                        height: defaultHeight,
                      ),
                      SizedBox(
                        height: defaultHeight,
                        child: TextField(
                          obscureText: true,
                          decoration: const InputDecoration(
                              label: Text('sku'),
                              prefixIcon: Icon(Icons.security_outlined),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 7, horizontal: 12),
                              border: OutlineInputBorder(),
                              hintText: "Password"),
                        ),
                      ),
                      SizedBox(
                        height: defaultHeight,
                      ),
                      SizedBox(
                        height: defaultHeight,
                        child: TextField(
                          obscureText: true,
                          decoration: const InputDecoration(
                              label: Text('Password'),
                              prefixIcon: Icon(Icons.security_outlined),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 7, horizontal: 12),
                              border: OutlineInputBorder(),
                              hintText: "Password"),
                        ),
                      ),
                      const SizedBox(height: 15),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Close'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          child: Row(
            children: [
              Icon(Icons.new_releases),
              SizedBox(
                width: 4,
              ),
              const Text(
                'New',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
