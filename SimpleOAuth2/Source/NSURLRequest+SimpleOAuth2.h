@import Foundation;


@interface NSURLRequest (SimpleOAuth2)

- (NSString *)oAuth2AuthorizationCode;
- (NSURLRequest *)buildWebLoginRequestWithURL:(NSURL *)webLoginURL
                              permissionScope:(NSArray *)permissionScope;

@end
