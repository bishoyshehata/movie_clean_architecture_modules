// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cached_movie_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CachedMovieModelAdapter extends TypeAdapter<CachedMovieModel> {
  @override
  final int typeId = 1;

  @override
  CachedMovieModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CachedMovieModel(
      id: fields[0] as String,
      posterPath: fields[1] as String,
      voteAverage: fields[2] as String,
      originalTitle: fields[3] as String,
      title: fields[6] as String,
      overview: fields[4] as String,
      releaseDate: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CachedMovieModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.posterPath)
      ..writeByte(2)
      ..write(obj.voteAverage)
      ..writeByte(3)
      ..write(obj.originalTitle)
      ..writeByte(4)
      ..write(obj.overview)
      ..writeByte(5)
      ..write(obj.releaseDate)
      ..writeByte(6)
      ..write(obj.title);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CachedMovieModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
