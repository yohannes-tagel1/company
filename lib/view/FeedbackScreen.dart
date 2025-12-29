import 'package:flutter/material.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController msgCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color.fromARGB(255, 246, 234, 215),
      appBar: AppBar(
        title: const Text(
          "Feedback",
          style: TextStyle(
            // color: Color.fromARGB(255, 0, 0, 0),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        // backgroundColor: Colors.amberAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nameCtrl,
                decoration: const InputDecoration(
                  labelText: "Full Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(9)),
                  ),
                ),
                validator: (value) =>
                value!.isEmpty ? "Name is required" : null,
              ),
              const SizedBox(height: 16),

              TextFormField(
                controller: msgCtrl,
                maxLines: 4,
                decoration: const InputDecoration(
                  labelText: "Your Feedback",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(9)),
                  ),
                ),
                validator: (value) =>
                value!.isEmpty ? "Feedback is required" : null,
              ),
              const SizedBox(height: 24),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amberAccent,
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Feedback submitted successfully!"),
                      ),
                    );
                    nameCtrl.clear();
                    msgCtrl.clear();
                  }
                },
                child: const Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}