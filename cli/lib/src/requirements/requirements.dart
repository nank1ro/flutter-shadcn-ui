import 'dart:async';

class RequirementResult<T> {
  RequirementResult.success({this.value})
    : success = true,
      errorMessage = null,
      internalError = null;
  RequirementResult.failure({this.errorMessage, this.internalError})
    : success = false,
      value = null;

  final bool success;
  final T? value;
  final String? errorMessage;
  final Object? internalError;
}

abstract class Requirement<T> {
  FutureOr<RequirementResult<T>> check();

  T? value;
}

class Requirements {
  Requirements(this.requirements);

  final List<Requirement<dynamic>> requirements;

  /// Stores the values of the requirements, if any.
  static final values = <Type, Object?>{};

  Future<RequirementResult<dynamic>> checkAll() async {
    for (final requirement in requirements) {
      final result = await requirement.check();
      if (!result.success) return result;
      // Store the value of the requirement if it has one
      if (result.value != null) {
        values[requirement.runtimeType] = result.value;
      }
    }
    return RequirementResult.success();
  }
}
