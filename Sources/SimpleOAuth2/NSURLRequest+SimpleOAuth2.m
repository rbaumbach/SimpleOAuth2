//Copyright (c) 2014-2019 Ryan Baumbach <github@ryan.codes>
//
//Permission is hereby granted, free of charge, to any person obtaining
//a copy of this software and associated documentation files (the "Software"),
//to deal in the Software without restriction, including
//without limitation the rights to use, copy, modify, merge, publish,
//distribute, sublicense, and/or sell copies of the Software, and to
//permit persons to whom the Software is furnished to do so, subject to
//the following conditions:
//
//The above copyright notice and this permission notice shall be
//included in all copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
//EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
//MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
//NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
//LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
//OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
//WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#import "NSURLRequest+SimpleOAuth2.h"
#import "SimpleOAuth2Utils.h"

NSString *const AuthorizationCodeParam = @"code=";

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
    SimpleOAuth2Utils *simpleOAuth2Utils = [[SimpleOAuth2Utils alloc] init];
    
    return [simpleOAuth2Utils buildWebLoginRequestWithURL:webLoginURL
                                          permissionScope:permissionScope];
}

+ (NSURLRequest *)buildWebLoginRequestWithURL:(NSURL *)webLoginURL
                              permissionScope:(NSArray *)permissionScope
{
    SimpleOAuth2Utils *simpleOAuth2Utils = [[SimpleOAuth2Utils alloc] init];
    
    return [simpleOAuth2Utils buildWebLoginRequestWithURL:webLoginURL
                                          permissionScope:permissionScope];
}

- (NSURLRequest *)buildWebLoginRequestWithURL:(NSURL *)webLoginURL
{
    SimpleOAuth2Utils *simpleOAuth2Utils = [[SimpleOAuth2Utils alloc] init];
    
    return [simpleOAuth2Utils buildWebLoginRequestWithURL:webLoginURL
                                          permissionScope:nil];
}

+ (NSURLRequest *)buildWebLoginRequestWithURL:(NSURL *)webLoginURL
{
    SimpleOAuth2Utils *simpleOAuth2Utils = [[SimpleOAuth2Utils alloc] init];
    
    return [simpleOAuth2Utils buildWebLoginRequestWithURL:webLoginURL
                                          permissionScope:nil];
}

@end
