import 'package:flutter/material.dart';
import 'package:planbook/widget/new_thongtin.dart';

import '../model/thongtin.dart';
import '../widget/listthongtin.dart';
import '../widget/new_thongtin.dart';

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => HomepageT();
}

class HomepageT extends State<Homepage> {
  static const name = '/home';
  final List<Thongtin> danhsach = [
    Thongtin(
        id: '01',
        tieude: 'Làm bài tập chương trình dịch',
        ngayhh: DateTime(2023, 3, 23)),
    Thongtin(
        id: '02',
        tieude: 'Làm bài tập lập trình thiệt bị di động',
        ngayhh: DateTime(2023, 3, 23))
  ];
  void addThongtin(String id, String tieude, DateTime ngay) {
    final newThongtin = Thongtin(id: id, tieude: tieude, ngayhh: ngay);
    setState(() {
      danhsach.add(newThongtin);
    });
  }

  void AddnewThongtin(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: NewTT(addThongtin),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.purple, Colors.orange])),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Kế hoạch'),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          backgroundColor: Colors.red,
          onPressed: () => AddnewThongtin(context),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          child: Container(height: 40.0),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Thongtinlist(danhsach),
            ],
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
