@import Foundation;


@class AFHTTPResponseSerializer;

@interface SimpleOAuth2AuthenticationManager : NSObject

@property (strong, nonatomic) AFHTTPResponseSerializer *responseSerializer;

- (void)authenticateOAuthClient:(NSURL *)authURL
                tokenParameters:(NSDictionary *)tokenParameters
                        success:(void (^)(id authResponseObject))success
                        failure:(void (^)(NSError *error))failure;

@end
