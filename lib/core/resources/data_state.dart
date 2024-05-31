
import 'package:dio/dio.dart';

abstract class DataState<T> {
  final T ? data;
  final DioError ? error;

  const DataState(this.data, this.error);
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data) : super(data, null);
}

class DataFailed<T> extends DataState<T> {
  const DataFailed(DioError error) : super(null, error);
}



