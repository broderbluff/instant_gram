import 'package:instant_gram/views/components/animations/lottie_animation_view.dart';
import 'package:instant_gram/views/components/animations/models/lottie_animations.dart';

class LoadingAnimationView extends LottieAnimationView {
  const LoadingAnimationView({super.key})
      : super(
          animation: LottieAnimations.loading,
        );
}
