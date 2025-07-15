# Style - E-Commerce Flutter App

A beautiful, modern e-commerce mobile app prototype built with Flutter. This app demonstrates product listing, product details, cart management, and a clean navigation flow using Bloc for state management.

## Features

- **Splash screen** with app branding
- **Product listing** in a modern grid with images, ratings, and descriptions
- **Product details** with large images, ratings, and add-to-cart/quantity controls
- **Cart screen** with quantity adjustment, product images, and total price
- **Cart badge** in the app bar showing the number of items
- **Purple theme** throughout the app
- **Centralized navigation and API service structure**
- **Cart state is persisted using local storage (shared_preferences)**
- **Product detail screen is scrollable to prevent overflow on small devices**

## Project Structure

```
lib/
  main.dart                # App entry point
  models/                  # Data models (Product, CartItem)
  bloc/                    # Bloc/Cubit for cart state
  screens/                 # UI screens (product list, details, cart, splash)
  widgets/                 # Reusable widgets (product tile, etc.)
  routes/app_router.dart   # Centralized app routes
  services/product_service.dart # API service for fetching products
```

## APK Link -> https://drive.google.com/file/d/13fza8X0giDZ7-cY10PsoOLkZJaL6CGyS/view?usp=sharing
## API & Images

- **Products are fetched from [Fake Store API](https://fakestoreapi.com/)**
- **Why a fake API?**
  - Many free image sources block direct image loading in mobile apps due to certificate or hotlinking issues.
  - The Fake Store API provides product data and images that work reliably in mobile apps.

## How to Run

1. Clone this repo
2. Run `flutter pub get`
3. Run `flutter run` (on emulator or device)

## Customization
- You can easily swap out the API, theme, or add more features (categories, search, etc.)
- All navigation and API logic is modular for easy extension.

---

**Made with Flutter, Bloc, and 💜 for modern mobile commerce.**
# shopsyDemo
