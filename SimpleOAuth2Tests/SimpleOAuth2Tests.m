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
        simpleOAuth2 = [[SimpleOAuth2 alloc] init];
    });
    
    it(@"has a default response serializer for JSON", ^{
        expect(simpleOAuth2.responseSerializer).to.beInstanceOf([AFJSONResponseSerializer class]);
    });
    
    it(@"has an AFHTTPSessionManager with default response serializer for JSON", ^{
        expect(simpleOAuth2.sessionManager).to.beInstanceOf([AFHTTPSessionManager class]);
        expect(simpleOAuth2.sessionManager.responseSerializer).to.equal(simpleOAuth2.responseSerializer);
    });
    
    describe(@"#authenticateOAuthClient:tokenParameters:success:failure:", ^{
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
                
                [simpleOAuth2 authenticateOAuthClient:[NSURL URLWithString:@"https://api.stark.industries.com/jarvis/logmein"]
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
                expect(fakeSessionManager.postURLString).to.equal(@"https://api.stark.industries.com/jarvis/logmein");
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
                
                [simpleOAuth2 authenticateOAuthClient:nil
                                      tokenParameters:nil
                                              success:^(id authResponseObject) {
                                                  retResponseObject = authResponseObject;
                                              } failure:^(NSError *error) {
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
