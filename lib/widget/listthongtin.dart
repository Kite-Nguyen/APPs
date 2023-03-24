import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/thongtin.dart';

class Thongtinlist extends StatefulWidget {
  final List<Thongtin> danhsach;

  Thongtinlist(this.danhsach);

  @override
  State<Thongtinlist> createState() => _ThongtinlistState();
}

class _ThongtinlistState extends State<Thongtinlist> {
  Color checkngay(Thongtin chon) {
    if (DateTime.now().isAfter(chon.ngayhh))
      return Colors.red;
    else
      return Colors.blueGrey;
  }

  void delete(String id) {
    setState(() {
      widget.danhsach.removeWhere((Thongtin) => Thongtin.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      child: SingleChildScrollView(
          child: Column(
        children: widget.danhsach.map((tt) {
          return Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            color: checkngay(tt),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 15,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 2,
                      ),
                    ),
                    padding: EdgeInsets.all(12),
                    child: Text(
                      tt.id,
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                          color: Colors.black),
                    ),
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        tt.tieude,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        tt.ngayhh.toString(),
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                      )
                    ],
                  )),
                  Container(
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          delete(tt.id);
                        });
                      },
                      icon: const Icon(Icons.delete),
                    ),
                  ),
                ]),
          );
        }).toList(),
      )),
    );
  }
}
