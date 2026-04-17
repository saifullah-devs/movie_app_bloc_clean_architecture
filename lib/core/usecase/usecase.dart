import 'package:equatable/equatable.dart';

/// [Type] is what the UseCase returns (e.g., UserEntity)
/// [Params] is the input data (e.g., LoginParams)
abstract class UseCase<Type, Params> {
  Future<Type> call(Params params);
}

/// Use this if a UseCase doesn't require any input parameters
class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
