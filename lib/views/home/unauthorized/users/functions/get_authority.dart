import '../../../../../core/dummy/dummy_user_data.dart';
import '../../../../../core/init/helper/get_text.dart';

String getAuthority(context, userIndex) {
  if (users[userIndex].authorityLevel == 1) {
    return getText(context, 'unauthorized');
  } else if (users[userIndex].authorityLevel == 2) {
    return getText(context, 'authorized');
  }
  return '';
}
