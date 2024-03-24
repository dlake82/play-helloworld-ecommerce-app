// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authors_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AuthorAdapter extends TypeAdapter<Author> {
  @override
  final int typeId = 2;

  @override
  Author read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Author(
      name: fields[1] as String,
      userId: fields[0] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Author obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.userId)
      ..writeByte(1)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthorAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AuthorsResponseAdapter extends TypeAdapter<AuthorsResponse> {
  @override
  final int typeId = 4;

  @override
  AuthorsResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AuthorsResponse(
      users: (fields[0] as List).cast<Author>(),
    );
  }

  @override
  void write(BinaryWriter writer, AuthorsResponse obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.users);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthorsResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
