@import Foundation;
#import "NSURLRequest+SimpleOAuth2.h"


NSString *const AuthorizationCodeParam = @"?code=";
NSString *const ScopePermissionsParam = @"&scope=";

@implementation NSURLRequest (SimpleOAuth2)

#pragma mark - Public Methods

- (NSString *)oAuth2AuthorizationCode;
{
    NSRange rangeOfAuthCodeParam = [self.URL.absoluteString rangeOfString:AuthorizationCodeParam];
    
    NSString *authorizationCode;
    
    if (rangeOfAuthCodeParam.length) {
        authorizationCode = [self.URL.absoluteString substringFromIndex:rangeOfAuthCodeParam.location + rangeOfAuthCodeParam.length];
        
        if ([authorizationCode isEqualToString:@""]) {
            authorizationCode = nil;
        }
    }
    
    return authorizationCode;
}

- (NSURLRequest *)buildWebLoginRequestWithURL:(NSURL *)webLoginURL
                              permissionScope:(NSArray *)permissionScope
{
    NSMutableString *webLoginURLString = [webLoginURL.absoluteString mutableCopy];
    
    if (permissionScope.count > 0) {
        [webLoginURLString appendString:ScopePermissionsParam];
        
        [permissionScope enumerateObjectsUsingBlock:^(NSString *permission, NSUInteger idx, BOOL *stop) {
            if (idx != 0) {
                [webLoginURLString appendString:@"+"];
            }
            
            [webLoginURLString appendString:permission];
        }];
    }
    
    return [NSURLRequest requestWithURL:[NSURL URLWithString:webLoginURLString]];
}

@end