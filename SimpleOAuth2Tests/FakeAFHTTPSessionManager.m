#import "FakeAFHTTPSessionManager.h"


@implementation FakeAFHTTPSessionManager

#pragma mark - AFHTTPSessionManager

- (instancetype)initWithBaseURL:(NSURL *)url
           sessionConfiguration:(NSURLSessionConfiguration *)configuration
{
    self.urlSessionConfiguration = configuration;
    return [super initWithBaseURL:url sessionConfiguration:configuration];
}

- (NSURLSessionDataTask *)POST:(NSString *)URLString parameters:(id)parameters
                      progress:(void (^)(NSProgress * _Nonnull))uploadProgress
                       success:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success
                       failure:(void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure
{
    self.postURLString = URLString;
    self.postParameters = parameters;
    self.postSuccessBlock = success;
    self.postFailureBlock = failure;
    
    // Return bogus session data task
    
    return [[NSURLSessionDataTask alloc] init];
}

#pragma mark - Public Methods

- (void)reset
{
    self.postURLString = nil;
    self.postParameters = nil;
    self.postSuccessBlock = nil;
    self.postFailureBlock = nil;
}

@end
