part of 'pages.dart';

abstract class Routes {
  Routes._();

  static const ROOT = _Paths.ROOT;
  static const LOGIN = _Paths.LOGIN;
  static const REGISTER = _Paths.REGISTER;
  static const WAITTING = _Paths.WAITTING;
  static const SEARCH = _Paths.SEARCH;
  static const SAVED = _Paths.SAVED;
  static const COMPANY_PROFILE = _Paths.COMPANY_PROFILE;
  static const JOB_DETAILS = _Paths.JOB_DETAILS;
  static const CUSTOMER_PROFILE = _Paths.CUSTOMER_PROFILE;
}

abstract class _Paths {
  _Paths._();

  static const ROOT = '/';
  static const LOGIN = '/login';
  static const REGISTER = '/register';
  static const WAITTING = '/waiting';
  static const SEARCH = '/search';
  static const SAVED = '/saved';
  static const COMPANY_PROFILE = '/company-profile';
  static const JOB_DETAILS = '/job-details';
  static const CUSTOMER_PROFILE = '/customer-profile';
}
