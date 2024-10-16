import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {
  static final _t = Translations.byText('en_us') +
      {
        'en_us': 'Get Started',
        'vi_vn': 'Bắt đầu',
      } +
      {
        'en_us':
            'Discover, engage and read the latest articles as well as share your own thoughts and ideas with the community',
        'vi_vn':
            'Khám phá, tham gia và đọc các bài viết mới nhất cũng như chia sẻ suy nghĩ và ý tưởng của riêng bạn với cộng đồng',
      } +
      {
        'en_us':
            'Customize your reading experience and join the conversation by creating an account.',
        'vi_vn':
            'Tùy chỉnh trải nghiệm đọc của bạn và tham gia cuộc trò chuyện bằng cách tạo tài khoản.',
      } +
      {
        'en_us':
            'Explore a wide selection of categories, or use the search bar to find specific topics',
        'vi_vn':
            'Khám phá nhiều lựa chọn danh mục hoặc sử dụng thanh tìm kiếm để tìm các chủ đề cụ thể',
      } +
      {
        'en_us': 'Skip',
        'vi_vn': 'Bỏ qua',
      } +
      {
        'en_us': 'Next',
        'vi_vn': 'Kế tiếp',
      } +
      {
        'en_us': 'Hello %s',
        'vi_vn': 'Xin chào %s',
      } +
      {
        'en_us': 'Language',
        'vi_vn': 'Ngôn ngữ',
      };

  String get i18n => localize(this, _t);
  String fill(List<Object> params) => localizeFill(this, params);
}
