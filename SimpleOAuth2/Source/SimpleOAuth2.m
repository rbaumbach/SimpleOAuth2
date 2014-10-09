#import <AFNetworking/AFNetworking.h>
#import "SimpleOAuth2.h"


@interface SimpleOAuth2 ()

@property (strong, nonatomic, readwrite) NSURL *authURL;
@property (strong, nonatomic) AFHTTPSessionManager *sessionManager;

@end

@implementation SimpleOAuth2

#pragma mark - Init Methods

- (instancetype)initWithAuthenticationURL:(NSURL *)authURL
{
    self = [super init];
    if (self) {
        self.authURL = authURL;
        self.sessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:self.authURL];
        self.sessionManager.responseSerializer = [AFJSONResponseSerializer serializer];
    }
    return self;
}

#pragma mark - Public Methods

- (void)authenticateClientAtEndpoint:(NSString *)authEndpoint
                     tokenParameters:(NSDictionary *)tokenParameters
                             success:(void (^)(id authResponseObject))success
                             failure:(void (^)(NSError *error))failure
{
    [self.sessionManager POST:authEndpoint
                   parameters:tokenParameters
                      success:^(NSURLSessionDataTask *task, id responseObject) {
                          success(responseObject);
                      } failure:^(NSURLSessionDataTask *task, NSError *error) {
                          failure(error);
                      }];
}

@end
