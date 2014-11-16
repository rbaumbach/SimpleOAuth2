#import <Specta/Specta.h>
#define EXP_SHORTHAND
#import <Expecta/Expecta.h>
#import <OCMock/OCMock.h>
#import "NSURLRequest+SimpleOAuth2.h"


SpecBegin(NSURLRequest_SimpleOAuth2Tests)

describe(@"NSURLRequest+SimpleOAuth2", ^{
    __block NSURLRequest *request;
    
    describe(@"#authCode", ^{
        __block NSString *authorizationCode;
        
        context(@"request contains authorization code", ^{
            context(@"URL has trailing forward slash", ^{
                beforeEach(^{
                    request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://fancyFancy.donuts/?code=123CODEZ"]];
                    authorizationCode = [request oAuth2AuthorizationCode];
                });
                
                it(@"returns the authorization code", ^{
                    expect(authorizationCode).to.equal(@"123CODEZ");
                });
            });
            
            context(@"URL DOES NOT have trailing forward slash", ^{
                beforeEach(^{
                    request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://lessFancy.donuts/home.html?code=123CODEZ"]];
                    authorizationCode = [request oAuth2AuthorizationCode];
                });
                
                it(@"returns the authorization code", ^{
                    expect(authorizationCode).to.equal(@"123CODEZ");
                });
            });
        });
        
        context(@"request DOES NOT contain auth code", ^{
            beforeEach(^{
                request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://notFancyFancy.donuts"]];
                authorizationCode = [request oAuth2AuthorizationCode];
            });
            
            it(@"returns NO", ^{
                expect(authorizationCode).to.beNil();
            });
        });
        
        context(@"request contains empty auth code", ^{
            beforeEach(^{
                request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://fancyFancy.donuts/?code="]];
                authorizationCode = [request oAuth2AuthorizationCode];
            });
            
            it(@"returns NO", ^{
                expect(authorizationCode).to.beNil();
            });
        });
    });
    
    describe(@"#buildWebLoginRequestWithURL:permissionScope:", ^{
        __block NSURLRequest *builtRequestWithPermissionScope;
        
        beforeEach(^{
            builtRequestWithPermissionScope = [request buildWebLoginRequestWithURL:[NSURL URLWithString:@"http://scopes.r.us"]
                                                                   permissionScope:@[@"likes", @"dislikes"]];
        });
        
        it(@"builds proper request with permission scope attached", ^{
            expect(builtRequestWithPermissionScope.URL).to.equal([NSURL URLWithString:@"http://scopes.r.us&scope=likes+dislikes"]);
        });
    });
    
    describe(@"#buildWebLoginRequestWithURL:", ^{
        __block NSURLRequest *builtRequest;
        
        beforeEach(^{
            builtRequest = [request buildWebLoginRequestWithURL:[NSURL URLWithString:@"http://scopes.r.us"]];
        });
        
        it(@"builds proper request", ^{
            expect(builtRequest.URL).to.equal([NSURL URLWithString:@"http://scopes.r.us"]);
        });
    });
    
    describe(@".buildWebLoginRequestWithURL:permissionScope:", ^{
        __block NSURLRequest *builtRequestWithPermissionScope;
        
        beforeEach(^{
            builtRequestWithPermissionScope = [NSURLRequest buildWebLoginRequestWithURL:[NSURL URLWithString:@"http://scopes.r.us"]
                                                                        permissionScope:@[@"likes", @"dislikes"]];
        });
        
        it(@"builds proper request with permission scope attached", ^{
            expect(builtRequestWithPermissionScope.URL).to.equal([NSURL URLWithString:@"http://scopes.r.us&scope=likes+dislikes"]);
        });
    });
    
    describe(@".buildWebLoginRequestWithURL:", ^{
        __block NSURLRequest *builtRequest;
        
        beforeEach(^{
            builtRequest = [NSURLRequest buildWebLoginRequestWithURL:[NSURL URLWithString:@"http://scopes.r.us"]];
        });
        
        it(@"builds proper request", ^{
            expect(builtRequest.URL).to.equal([NSURL URLWithString:@"http://scopes.r.us"]);
        });
    });
});

SpecEnd
