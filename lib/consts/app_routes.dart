import 'package:flutter/material.dart';

import '../screens/add_review_screen.dart';
import '../screens/all_products_screen.dart';
import '../screens/cart_screen.dart';
import '../screens/code_verification_screen.dart';
import '../screens/forgot_password_screen.dart';
import '../screens/home_screen.dart';
import '../screens/login_screen.dart';
import '../screens/new_payment_details_screen.dart';
import '../screens/onboarding_screen.dart';
import '../screens/order_confirmed_screen.dart';
import '../screens/payment_details_screen.dart';
import '../screens/product_details_screen.dart';
import '../screens/reset_password_screen.dart';
import '../screens/review_screen.dart';
import '../screens/signup_screen.dart';
import '../screens/social_auth_screen.dart';
import '../screens/user_address_screen.dart';
import '../screens/wishlist_screen.dart';

class AppRoutes {
  Map<String, WidgetBuilder> getRoutes() {
    return {
      OnboardingScreen.routeName: (context) => const OnboardingScreen(),
      LoginScreen.routeName: (context) => const LoginScreen(),
      SignUpScreen.routeName: (context) => const SignUpScreen(),
      ForgotPasswordScreen.routeName: (context) => const ForgotPasswordScreen(),
      SocialAuthScreen.routeName: (context) => const SocialAuthScreen(),
      HomeScreen.routeName: (context) => const HomeScreen(),
      ResetPasswordScreen.routeName: (context) => const ResetPasswordScreen(),
      CodeVerificationScreen.routeName: (context) =>
          const CodeVerificationScreen(),
      ProductDetailsScreen.routeName: (context) => const ProductDetailsScreen(),
      ReviewScreen.routeName: (context) => const ReviewScreen(),
      AddReviewScreen.routeName: (context) => const AddReviewScreen(),
      CartScreen.routeName: (context) => const CartScreen(),
      UserAddressScreen.routeName: (context) => const UserAddressScreen(),
      PaymentDetailsScreen.routeName: (context) => const PaymentDetailsScreen(),
      NewPaymentDetailsScreen.routeName: (context) => NewPaymentDetailsScreen(),
      OrderConfirmedScreen.routeName: (context) => const OrderConfirmedScreen(),
      AllProductsScreen.routeName: (context) => const AllProductsScreen(),
      WishlistScreen.routeName: (context) => const WishlistScreen(),
    };
  }
}
