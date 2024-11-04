class Version implements Comparable<Version> {
  final int major;
  final int minor;
  final int patch;

  Version(this.major, this.minor, this.patch);

  factory Version.parse(String version) {
    final parts = version.split('.').map(int.parse).toList();
    return Version(parts[0], parts[1], parts[2]);
  }

  @override
  int compareTo(Version other) {
    if (major != other.major) return major - other.major;
    if (minor != other.minor) return minor - other.minor;
    return patch - other.patch;
  }

  @override
  bool operator <(Version other) => compareTo(other) < 0;

  @override
  bool operator >(Version other) => compareTo(other) > 0;

  @override
  bool operator <=(Version other) => compareTo(other) <= 0;

  @override
  bool operator >=(Version other) => compareTo(other) >= 0;

  @override
  bool operator ==(Object other) =>
      other is Version &&
      major == other.major &&
      minor == other.minor &&
      patch == other.patch;

  @override
  int get hashCode => major.hashCode ^ minor.hashCode ^ patch.hashCode;
}
