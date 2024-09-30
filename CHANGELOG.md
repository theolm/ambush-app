## [0.4.1] - 2024-09-30

### FIX

- This version fixes the issue where the app can no longer read the company address. The app now forces a new onboarding into the app so the user will be forced to provide all the required fields.

## [0.4.0] - 2024-09-2

### Deprecated

- Android and iOS versions are deprecated. The app will be available only for web, PWA and macOS.

### Added

- Adding firebase deploy to beta on every PR
- Adding extra page to include the companies' address
- Some extra improvements in the UI


## [0.3.1] - 2024-08-11

### Added

- Adding firebase deploy script to deploy the app to firebase hosting
- Adding CNPJ and Contractor's name field in the generated invoice.

## [0.3.0] - 2024-07-31

### Fix

- Unit price text field now works properly in the invoice screen

### Update

- Update libraries and some transitive dependencies

## [0.2.0] - 2024-05-28

### Added

- Adding Safe mode (or hide mode). By default the app opens with this activated. The values of the invoice will be hidden until the user toggle off the hidden mode. This is a security feature to prevent the user from showing the invoice to someone else by mistake.

### Changes

- Changes the text and validators in the onboarding and settings page to prevent user adding Ambush's information 
- Adding safe area in the Floating action button of the mains screen

## [0.1.0] - 2024-04-22
The application is stable. Moving it to beta 0.1.0.

### Changes

- Changes Ambush's address and email
- Remove deprecated methods

## [0.0.7] - 2024-01-23

### Small improvements

- Quantity has a improved UI
- Bug fixes

## [0.0.6] - 2023-11-28

### Bug fixes

- Quantity now allows 3 decimals

## [0.0.5] - 2023-10-26

### macOS release

- MacOs version released
- Minor UI fixes


## [0.0.4] - 2023-10-13

### Bug fixes

- UI bug fix

## [0.0.3] - 2023-10-12

### Splash screen, icon and small updates

- Splash screen and icons added to all platforms
- Net 15 added in the invoice generation
- USD used as default (and unique) currency
- Small UI fixes


## [0.0.1] - 2023-09-22

### Initial beta release

- Available for Android, web and pwa
- Supports: create invoice and share invoice as PDF
