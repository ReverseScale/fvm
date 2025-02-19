import 'release.model.dart';

/// Enum of a channel
enum Channel {
  /// stable channel
  stable,

  /// dev channel
  dev,

  /// beta channel
  beta,
}

/// Extension to make it easy to return channels name
extension ChannelExtension on Channel {
  /// Name of the channel
  String get name {
    switch (this) {
      case Channel.stable:
        return 'stable';
      case Channel.dev:
        return 'dev';
      case Channel.beta:
        return 'beta';
      default:
        return null;
    }
  }
}

/// Returns a [Channel] from [name]
Channel channelFromName(String name) {
  switch (name) {
    case 'stable':
      return Channel.stable;
    case 'dev':
      return Channel.dev;
    case 'beta':
      return Channel.beta;
    default:
      return null;
  }
}

/// Channels Model
class Channels {
  /// Channel model contructor
  Channels({
    this.beta,
    this.dev,
    this.stable,
  });

  /// Beta channel release
  final Release beta;

  /// Dev channel release
  final Release dev;

  /// Stable channel release
  final Release stable;

  /// Create a Channels model from a map
  factory Channels.fromMap(Map<String, dynamic> map) => Channels(
        beta: Release.fromMap(map['beta'] as Map<String, dynamic>),
        dev: Release.fromMap(map['dev'] as Map<String, dynamic>),
        stable: Release.fromMap(
          map['stable'] as Map<String, dynamic>,
        ),
      );

  /// Returns channel by name
  Release operator [](String channelName) {
    if (channelName == 'beta') return beta;
    if (channelName == 'dev') return dev;
    if (channelName == 'stable') return stable;
    return null;
  }

  /// Return a map of values from the Channels model
  Map<String, dynamic> toMap() => {
        'beta': beta,
        'dev': dev,
        'stable': stable,
      };

  /// Returns a hash map of the channels model
  Map<String, dynamic> toHashMap() => {
        '${beta.hash}': 'beta',
        '${dev.hash}': 'dev',
        '${stable.hash}': 'stable',
      };
}

// final channelValues = EnumValues(
//     {'beta': Channel.beta, 'dev': Channel.dev, 'stable': Channel.stable});

// class EnumValues<T> {
//   Map<String, T> map;
//   Map<T, String> reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     reverseMap ??= map.map((k, v) => MapEntry(v, k));

//     return reverseMap;
//   }
// }
