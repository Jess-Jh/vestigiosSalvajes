import 'package:equatable/equatable.dart';

class PuzzleImage extends Equatable {
  final String name;
  final String info;
  final String scientificName;
  final String assetPath;
  final String soundPath;

  const PuzzleImage({
    required this.name,
    required this.info,
    required this.scientificName,
    required this.assetPath,
    required this.soundPath,
  });

  @override
  List<Object?> get props => [
        name,
        info,
        scientificName,
        assetPath,
        soundPath,
      ];
}
