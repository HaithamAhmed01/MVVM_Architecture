import 'package:equatable/equatable.dart';
import 'package:test/core/utils/app_assets.dart';

class OnBoardingModel extends Equatable {
  final List<OnBoardingDetails> onBoardingDetails;

  const OnBoardingModel({
    required this.onBoardingDetails,
  });

  @override
  List<Object?> get props => [
        onBoardingDetails,
      ];
}

class OnBoardingDetails extends Equatable {
  final String text;
  final String title;
  final String image;

  const OnBoardingDetails({
    required this.text,
    required this.title,
    required this.image,
  });

  @override
  List<Object?> get props => [
        text,
        title,
        image,
      ];
}

List<OnBoardingDetails> onBoarding = [
  const OnBoardingDetails(
    title: 'ملابسك جاهزة ؟',
    text: 'لندري لوكر يتيح لك خدمة إستلام وتوصيل الطلبات من والى خرانتك',
    image: Assets.imagesOnboarding1,
  ),
  const OnBoardingDetails(
    title: 'ثقتكم غالية علينا',
    text:
        'اخترنا احدث التقنيات في الغسيل والكي التي تضمن لعملائنا الجودة والنظافة والسلامة',
    image: Assets.imagesOnboarding2,
  ),
  const OnBoardingDetails(
    title: 'نرتبها بحب',
    text: 'التغليف الآمن من لندري لوكر للحفاظ على الملابس لفترة أطول',
    image: Assets.imagesOnboarding3,
  ),
  const OnBoardingDetails(
    title: 'أغراضك في أمان',
    text: 'مايحتاج وجودك عند الاستلام خزانتك تقوم بالواجب',
    image: Assets.imagesOnboarding4,
  ),
];
