import 'package:flutter/material.dart';

class ProfileButtons extends StatelessWidget {
  ProfileButtons({
    super.key,
    required this.text,
    required this.ontap,
    required this.isSelected,
  });

  String text;
  final VoidCallback ontap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: isSelected ? Color(0xff47BA82) : Color(0xffEEEEEE)),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 15.0, right: 15, top: 8, bottom: 8),
          child: Text(
            text,
            style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}

class Heading1 extends StatelessWidget {
  const Heading1({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
    );
  }
}

class Heading2 extends StatelessWidget {
  const Heading2({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Text(name,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500));
  }
}

// A reusable widget for each detail
class DetailRow extends StatelessWidget {
  final String label;
  final bool isReadOnly;
  final TextEditingController controller;
  const DetailRow({
    super.key,
    required this.label,
    required this.controller,
    required this.isReadOnly,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          CostmTextFormField(isReadOnly: isReadOnly, controller: controller)
        ],
      ),
    );
  }
}

class CostmTextFormField extends StatelessWidget {
  const CostmTextFormField(
      {super.key, required this.isReadOnly, required this.controller});

  final bool isReadOnly;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        readOnly: isReadOnly,
        controller: controller,
        style: TextStyle(
            color: Color(0xff828282),
            fontWeight: FontWeight.w500,
            fontSize: 14),
        decoration: InputDecoration(
          border: isReadOnly
              ? InputBorder.none
              : OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
        ),
      ),
    );
  }
}


class SaveAndCancel extends StatelessWidget {
  const SaveAndCancel({super.key, required this.cancelOnTap, required this.saveOnTap});

  final VoidCallback cancelOnTap;
  final VoidCallback saveOnTap;

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
          onTap: cancelOnTap,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 5, bottom: 5),
              child: Text(
                "Cancel",
                style:
                TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
        ),
        InkWell(
          onTap:saveOnTap,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 18.0, right: 18.0, top: 5, bottom: 5),
              child: Text(
                "Save",
                style:
                TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
        )
      ],
    );
  }
}
