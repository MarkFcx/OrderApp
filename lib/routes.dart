import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'models/order_data_model.dart';
import 'pages/login/login.dart';
import 'pages/order/hall_page.dart';
import 'pages/order/order_page.dart';

class Routes {
  // 登录页面
  static const String login = '/'; // Note:App运行第一个页面是登录页面
  static const String orderPage = '/orderPage';
  static const String hallPage = '/hallPage';
  static FluroRouter? router;

  static void initRouter() {
    if (router == null) {
      router = FluroRouter();
      Routes.configureRoutes(router!);
    }
  }

  static final Handler _loginHandler = Handler(handlerFunc:
      (BuildContext? context, Map<String, List<String>> parameters) {
    return const LoginPage();
  });

  static final Handler _orderPageHandler = Handler(handlerFunc:
      (BuildContext? context, Map<String, List<String>> parameters) {
    return const OrderPage();
  });

  static final Handler _hallPageHandler = Handler(handlerFunc:
      (BuildContext? context, Map<String, List<String>> parameters) {
    return const HallPage();
  });

  static void configureRoutes(FluroRouter router) {
    router.define(login,
        handler: _loginHandler, transitionType: TransitionType.cupertino);
    router.define(orderPage,
        handler: _orderPageHandler, transitionType: TransitionType.cupertino);
    router.define(hallPage,
        handler: _hallPageHandler, transitionType: TransitionType.cupertino);
  }
}
