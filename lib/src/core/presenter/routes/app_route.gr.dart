// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;
import 'package:invoice_app/main.dart' as _i1;
import 'package:invoice_app/src/features/add_invoice/presentation/add_invoice_page.dart'
    as _i3;
import 'package:invoice_app/src/features/settings/presentation/bank/bank_info_page.dart'
    as _i4;
import 'package:invoice_app/src/features/settings/presentation/basic/basic_info_page.dart'
    as _i5;
import 'package:invoice_app/src/features/settings/presentation/client/client_info_page.dart'
    as _i6;
import 'package:invoice_app/src/features/settings/presentation/service/service_info_page.dart'
    as _i7;
import 'package:invoice_app/src/features/settings/presentation/settings_page.dart'
    as _i2;

abstract class $AppRouter extends _i8.RootStackRouter {
  $AppRouter([_i9.GlobalKey<_i9.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    MainRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.MainPage(),
      );
    },
    SettingsRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.SettingsPage(),
      );
    },
    AddInvoiceRoute.name: (routeData) {
      final args = routeData.argsAs<AddInvoiceRouteArgs>(
          orElse: () => const AddInvoiceRouteArgs());
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.AddInvoicePage(key: args.key),
      );
    },
    BankInfoRoute.name: (routeData) {
      final args = routeData.argsAs<BankInfoRouteArgs>(
          orElse: () => const BankInfoRouteArgs());
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.BankInfoPage(key: args.key),
      );
    },
    BasicInfoRoute.name: (routeData) {
      final args = routeData.argsAs<BasicInfoRouteArgs>(
          orElse: () => const BasicInfoRouteArgs());
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.BasicInfoPage(key: args.key),
      );
    },
    ClientInfoRoute.name: (routeData) {
      final args = routeData.argsAs<ClientInfoRouteArgs>(
          orElse: () => const ClientInfoRouteArgs());
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.ClientInfoPage(key: args.key),
      );
    },
    ServiceInfoRoute.name: (routeData) {
      final args = routeData.argsAs<ServiceInfoRouteArgs>(
          orElse: () => const ServiceInfoRouteArgs());
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.ServiceInfoPage(key: args.key),
      );
    },
  };
}

/// generated route for
/// [_i1.MainPage]
class MainRoute extends _i8.PageRouteInfo<void> {
  const MainRoute({List<_i8.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i2.SettingsPage]
class SettingsRoute extends _i8.PageRouteInfo<void> {
  const SettingsRoute({List<_i8.PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i3.AddInvoicePage]
class AddInvoiceRoute extends _i8.PageRouteInfo<AddInvoiceRouteArgs> {
  AddInvoiceRoute({
    _i9.Key? key,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          AddInvoiceRoute.name,
          args: AddInvoiceRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'AddInvoiceRoute';

  static const _i8.PageInfo<AddInvoiceRouteArgs> page =
      _i8.PageInfo<AddInvoiceRouteArgs>(name);
}

class AddInvoiceRouteArgs {
  const AddInvoiceRouteArgs({this.key});

  final _i9.Key? key;

  @override
  String toString() {
    return 'AddInvoiceRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.BankInfoPage]
class BankInfoRoute extends _i8.PageRouteInfo<BankInfoRouteArgs> {
  BankInfoRoute({
    _i9.Key? key,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          BankInfoRoute.name,
          args: BankInfoRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'BankInfoRoute';

  static const _i8.PageInfo<BankInfoRouteArgs> page =
      _i8.PageInfo<BankInfoRouteArgs>(name);
}

class BankInfoRouteArgs {
  const BankInfoRouteArgs({this.key});

  final _i9.Key? key;

  @override
  String toString() {
    return 'BankInfoRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.BasicInfoPage]
class BasicInfoRoute extends _i8.PageRouteInfo<BasicInfoRouteArgs> {
  BasicInfoRoute({
    _i9.Key? key,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          BasicInfoRoute.name,
          args: BasicInfoRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'BasicInfoRoute';

  static const _i8.PageInfo<BasicInfoRouteArgs> page =
      _i8.PageInfo<BasicInfoRouteArgs>(name);
}

class BasicInfoRouteArgs {
  const BasicInfoRouteArgs({this.key});

  final _i9.Key? key;

  @override
  String toString() {
    return 'BasicInfoRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i6.ClientInfoPage]
class ClientInfoRoute extends _i8.PageRouteInfo<ClientInfoRouteArgs> {
  ClientInfoRoute({
    _i9.Key? key,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          ClientInfoRoute.name,
          args: ClientInfoRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ClientInfoRoute';

  static const _i8.PageInfo<ClientInfoRouteArgs> page =
      _i8.PageInfo<ClientInfoRouteArgs>(name);
}

class ClientInfoRouteArgs {
  const ClientInfoRouteArgs({this.key});

  final _i9.Key? key;

  @override
  String toString() {
    return 'ClientInfoRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i7.ServiceInfoPage]
class ServiceInfoRoute extends _i8.PageRouteInfo<ServiceInfoRouteArgs> {
  ServiceInfoRoute({
    _i9.Key? key,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          ServiceInfoRoute.name,
          args: ServiceInfoRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ServiceInfoRoute';

  static const _i8.PageInfo<ServiceInfoRouteArgs> page =
      _i8.PageInfo<ServiceInfoRouteArgs>(name);
}

class ServiceInfoRouteArgs {
  const ServiceInfoRouteArgs({this.key});

  final _i9.Key? key;

  @override
  String toString() {
    return 'ServiceInfoRouteArgs{key: $key}';
  }
}
