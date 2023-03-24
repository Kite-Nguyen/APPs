import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/thongtin.dart';

class NewTT extends StatefulWidget {
  final Function addthongtin;

  NewTT(this.addthongtin);

  State<NewTT> createState() => NewTT2();
}

class NewTT2 extends State<NewTT> {
  final maid = TextEditingController();
  final maTieude = TextEditingController();
  final maNgayhh = TextEditingController();
  void submit() {
    final Tieude = maTieude.text;
    final Ngay = maNgayhh.text;

    if (Tieude.isEmpty || Ngay.isEmpty) return;
    widget.addthongtin(maTieude.text, DateTime.parse(maNgayhh.text));
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Container(
        padding: EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'ID của công việc'),
              controller: maid,
              onSubmitted: (_) => submit(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Tiêu đề'),
              controller: maTieude,
              onSubmitted: (_) => submit(),
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: 'ngày hết hạn', icon: Icon(Icons.calendar_month)),
              readOnly: true,
              onTap: () async {
                DateTime? date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1999),
                    lastDate: DateTime(2070));
                TimeOfDay? time = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (date == null || time == null) return;
                final datetime = DateTime(
                    date.year, date.month, date.day, time.hour, time.minute);
                setState(() {
                  maNgayhh.text = datetime.toString();
                });
              },
              controller: maNgayhh,
              onSubmitted: (_) => submit(),
            ),
            TextButton(
              child: Text('lưu thông tin'),
              onPressed: () {
                widget.addthongtin(
                  maid.text,
                  maTieude.text,
                  DateTime.parse(maNgayhh.text),
                );
                maid.clear();
                maNgayhh.clear();
                maTieude.clear();
              },
            )
          ],
        ),
      ),
    );
  }
}
