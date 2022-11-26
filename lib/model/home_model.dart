class HomeRepoModel {
  HomeRepoModel({
    required this.body,
    required this.status,
  });
  late final Body body;
  late final String status;

  HomeRepoModel.fromJson(Map<String, dynamic> json) {
    body = Body.fromJson(json['body']);
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['body'] = body.toJson();
    _data['status'] = status;
    return _data;
  }
}

class Body {
  Body({
    required this.banners,
    required this.featuredCategories,
    required this.featuredCourses,
    required this.popularCourses,
    required this.popularInstructors,
    required this.liveClasses,
  });
  late final List<String> banners;
  late final List<FeaturedCategories> featuredCategories;
  late final List<FeaturedCourses> featuredCourses;
  late final List<PopularCourses> popularCourses;
  late final List<PopularInstructors> popularInstructors;
  late final List<LiveClasses> liveClasses;

  Body.fromJson(Map<String, dynamic> json) {
    banners = List.castFrom<dynamic, String>(json['banners']);
    featuredCategories = List.from(json['featured_categories'])
        .map((e) => FeaturedCategories.fromJson(e))
        .toList();
    featuredCourses = List.from(json['featured_courses'])
        .map((e) => FeaturedCourses.fromJson(e))
        .toList();
    popularCourses = List.from(json['popular_courses'])
        .map((e) => PopularCourses.fromJson(e))
        .toList();
    popularInstructors = List.from(json['popular_instructors'])
        .map((e) => PopularInstructors.fromJson(e))
        .toList();
    liveClasses = List.from(json['live_classes'])
        .map((e) => LiveClasses.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['banners'] = banners;
    _data['featured_categories'] =
        featuredCategories.map((e) => e.toJson()).toList();
    _data['featured_courses'] = featuredCourses.map((e) => e.toJson()).toList();
    _data['popular_courses'] = popularCourses.map((e) => e.toJson()).toList();
    _data['popular_instructors'] =
        popularInstructors.map((e) => e.toJson()).toList();
    _data['live_classes'] = liveClasses.map((e) => e.toJson()).toList();
    return _data;
  }
}

class FeaturedCategories {
  FeaturedCategories({
    required this.id,
    required this.name,
    required this.image,
  });
  late final int id;
  late final String name;
  late final String image;

  FeaturedCategories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['image'] = image;
    return _data;
  }
}

class FeaturedCourses {
  FeaturedCourses({
    required this.id,
    required this.name,
    required this.categoryId,
    required this.subcategoryId,
    required this.userId,
    required this.description,
    required this.objective,
    required this.benefit,
    required this.audience,
    required this.level,
    required this.language,
    required this.duration,
    required this.numberOfLesson,
    required this.image,
    required this.slug,
    required this.rating,
    required this.ratingCount,
    required this.views,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.instructorName,
    required this.instructorImage,
  });
  late final int id;
  late final String name;
  late final int categoryId;
  late final int subcategoryId;
  late final int userId;
  late final String description;
  late final String objective;
  late final String benefit;
  late final String audience;
  late final String level;
  late final String language;
  late final String duration;
  late final String numberOfLesson;
  late final String image;
  late final String slug;
  late final String rating;
  late final int ratingCount;
  late final String views;
  late final String status;
  late final String createdAt;
  late final String updatedAt;
  late final String instructorName;
  late final String instructorImage;

