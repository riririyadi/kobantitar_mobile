import 'package:get/get_instance/src/lifecycle.dart';
import 'package:intl/intl.dart';

class KobantitarHelper {
  static final currencyFormatter = NumberFormat('#,##0', 'ID');

  static String toRupiah(int? number){
    return currencyFormatter.format(number);
  }
}