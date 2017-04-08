#import <AFNetworking/AFNetworking.h>


@interface FakeAFHTTPSessionManager : AFHTTPSessionManager

@property (strong, nonatomic) NSURLSessionConfiguration *urlSessionConfiguration;

@property (copy, nonatomic) NSString *postURLString;
@property (strong, nonatomic) id postParameters;
@property (copy, nonatomic) void (^postSuccessBlock)(NSURLSessionDataTask *task, id responseObject);
@property (copy, nonatomic) void (^postFailureBlock)(NSURLSessionDataTask *task, NSError *error);

- (void)reset;

@end
