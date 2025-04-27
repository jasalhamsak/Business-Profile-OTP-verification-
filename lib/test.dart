import 'package:flutter/material.dart';

class EditableTextWidget extends StatefulWidget {
  @override
  _EditableTextWidgetState createState() => _EditableTextWidgetState();
}

class _EditableTextWidgetState extends State<EditableTextWidget> {
  bool isEditing = false;
  String text = "This is editable text";
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: text);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void startEditing() {
    setState(() {
      isEditing = true;
      controller.text = text;
    });
  }

  void saveEditing() {
    setState(() {
      text = controller.text;
      isEditing = false;
    });
  }

  void cancelEditing() {
    setState(() {
      isEditing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isEditing
            ? TextField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: "Enter new text",
          ),
        )
            : Row(
          children: [
            Expanded(
              child: Text(
                text,
                style: TextStyle(fontSize: 18),
              ),
            ),
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: startEditing,
            ),
          ],
        ),
        if (isEditing)
          Row(
            children: [
              ElevatedButton(
                onPressed: saveEditing,
                child: Text("Save"),
              ),
              SizedBox(width: 8),
              OutlinedButton(
                onPressed: cancelEditing,
                child: Text("Cancel"),
              ),
            ],
          ),
      ],
    );
  }
}
