// PublicRoom model for compatibility with matrix package
class PublicRoom {
  final String roomId;
  final String? name;
  final String? topic;
  final Uri? avatarUrl;
  final String? canonicalAlias;
  final int numJoinedMembers;
  final bool worldReadable;
  final bool guestCanJoin;
  final String? joinRule;
  final String? roomType;

  PublicRoom({
    required this.roomId,
    this.name,
    this.topic,
    this.avatarUrl,
    this.canonicalAlias,
    this.numJoinedMembers = 0,
    this.worldReadable = false,
    this.guestCanJoin = false,
    this.joinRule,
    this.roomType,
  });

  // Constructor from Map for compatibility
  factory PublicRoom.fromJson(Map<String, dynamic> json) {
    return PublicRoom(
      roomId: json['room_id'] as String,
      name: json['name'] as String?,
      topic: json['topic'] as String?,
      avatarUrl: json['avatar_url'] != null ? Uri.parse(json['avatar_url'] as String) : null,
      canonicalAlias: json['canonical_alias'] as String?,
      numJoinedMembers: (json['num_joined_members'] as int?) ?? 0,
      worldReadable: (json['world_readable'] as bool?) ?? false,
      guestCanJoin: (json['guest_can_join'] as bool?) ?? false,
      joinRule: json['join_rule'] as String?,
      roomType: json['room_type'] as String?,
    );
  }
}
