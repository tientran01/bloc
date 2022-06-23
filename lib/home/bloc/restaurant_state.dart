import 'package:equatable/equatable.dart';

class RestaurantState extends Equatable {
  final String? isLoading;
  final String? nameAndPassword;
  final String? password;

  const RestaurantState({
    this.isLoading,
    this.nameAndPassword,
    this.password,
  });

  const RestaurantState.initState() : this();

  RestaurantState copyWith({String? isLoading, String? nameAndPassword,String? password}) {
    return RestaurantState(
        isLoading: isLoading, nameAndPassword: nameAndPassword,password: password);
  }

  @override
  List<Object?> get props => [isLoading, nameAndPassword,password];
}
