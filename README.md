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

## SCREENSHOT




<img width="1080" height="2424" alt="Screenshot_20260514_170603" src="https://github.com/user-attachments/assets/a649f647-e6d7-4dd7-8071-19f9c4009132" /> <img width="1080" height="2424" alt="Screenshot_20260514_170624" src="https://github.com/user-attachments/assets/88ed28a5-ecf6-4df7-86f6-8f26b5732fbe" /> <img width="1080" height="2424" alt="Screenshot_20260514_170641" src="https://github.com/user-attachments/assets/21388a01-01cd-4a10-aae0-16fa1a1e0715" /> 



<img width="1080" height="2424" alt="Screenshot_20260514_170655" src="https://github.com/user-attachments/assets/91a52e78-f146-4844-b656-27d599e2027a" /><img width="1080" height="2424" alt="Screenshot_20260514_170829" src="https://github.com/user-attachments/assets/65e52115-d03d-47c1-9ed8-6d2dfd3784f9" />



<img width="1080" height="2424" alt="Screenshot_20260514_170840" src="https://github.com/user-attachments/assets/dd23dc79-de37-4d93-a155-15ee0eaac71d" /><img width="1080" height="2424" alt="Screenshot_20260514_170855" src="https://github.com/user-attachments/assets/a263ce35-fe9b-4063-9ba3-1a850bd35084" />



<img width="1080" height="2424" alt="Screenshot_20260514_170739" src="https://github.com/user-attachments/assets/c9844578-ae54-4179-a649-70893b2ff12d" /><img width="1080" height="2424" alt="Screenshot_20260514_170803" src="https://github.com/user-attachments/assets/98cbd6e9-bc0f-4dcf-a086-e64d75b7e311" />




<img width="1080" height="2424" alt="Screenshot_20260514_170913" src="https://github.com/user-attachments/assets/9b076b34-3d0f-48f3-b110-45d87cab3cbd" /><img width="1080" height="2424" alt="Screenshot_20260514_171237" src="https://github.com/user-attachments/assets/d667d686-2db4-4a2f-9a19-6998b59b69fa" />




<img width="760" height="1600" alt="WhatsApp Image 2026-05-14 at 17 20 38" src="https://github.com/user-attachments/assets/983dc8e9-a6e7-4502-85a6-aafeedbe2854" /> <img width="760" height="1600" alt="WhatsApp Image 2026-05-14 at 17 20 38 (1)" src="https://github.com/user-attachments/assets/81c8ab07-f161-4d93-aa73-48d2fb397dc5" />





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

