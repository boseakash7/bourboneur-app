class LastUpdate {
  String? bluebook_readable;
  String? bluebook_raw;

  LastUpdate({
    this.bluebook_readable,
    this.bluebook_raw
  });

  LastUpdate.fromJson(json) {
    bluebook_readable = json['bluebook_readable'];
    bluebook_raw = json['bluebook_raw'];
  }

  Map<String, dynamic> toJson() {
    return {
      "bluebook_readable": bluebook_readable,
      'bluebook_raw': bluebook_raw,
    };
  }
}
