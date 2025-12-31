import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:shop/data/models/banner_model.dart';
import 'package:shop/data/models/base_response.dart';
import 'package:shop/data/models/category_model.dart';
import 'package:shop/data/models/product_model.dart';
import 'package:shop/data/models/user_model.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: 'https://5d42a6e2bc64f90014a56ca0.mockapi.io/api/v1/')
abstract class ApiService {
  factory ApiService(Dio dio, {String? baseUrl}) = _ApiService;

  @POST("/auth/login")
  Future<BaseResponse<UserModel>> login(
    @Field("phone") String phone,
    @Field("password") String password,
  );

  @GET("/banner")
  Future<BaseResponse<List<BannerModel>>> getBanner();

  @GET("/category")
  Future<BaseResponse<List<CategoryModel>>> getCategory();

  @GET("/product")
  Future<BaseResponse<List<ProductModel>>> getProduct();
}
