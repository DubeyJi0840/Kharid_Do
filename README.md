# Kharid Do (Flutter)

A Flutter demo shopping app UI for browsing products, viewing deals, managing a cart, and going through a sample checkout flow.A modern, visually stunning e-commerce application built with Flutter. Kharid Do provides a seamless, dynamic, and state-of-the-art shopping experience with rich aesthetics and smooth user interactions.

> Brand name shown in the app: **Kharid Do**

## Features (UI)

- Splash + Onboarding screens
- Bottom navigation (Home, Deals, Inbox, Cart, Profile)
- Home / Deals browsing
- Categories and category product listing
- Product details
- Cart and checkout (shipping, payment, order summary)
- Orders, order tracking, and order success screens
- Favorites, messages, notifications
- Login / Signup / Forgot & Reset password
- Profile, settings, vouchers & wallet rewards (mock)
- Coupon / promo application (mock)

## Tech Stack

- **Flutter** (Dart)
- **Material 3** styling
- `google_fonts` (Outfit font)

## Project Structure (high level)

- `lib/main.dart` – App entry point and theme setup
- `lib/theme/app_theme.dart` – `AppTheme` definitions
- `lib/utils/mock_data.dart` – Mock data used across the UI
- `lib/screens/*` – App screens/widgets

  ## Overview
Kharid Do is a beautifully crafted e-commerce application designed to provide a rich and engaging shopping experience. Built from the ground up with Flutter, it emphasizes premium UI components like glassmorphism, dynamic animations, and tailored color schemes to ensure an unparalleled user journey.

## Key Features

### 1. Advanced Search & Category Navigation
*   **Intuitive Search UI**: Features a detailed search screen with recent searches, trending keywords with visual badges, and easily accessible popular categories.
*   **Dynamic Category Pages**: Clicking a category dynamically loads specialized item lists according to the selection (e.g., specific lists for Fashion vs. Electronics).
*   **Feature-Rich Lists**: A beautifully designed grid showcasing products alongside specific badges ("25% OFF", "NEW", "HOT"), deal pricing vs original, ratings, and custom-styled favorite icons.

### 2. Immersive Product Experience
*   **Detailed Product Pages**: Displays comprehensive product information, beautiful rating pills, dynamic color swatches, size selectors, collapsable descriptions, and user reviews.
*   **Image Full-View System**: Clicking any product image triggers a modern fullscreen carousel. Users can seamlessly navigate via swipe, circle arrow icons, or directly tap on the bottom thumbnail gallery.
*   **Always-Accessible CTAs**: Includes a sticky bottom-sheet Call-To-Action array featuring an "Add to Cart" and a bright "Buy Now" button mimicking top-tier retail applications.

### 3. Secure Account Management
*   **Functional Sign Up**: Implemented a complete signup flow with integrated `TextEditingController`s for real-time data binding.
*   **Robust Validation**: Integrated a `Form` validation system with a `GlobalKey<FormState>`, ensuring users provide valid emails, names, and secure passwords before account creation.
*   **Agreement Enforcement**: Added a terms and conditions enforcement logic that prevents account creation without explicit agreement, mirroring professional security standards.

### 4. Smart Cart & Checkout Management
*   **Empty Cart State**: Introduced a sleek empty cart illustration and call-to-action, ensuring the UI remains helpful even when items aren't present.
*   **Dynamic Checkout Flow**: Includes a multi-step checkout process from shipping address selection to secure payment method handling.
*   **Order Review & Tracking**: Provides a detailed `Order Summary` before completion and a modern `Order Tracking` interface with a progress stepper to keep users updated.

---

## Assets


All images are expected under:

- `assets/images/`

(Declared in `pubspec.yaml`)

## Getting Started

### Prerequisites

- Flutter SDK installed
- An emulator/device (Android/iOS) or web target

### Run the app

```bash
flutter pub get
flutter run
```

## Tests / Analysis

```bash
flutter analyze
flutter test
```

## Notes

This project is primarily UI-focused and uses **mock data** (`lib/utils/mock_data.dart`). There are no backend integrations included in this repository.

