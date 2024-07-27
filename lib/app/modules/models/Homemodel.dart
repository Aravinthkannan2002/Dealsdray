// import 'dart:convert';

// Main response class
class Homemodel {
  final Data data;

  Homemodel({required this.data});

  factory Homemodel.fromJson(Map<String, dynamic> json) {
    return Homemodel(
      data: Data.fromJson(json['data']),
    );
  }
}

// Data class
class Data {
  final List<BannerItem> bannerOne;
  final List<Category> category;
  final List<Product> products;
  final List<BannerItem> bannerTwo;
  final List<NewArrival> newArrivals;
  final List<BannerItem> bannerThree;
  final List<CategoryListing> categoriesListing;
  final List<TopBrand> topBrands;
  final List<BrandListing> brandListing;
  final List<TopSellingProduct> topSellingProducts;
  final List<FeaturedLaptop> featuredLaptop;
  final List<UpcomingLaptop> upcomingLaptops;
  final List<UnboxedDeal> unboxedDeals;
  final List<BrandListing> myBrowsingHistory;

  Data({
    required this.bannerOne,
    required this.category,
    required this.products,
    required this.bannerTwo,
    required this.newArrivals,
    required this.bannerThree,
    required this.categoriesListing,
    required this.topBrands,
    required this.brandListing,
    required this.topSellingProducts,
    required this.featuredLaptop,
    required this.upcomingLaptops,
    required this.unboxedDeals,
    required this.myBrowsingHistory,
  });

 factory Data.fromJson(Map<String, dynamic>? json) {
  return Data(
    bannerOne: (json?['banner_one'] as List<dynamic>? ?? [])
        .map((i) => BannerItem.fromJson(i))
        .toList(),
    category: (json?['category'] as List<dynamic>? ?? [])
        .map((i) => Category.fromJson(i))
        .toList(),
    products: (json?['products'] as List<dynamic>? ?? [])
        .map((i) => Product.fromJson(i))
        .toList(),
    bannerTwo: (json?['banner_two'] as List<dynamic>? ?? [])
        .map((i) => BannerItem.fromJson(i))
        .toList(),
    newArrivals: (json?['new_arrivals'] as List<dynamic>? ?? [])
        .map((i) => NewArrival.fromJson(i))
        .toList(),
    bannerThree: (json?['banner_three'] as List<dynamic>? ?? [])
        .map((i) => BannerItem.fromJson(i))
        .toList(),
    categoriesListing: (json?['categories_listing'] as List<dynamic>? ?? [])
        .map((i) => CategoryListing.fromJson(i))
        .toList(),
    topBrands: (json?['top_brands'] as List<dynamic>? ?? [])
        .map((i) => TopBrand.fromJson(i))
        .toList(),
    brandListing: (json?['brand_listing'] as List<dynamic>? ?? [])
        .map((i) => BrandListing.fromJson(i))
        .toList(),
    topSellingProducts: (json?['top_selling_products'] as List<dynamic>? ?? [])
        .map((i) => TopSellingProduct.fromJson(i))
        .toList(),
    featuredLaptop: (json?['featured_laptop'] as List<dynamic>? ?? [])
        .map((i) => FeaturedLaptop.fromJson(i))
        .toList(),
    upcomingLaptops: (json?['upcoming_laptops'] as List<dynamic>? ?? [])
        .map((i) => UpcomingLaptop.fromJson(i))
        .toList(),
    unboxedDeals: (json?['unboxed_deals'] as List<dynamic>? ?? [])
        .map((i) => UnboxedDeal.fromJson(i))
        .toList(),
    myBrowsingHistory: (json?['my_browsing_history'] as List<dynamic>? ?? [])
        .map((i) => BrandListing.fromJson(i))
        .toList(),
  );
}


}

// BannerItem class
class BannerItem {
  final String banner;

  BannerItem({required this.banner});

  factory BannerItem.fromJson(Map<String, dynamic> json) {
    return BannerItem(
      banner: json['banner'],
    );
  }
}


// Category class
class Category {
  final String label;
  final String icon;

  Category({required this.label, required this.icon});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      label: json['label'],
      icon: json['icon'],
    );
  }
}

// Product class
class Product {
  final String icon;
  final String offer;
  final String label;
  final String subLabel;

  Product({
    required this.icon,
    required this.offer,
    required this.label,
    required this.subLabel,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      icon: json['icon'],
      offer: json['offer'],
      label: json['label'],
      subLabel: json['SubLabel'] ?? json['Sublabel'] ?? '',
    );
  }
}

// NewArrival class
class NewArrival {
  final String icon;
  final String offer;
  final String brandIcon;
  final String label;

  NewArrival({
    required this.icon,
    required this.offer,
    required this.brandIcon,
    required this.label,
  });

  factory NewArrival.fromJson(Map<String, dynamic> json) {
    return NewArrival(
      icon: json['icon'],
      offer: json['offer'],
      brandIcon: json['brandIcon'],
      label: json['label'],
    );
  }
}

// CategoryListing class
class CategoryListing {
  final String icon;
  final String offer;
  final String label;

  CategoryListing({
    required this.icon,
    required this.offer,
    required this.label,
  });

  factory CategoryListing.fromJson(Map<String, dynamic> json) {
    return CategoryListing(
      icon: json['icon'],
      offer: json['offer'],
      label: json['label'],
    );
  }
}

// TopBrand class
class TopBrand {
  final String icon;

  TopBrand({required this.icon});

  factory TopBrand.fromJson(Map<String, dynamic> json) {
    return TopBrand(
      icon: json['icon'],
    );
  }
}

// BrandListing class
class BrandListing {
  final String icon;
  final String offer;
  final String brandIcon;
  final String label;

  BrandListing({
    required this.icon,
    required this.offer,
    required this.brandIcon,
    required this.label,
  });

  factory BrandListing.fromJson(Map<String, dynamic> json) {
    return BrandListing(
      icon: json['icon'],
      offer: json['offer'],
      brandIcon: json['brandIcon'],
      label: json['label'],
    );
  }
}

// TopSellingProduct class
class TopSellingProduct {
  final String icon;
  final String label;

  TopSellingProduct({
    required this.icon,
    required this.label,
  });

  factory TopSellingProduct.fromJson(Map<String, dynamic> json) {
    return TopSellingProduct(
      icon: json['icon'],
      label: json['label'],
    );
  }
}

// FeaturedLaptop class
class FeaturedLaptop {
  final String icon;
  final String brandIcon;
  final String label;
  final String price;

  FeaturedLaptop({
    required this.icon,
    required this.brandIcon,
    required this.label,
    required this.price,
  });

  factory FeaturedLaptop.fromJson(Map<String, dynamic> json) {
    return FeaturedLaptop(
      icon: json['icon'],
      brandIcon: json['brandIcon'],
      label: json['label'],
      price: json['price'],
    );
  }
}

// UpcomingLaptop class
class UpcomingLaptop {
  final String icon;

  UpcomingLaptop({required this.icon});

  factory UpcomingLaptop.fromJson(Map<String, dynamic> json) {
    return UpcomingLaptop(
      icon: json['icon'],
    );
  }
}

// UnboxedDeal class
class UnboxedDeal {
  final String icon;
  final String offer;
  final String label;

  UnboxedDeal({
    required this.icon,
    required this.offer,
    required this.label,
  });

  factory UnboxedDeal.fromJson(Map<String, dynamic> json) {
    return UnboxedDeal(
      icon: json['icon'],
      offer: json['offer'],
      label: json['label'],
    );
  }
}
