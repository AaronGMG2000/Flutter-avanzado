class BandModel {
  String id;
  String name;
  int votes;
  BandModel({
    this.id = '',
    this.name = '',
    this.votes = 0,
  });

  factory BandModel.fromMap(Map<String, dynamic> obj) => BandModel(
        id: obj['id'],
        name: obj['name'],
        votes: obj['votes'],
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'votes': votes,
      };

  BandModel copyWith({
    String? id,
    String? name,
    int? votes,
  }) =>
      BandModel(
        id: id ?? this.id,
        name: name ?? this.name,
        votes: votes ?? this.votes,
      );
}
