import 'package:equatable/equatable.dart';

class GetCategoryParameters extends Equatable {
  final String id;
  
  const GetCategoryParameters({required this.id});
  
  Map<String, dynamic> toJson() => {};
  @override
  List<Object> get props => [id];
}
