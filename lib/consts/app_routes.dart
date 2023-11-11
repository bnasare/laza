import 'package:flutter/material.dart';
import 'package:laza/screens/all_brands_screen.dart';
import 'package:laza/screens/product_details_screen.dart';

import '../cart/cart_screen.dart';
import '../screens/all_products_screen.dart';
import '../screens/authentication/screens/code_verification_screen.dart';
import '../screens/authentication/screens/forgot_password_screen.dart';
import '../screens/authentication/screens/login_screen.dart';
import '../screens/authentication/screens/reset_password_screen.dart';
import '../screens/authentication/screens/signup_screen.dart';
import '../screens/authentication/screens/social_auth_screen.dart';
import '../screens/home_screen.dart';
import '../screens/onboarding_screen.dart';
import '../screens/order_confirmed_screen.dart';
import '../screens/review_screen.dart';
import '../screens/user/screen/add_review_screen.dart';
import '../screens/user/screen/new_payment_details_screen.dart';
import '../screens/user/screen/payment_details_screen.dart';
import '../screens/user/screen/user_address_screen.dart';
import '../wishlist/wishlist_screen.dart';

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
      ReviewScreen.routeName: (context) => const ReviewScreen(),
      AddReviewScreen.routeName: (context) => const AddReviewScreen(),
      CartScreen.routeName: (context) => const CartScreen(),
      UserAddressScreen.routeName: (context) => const UserAddressScreen(),
      PaymentDetailsScreen.routeName: (context) => const PaymentDetailsScreen(),
      NewPaymentDetailsScreen.routeName: (context) =>
          const NewPaymentDetailsScreen(),
      OrderConfirmedScreen.routeName: (context) => const OrderConfirmedScreen(),
      AllProductsScreen.routeName: (context) => const AllProductsScreen(),
      WishlistScreen.routeName: (context) => const WishlistScreen(),
      AllBrandsScreen.routeName: (context) => const AllBrandsScreen(),
      ProductDetailsScreen.routeName: (context) => const ProductDetailsScreen(),
    };
  }
}
