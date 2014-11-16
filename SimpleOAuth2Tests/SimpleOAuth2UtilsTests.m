#import <Specta/Specta.h>
#define EXP_SHORTHAND
#import <Expecta/Expecta.h>
#import <OCMock/OCMock.h>
#import "SimpleOAuth2Utils.h"


SpecBegin(SimpleOAuth2Utils)

describe(@"SimpleOAuth2Utils", ^{
    __block SimpleOAuth2Utils *utils;
    
    beforeEach(^{
        utils = [[SimpleOAuth2Utils alloc] init];
    });
    
    describe(@"#buildWebLoginRequestWithURL:permissionScope:", ^{
        __block NSURLRequest *urlRequest;
        
        context(@"with permission scope", ^{
            beforeEach(^{
                urlRequest = [utils buildWebLoginRequestWithURL:[NSURL URLWithString:@"http://scopes.r.us"]
                                                permissionScope:@[@"likes", @"dislikes"]];
            });
            
            it(@"builds proper request with permission scope attached", ^{
                expect(urlRequest.URL).to.equal([NSURL URLWithString:@"http://scopes.r.us&scope=likes+dislikes"]);
            });
        });

        context(@"without permission scope", ^{
            beforeEach(^{
                urlRequest = [utils buildWebLoginRequestWithURL:[NSURL URLWithString:@"http://scopes.r.us"]
                                                permissionScope:nil];
            });
            
            it(@"builds proper request without permission scope attached", ^{
                expect(urlRequest.URL).to.equal([NSURL URLWithString:@"http://scopes.r.us"]);
            });
        });
    });
});

SpecEnd