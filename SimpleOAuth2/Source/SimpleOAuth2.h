@import Foundation;


@interface SimpleOAuth2 : NSObject

@property (strong, nonatomic, readonly) NSURL *authURL;

- (instancetype)initWithAuthenticationURL:(NSURL *)authURL;

- (void)authenticateClientAtEndpoint:(NSString *)authEndpoint
                     tokenParameters:(NSDictionary *)tokenParameters
                             success:(void (^)(id authResponseObject))success
                             failure:(void (^)(NSError *error))failure;

@end
