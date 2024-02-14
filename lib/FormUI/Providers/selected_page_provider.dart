import 'package:bws_agreement_creator/FormUI/Providers/login_data_provider.dart';
import 'package:bws_agreement_creator/Model/selected_page_data.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final selectedPageProvider =
    StateNotifierProvider<SelectedPageNotifier, SelectedPage>((ref) {
  return SelectedPageNotifier(ref);
});

class SelectedPageNotifier extends StateNotifier<SelectedPage> {
  StateNotifierProviderRef<SelectedPageNotifier, SelectedPage> ref;
  SelectedPageNotifier(this.ref)
      : super(ref.read(loginProvider.notifier).state.data!.pageBasedOnData());

  void setPage(SelectedPage page) {
    state = page;
  }
}
