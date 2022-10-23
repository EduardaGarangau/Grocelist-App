// ignore_for_file: public_member_api_docs, sort_constructors_first
class ShopListException implements Exception {
  final String msg;
  final StackTrace? stackTrace;

  ShopListException({
    required this.msg,
    this.stackTrace,
  });

  @override
  String toString() {
    return msg;
  }
}
