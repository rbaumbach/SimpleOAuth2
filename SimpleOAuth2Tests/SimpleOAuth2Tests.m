#import <Specta/Specta.h>
#define EXP_SHORTHAND
#import <Expecta/Expecta.h>
#import <OCMock/OCMock.h>
#import <AFNetworking/AFNetworking.h>
#import <RealFakes/RealFakes.h>
#import "SimpleOAuth2.h"


@interface SimpleOAuth2 ()

@property (strong, nonatomic) AFHTTPSessionManager *sessionManager;

@end

SpecBegin(SimpleOAuth2Tests)

describe(@"SimpleOAuth2", ^{
    __block SimpleOAuth2 *simpleOAuth2;
    
    beforeEach(^{
        simpleOAuth2 = [[SimpleOAuth2 alloc] initWithAuthenticationURL:[NSURL URLWithString:@"https://api.stark.industries.com"]];
    });
    
    it(@"has an authURL", ^{
        expect(simpleOAuth2.authURL).to.equal([NSURL URLWithString:@"https://api.stark.industries.com"]);
    });
    
    it(@"has an AFHTTPSessionManager", ^{
        expect(simpleOAuth2.sessionManager).to.beInstanceOf([AFHTTPSessionManager class]);
        expect(simpleOAuth2.sessionManager.baseURL).to.equal([NSURL URLWithString:@"https://api.stark.industries.com"]);
        expect(simpleOAuth2.sessionManager.responseSerializer).to.beInstanceOf([AFJSONResponseSerializer class]);
    });
    
    describe(@"#authenticateWithAuthCode:tokenParameters:success:failure:", ^{
        __block FakeAFHTTPSessionManager *fakeSessionManager;
        __block id retResponseObject;
        __block NSError *retError;
        
        beforeEach(^{
            fakeSessionManager = [[FakeAFHTTPSessionManager alloc] init];
            simpleOAuth2.sessionManager = fakeSessionManager;
        });
        
        context(@"on success", ^{
            __block NSDictionary *fakeAuthResponseObject;
            __block NSDictionary *fakeTokenParameters;
            
            beforeEach(^{
                fakeTokenParameters = @{
                                        @"code"        : @"open-sesame",
                                        @"id"          : @"none-needed",
                                        @"who-cares"   : @"not-i",
                                        @"sure-why-not": @"alrighty-then"
                                       };
                
                fakeAuthResponseObject = @{
                                           @"access_token": @"SFII-game-token",
                                           @"user": @{
                                                      @"id"             : @"1234567890",
                                                      @"username"       : @"ryu",
                                                      @"favorite-fruit" : @"durian",
                                                      @"profile_picture": @"http://upload.wikimedia.org/wikipedia/en/e/e5/Ryu_TvC.png"
                                                     }
                                          };
                
                [simpleOAuth2 authenticateClientAtEndpoint:@"/jarvis/logmein/"
                                           tokenParameters:fakeTokenParameters
                                                   success:^(id authResponseObject) {
                                                       retResponseObject = authResponseObject;
                                                   } failure:nil];
                
                if (fakeSessionManager.postSuccessBlock) {
                    fakeSessionManager.postSuccessBlock(nil, fakeAuthResponseObject);
                }
            });

            it(@"calls success with instagramLoginResponse", ^{
                expect(retResponseObject[@"access_token"]).to.equal(@"SFII-game-token");
                expect(retResponseObject[@"user"][@"id"]).to.equal(@"1234567890");
                expect(retResponseObject[@"user"][@"username"]).to.equal(@"ryu");
                expect(retResponseObject[@"user"][@"favorite-fruit"]).to.equal(@"durian");
                expect(retResponseObject[@"user"][@"profile_picture"]).to.equal(@"http://upload.wikimedia.org/wikipedia/en/e/e5/Ryu_TvC.png");
            });
            
            it(@"makes a POST call with the correct endpoint and parameters to Instagram", ^{
                expect(fakeSessionManager.postURLString).to.equal(@"/jarvis/logmein/");
                expect(fakeSessionManager.postParameters).to.equal(@{ @"code"        : @"open-sesame",
                                                                      @"id"          : @"none-needed",
                                                                      @"who-cares"   : @"not-i",
                                                                      @"sure-why-not": @"alrighty-then" });
            });
        });
        
        context(@"on failure", ^{
            __block id fakeError;
            
            beforeEach(^{
                fakeError = OCMClassMock([NSError class]);
                
                [simpleOAuth2 authenticateClientAtEndpoint:nil
                                           tokenParameters:nil
                                                   success:nil
                                                   failure:^(NSError *error) {
                                                       retError = error;
                                                   }];
                
                fakeSessionManager.postFailureBlock(nil, fakeError);
            });
            
            it(@"calls failure block", ^{
                expect(retError).to.equal(fakeError);
            });
        });
    });
});

SpecEnd
