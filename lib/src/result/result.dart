import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:result_kit/src/result/failure.dart';

part 'result.freezed.dart';

@freezed
sealed class Result<T> with _$Result<T> {
  const factory Result.ok(T value) = Ok<T>;
  const factory Result.err(Failure failure) = Err<T>;
}
