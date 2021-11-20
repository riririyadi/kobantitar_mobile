import 'package:flutter/material.dart';

class RiwayatTagihan extends StatefulWidget {
  const RiwayatTagihan({Key? key}) : super(key: key);

  @override
  _RiwayatTagihanState createState() => _RiwayatTagihanState();
}

class _RiwayatTagihanState extends State<RiwayatTagihan> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text("Riwayat Tagihan",
                style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w600)),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 5.0,
                    spreadRadius: 1.0,
                    offset: Offset(0.0, 5.0), // shadow direction: bottom
                  )
                ],
              ),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 16),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("Cicilan Ke-3",
                          style: TextStyle(fontWeight: FontWeight.w600)),
                      Spacer(),
                      Text("20 Juni 2020",
                          style: TextStyle(
                            fontSize: 12.0,
                          )),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Rp 297.451"),
                      Spacer(),
                      Text("UNPAID",
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w600,
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 5.0,
                    spreadRadius: 1.0,
                    offset: Offset(0.0, 5.0), // shadow direction: bottom
                  )
                ],
              ),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 16),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("Cicilan Ke-2",
                          style: TextStyle(fontWeight: FontWeight.w600)),
                      Spacer(),
                      Text("20 Juni 2020",
                          style: TextStyle(
                            fontSize: 12.0,
                          )),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Rp 297.451"),
                      Spacer(),
                      Text("UNPAID",
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.red,
                            fontWeight: FontWeight.w600,
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 5.0,
                    spreadRadius: 1.0,
                    offset: Offset(0.0, 5.0), // shadow direction: bottom
                  )
                ],
              ),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 16),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("Cicilan Ke-1",
                          style: TextStyle(fontWeight: FontWeight.w600)),
                      Spacer(),
                      Text("20 Juni 2020",
                          style: TextStyle(
                            fontSize: 12.0,
                          )),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Rp 297.451",
                          style: TextStyle(
                            color: Colors.green,
                          )),
                      Spacer(),
                      Text("PAID",
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.green,
                            fontWeight: FontWeight.w600,
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
