// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;
import 'package:invoice_app/main.dart' as _i1;
import 'package:invoice_app/src/features/add_invoice/presentation/add_invoice_page.dart'
    as _i3;
import 'package:invoice_app/src/features/settings/presentation/bank/bank_info_page.dart'
    as _i5;
import 'package:invoice_app/src/features/settings/presentation/basic/basic_info_page.dart'
    as _i4;
import 'package:invoice_app/src/features/settings/presentation/service/service_info_page.dart'
    as _i6;
import 'package:invoice_app/src/features/settings/presentation/settings_page.dart'
    as _i2;

abstract class $AppRouter extends _i7.RootStackRouter {
  $AppRouter([_i8.GlobalKey<_i8.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    MainRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.MainPage(),
      );
    },
    SettingsRoute.name: (routeData) {
      final args = routeData.argsAs<SettingsRouteArgs>(
          orElse: () => const SettingsRouteArgs());
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.SettingsPage(key: args.key),
      );
    },
    AddInvoiceRoute.name: (routeData) {
      final args = routeData.argsAs<AddInvoiceRouteArgs>(
          orElse: () => const AddInvoiceRouteArgs());
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.AddInvoicePage(key: args.key),
      );
    },
    BasicInfoRoute.name: (routeData) {
      final args = routeData.argsAs<BasicInfoRouteArgs>(
          orElse: () => const BasicInfoRouteArgs());
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.BasicInfoPage(key: args.key),
      );
    },
    BankInfoRoute.name: (routeData) {
      final args = routeData.argsAs<BankInfoRouteArgs>(
          orElse: () => const BankInfoRouteArgs());
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.BankInfoPage(key: args.key),
      );
    },
    ServiceInfoRoute.name: (routeData) {
      final args = routeData.argsAs<ServiceInfoRouteArgs>(
          orElse: () => const ServiceInfoRouteArgs());
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.ServiceInfoPage(key: args.key),
      );
    },
  };
}

/// generated route for
/// [_i1.MainPage]
class MainRoute extends _i7.PageRouteInfo<void> {
  const MainRoute({List<_i7.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i2.SettingsPage]
class SettingsRoute extends _i7.PageRouteInfo<SettingsRouteArgs> {
  SettingsRoute({
    _i8.Key? key,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          SettingsRoute.name,
          args: SettingsRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const _i7.PageInfo<SettingsRouteArgs> page =
      _i7.PageInfo<SettingsRouteArgs>(name);
}

class SettingsRouteArgs {
  const SettingsRouteArgs({this.key});

  final _i8.Key? key;

  @override
  String toString() {
    return 'SettingsRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.AddInvoicePage]
class AddInvoiceRoute extends _i7.PageRouteInfo<AddInvoiceRouteArgs> {
  AddInvoiceRoute({
    _i8.Key? key,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          AddInvoiceRoute.name,
          args: AddInvoiceRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'AddInvoiceRoute';

  static const _i7.PageInfo<AddInvoiceRouteArgs> page =
      _i7.PageInfo<AddInvoiceRouteArgs>(name);
}

class AddInvoiceRouteArgs {
  const AddInvoiceRouteArgs({this.key});

  final _i8.Key? key;

  @override
  String toString() {
    return 'AddInvoiceRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.BasicInfoPage]
class BasicInfoRoute extends _i7.PageRouteInfo<BasicInfoRouteArgs> {
  BasicInfoRoute({
    _i8.Key? key,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          BasicInfoRoute.name,
          args: BasicInfoRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'BasicInfoRoute';

  static const _i7.PageInfo<BasicInfoRouteArgs> page =
      _i7.PageInfo<BasicInfoRouteArgs>(name);
}

class BasicInfoRouteArgs {
  const BasicInfoRouteArgs({this.key});

  final _i8.Key? key;

  @override
  String toString() {
    return 'BasicInfoRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.BankInfoPage]
class BankInfoRoute extends _i7.PageRouteInfo<BankInfoRouteArgs> {
  BankInfoRoute({
    _i8.Key? key,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          BankInfoRoute.name,
          args: BankInfoRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'BankInfoRoute';

  static const _i7.PageInfo<BankInfoRouteArgs> page =
      _i7.PageInfo<BankInfoRouteArgs>(name);
}

class BankInfoRouteArgs {
  const BankInfoRouteArgs({this.key});

  final _i8.Key? key;

  @override
  String toString() {
    return 'BankInfoRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i6.ServiceInfoPage]
class ServiceInfoRoute extends _i7.PageRouteInfo<ServiceInfoRouteArgs> {
  ServiceInfoRoute({
    _i8.Key? key,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          ServiceInfoRoute.name,
          args: ServiceInfoRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ServiceInfoRoute';

  static const _i7.PageInfo<ServiceInfoRouteArgs> page =
      _i7.PageInfo<ServiceInfoRouteArgs>(name);
}

class ServiceInfoRouteArgs {
  const ServiceInfoRouteArgs({this.key});

  final _i8.Key? key;

  @override
  String toString() {
    return 'ServiceInfoRouteArgs{key: $key}';
  }
}