  FeaturedCourses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    categoryId = json['category_id'];
    subcategoryId = json['subcategory_id'];
    userId = json['user_id'];
    description = json['description'];
    objective = json['objective'];
    benefit = json['benefit'];
    audience = json['audience'];
    level = json['level'];
    language = json['language'];
    duration = json['duration'];
    numberOfLesson = json['number_of_lesson'];
    image = json['image'];
    slug = json['slug'];
    rating = json['rating'];
    ratingCount = json['rating_count'];
    views = json['views'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    instructorName = json['instructor_name'];
    instructorImage = json['instructor_image'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['category_id'] = categoryId;
    _data['subcategory_id'] = subcategoryId;
    _data['user_id'] = userId;
    _data['description'] = description;
    _data['objective'] = objective;
    _data['benefit'] = benefit;
    _data['audience'] = audience;
    _data['level'] = level;
    _data['language'] = language;
    _data['duration'] = duration;
    _data['number_of_lesson'] = numberOfLesson;
    _data['image'] = image;
    _data['slug'] = slug;
    _data['rating'] = rating;
    _data['rating_count'] = ratingCount;
    _data['views'] = views;
    _data['status'] = status;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['instructor_name'] = instructorName;
    _data['instructor_image'] = instructorImage;
    return _data;
  }
}

class PopularCourses {
  PopularCourses({
    required this.id,
    required this.name,
    required this.categoryId,
    required this.subcategoryId,
    required this.userId,
    required this.description,
    required this.objective,
    required this.benefit,
    required this.audience,
    required this.level,
    required this.language,
    required this.duration,
    required this.numberOfLesson,
    required this.image,
    required this.slug,
    required this.rating,
    required this.ratingCount,
    required this.views,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.instructorName,
    required this.instructorImage,
  });
  late final int id;
  late final String name;
  late final int categoryId;
  late final int subcategoryId;
  late final int userId;
  late final String description;
  late final String objective;
  late final String benefit;
  late final String audience;
  late final String level;
  late final String language;
  late final String duration;
  late final String numberOfLesson;
  late final String image;
  late final String slug;
  late final String rating;
  late final int ratingCount;
  late final String views;
  late final String status;
  late final String createdAt;
  late final String updatedAt;
  late final String instructorName;
  late final String instructorImage;

  PopularCourses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    categoryId = json['category_id'];
    subcategoryId = json['subcategory_id'];
    userId = json['user_id'];
    description = json['description'];
    objective = json['objective'];
    benefit = json['benefit'];
    audience = json['audience'];
    level = json['level'];
    language = json['language'];
    duration = json['duration'];
    numberOfLesson = json['number_of_lesson'];
    image = json['image'];
    slug = json['slug'];
    rating = json['rating'];
    ratingCount = json['rating_count'];
    views = json['views'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    instructorName = json['instructor_name'];
    instructorImage = json['instructor_image'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['category_id'] = categoryId;
    _data['subcategory_id'] = subcategoryId;
    _data['user_id'] = userId;
    _data['description'] = description;
    _data['objective'] = objective;
    _data['benefit'] = benefit;
    _data['audience'] = audience;
    _data['level'] = level;
    _data['language'] = language;
    _data['duration'] = duration;
    _data['number_of_lesson'] = numberOfLesson;
    _data['image'] = image;
    _data['slug'] = slug;
    _data['rating'] = rating;
    _data['rating_count'] = ratingCount;
    _data['views'] = views;
    _data['status'] = status;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['instructor_name'] = instructorName;
    _data['instructor_image'] = instructorImage;
    return _data;
  }
}

class PopularInstructors {
  PopularInstructors({
    required this.id,
    required this.name,
    required this.image,
    this.occupation,
    this.experience,
    this.specialization,
  });
  late final int id;
  late final String name;
  late final String image;
  late final String? occupation;
  late final String? experience;
  late final String? specialization;

  PopularInstructors.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    occupation = null;
    experience = null;
    specialization = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['image'] = image;
    _data['occupation'] = occupation;
    _data['experience'] = experience;
    _data['specialization'] = specialization;
    return _data;
  }
}

class LiveClasses {
  LiveClasses({
    required this.id,
    required this.userId,
    required this.name,
    required this.description,
    required this.image,
    required this.status,
    required this.startsAt,
  });
  late final int id;
  late final int userId;
  late final String name;
  late final String description;
  late final String image;
  late final String status;
  late final String startsAt;

  LiveClasses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    status = json['status'];
    startsAt = json['starts_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['user_id'] = userId;
    _data['name'] = name;
    _data['description'] = description;
    _data['image'] = image;
    _data['status'] = status;
    _data['starts_at'] = startsAt;
    return _data;
  }
}
