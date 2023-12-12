import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:labkesda_mobile/models/promo_content/promo_models.dart';
import 'package:labkesda_mobile/presentation/controllers/promo/promo_controller.dart';

final promoProvider = FutureProvider<List<PromoModels>>((ref) async {
  return PromoController.getPromoData();
});
