#import <AFNetworking/AFNetworking.h>
#import "SimpleOAuth2AuthenticationManager.h"


@interface SimpleOAuth2AuthenticationManager ()

@property (strong, nonatomic) AFHTTPSessionManager *sessionManager;

@end

@implementation SimpleOAuth2AuthenticationManager

#pragma mark - Init Methods

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.responseSerializer = [AFJSONResponseSerializer serializer];
        self.sessionManager = [[AFHTTPSessionManager alloc] init];
        self.sessionManager.responseSerializer = self.responseSerializer;
    }
    return self;
}

#pragma mark - Public Methods

- (void)authenticateOAuthClient:(NSURL *)authURL
                tokenParameters:(NSDictionary *)tokenParameters
                        success:(void (^)(id authResponseObject))success
                        failure:(void (^)(NSError *error))failure
{
    [self.sessionManager POST:authURL.absoluteString
                   parameters:tokenParameters
                      success:^(NSURLSessionDataTask *task, id responseObject) {
                          success(responseObject);
                      } failure:^(NSURLSessionDataTask *task, NSError *error) {
                          failure(error);
                      }];
}

@end
