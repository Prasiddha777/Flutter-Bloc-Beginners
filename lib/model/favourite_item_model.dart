import 'package:equatable/equatable.dart';

class FavouriteItemModel extends Equatable {
  final String id;
  final String name;
  final bool isDeleting;
  final bool isFavorite;

  const FavouriteItemModel({
    required this.id,
    required this.name,
    this.isDeleting = false,
    this.isFavorite = false,
  });

  FavouriteItemModel copyWith(
      {String? id, String? name, bool? isDeleting, bool? isFavorite}) {
    return FavouriteItemModel(
      id: id ?? this.id,
      name: name ?? this.name,
      isDeleting: isDeleting ?? this.isDeleting,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  @override
  List<Object?> get props => throw [id, name, isDeleting, isFavorite];
}
