class Memory {
  const Memory({
    required this.id,
    required this.petId,
    required this.date,
    this.title,
    this.description,
    this.imageFileId,
    this.filePath,
  });

  final String id;
  final String petId;
  final String? title;
  final String? description;
  final String? imageFileId;
  final String? filePath;
  final DateTime date;
}
