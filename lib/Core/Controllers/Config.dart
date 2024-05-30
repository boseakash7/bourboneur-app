class Config {
  String? stripePk;
  String? saveCardUrl;
  String? subscribeNowUrl;
  String? portalUrl;

  Config({
    this.stripePk,
    this.saveCardUrl,
    this.subscribeNowUrl,
    this.portalUrl
  });

  Config.fromJson(json) {
    stripePk = json['stripe_pk'];
    saveCardUrl = json['save_card_url'];
    subscribeNowUrl = json['subscribe_now_url'];
    portalUrl = json['portal_url'];
  }

  Map<String, dynamic> toJson() {
    return {
      "stripe_pk": stripePk,
      'save_card_url': saveCardUrl,
      "subscribe_now_url": subscribeNowUrl,
      'portal_url': portalUrl
    };
  }
}
