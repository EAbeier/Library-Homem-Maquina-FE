import 'package:flutter/material.dart';

class TableWidget extends StatelessWidget {
  const TableWidget({required this.tableHeaders, required this.tableDatas, super.key});
  final List<String> tableHeaders;
  final List<List<Widget>> tableDatas;

  @override
  Widget build(BuildContext context) {
    bool validateLength(){
      for (var td in tableDatas) {
        if(tableHeaders.length != td.length){
          return false;
        }
      }
      return true;
    }
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: !validateLength() ? const Text('Number of header Different from number boadies') : Table(
          border: TableBorder.all(color: Colors.white30),
          children: [
            TableRow(
              decoration: const BoxDecoration(
                color: Color(0xffd094ea)
              ),
                children: [
                  ...List.generate( tableHeaders.length,
                  (index) => TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(tableHeaders[index]),
                    ),
                  ),
                  ),
                ],
              ),
              ...List.generate(tableDatas.length, (index) =>  TableRow(
              decoration: const BoxDecoration(
                color:  Color(0xffC6BEEE)
              ),
                children: [
                  ...List.generate( tableDatas[index].length,
                  (i) => TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: tableDatas[index][i],
                    ),
                  ),
                  ),
                ],
              ),),
          ],
        ),
      ),
    );
  }
}
