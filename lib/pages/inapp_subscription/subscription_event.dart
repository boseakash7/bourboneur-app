import 'package:equatable/equatable.dart';
import 'package:flutter_inapp_purchase/flutter_inapp_purchase.dart';
import 'package:offline_subscription/presentation/subscription/model/purchase_receipt_android.dart';
import 'package:offline_subscription/presentation/subscription/model/purchase_receipt_ios.dart';

abstract class SubscriptionEvent extends Equatable {
  const SubscriptionEvent();

  @override
  List<Object> get props => [];
}

class VerifyReceiptAndroidEvent extends SubscriptionEvent {
  final PurchaseReceiptAndroid purchaseReceiptAndroid;
  final PurchasedItem purchasedItem;

  const VerifyReceiptAndroidEvent({
    required this.purchaseReceiptAndroid,
    required this.purchasedItem,
  });

  @override
  List<Object> get props => [purchaseReceiptAndroid, purchasedItem];

  @override
  String toString() => 'VerifyReceiptAndroid Event';
}

class VerifyReceiptIOSEvent extends SubscriptionEvent {
  final PurchaseReceiptIOS purchaseReceiptIOS;

  const VerifyReceiptIOSEvent({
    required this.purchaseReceiptIOS,
  });

  @override
  List<Object> get props => [purchaseReceiptIOS];

  @override
  String toString() => 'VerifyReceiptIOS Event';
}

class CompleteTransactionEvent extends SubscriptionEvent {
  final PurchasedItem? purchasedItem;
  final String? transactionId;
  final bool? isConsumable;

  const CompleteTransactionEvent(
      {this.purchasedItem, this.transactionId, this.isConsumable});

  @override
  String toString() => 'CompleteTransactionEvent Event';
}

class FinalizeSubscriptionEvent extends SubscriptionEvent {
  @override
  String toString() => 'FinalizeSubscriptionEvent Event';
}

class GetSubscriptionStatusEvent extends SubscriptionEvent {
  final String productId;

  const GetSubscriptionStatusEvent({
    required this.productId,
  });

  @override
  List<Object> get props => [productId];

  @override
  String toString() => 'GetSubscriptionStatusEvent Event';
}

class CheckSubscriptionReadyStatusEvent extends SubscriptionEvent {
  @override
  String toString() => 'CheckSubscriptionReadyStatusEvent Event';
}