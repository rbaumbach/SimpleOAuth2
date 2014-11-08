#import <Specta/Specta.h>
#define EXP_SHORTHAND
#import <Expecta/Expecta.h>
#import <OCMock/OCMock.h>
#import <AFNetworking/AFNetworking.h>
#import <RealFakes/RealFakes.h>
#import "SimpleOAuth2AuthenticationManager.h"


@interface SimpleOAuth2AuthenticationManager ()

@property (strong, nonatomic) AFHTTPSessionManager *sessionManager;

@end

SpecBegin(SimpleOAuth2AuthenticationManagerTests)

describe(@"SimpleOAuth2AuthenticationManager", ^{
    __block SimpleOAuth2AuthenticationManager *authManager;
    __block NSDictionary *fakeTokenParameters;
    __block NSDictionary *fakeAuthResponseObject;
    
    beforeEach(^{
        authManager = [[SimpleOAuth2AuthenticationManager alloc] init];
        
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
    });
    
    it(@"has a default response serializer for JSON", ^{
        expect(authManager.responseSerializer).to.beInstanceOf([AFJSONResponseSerializer class]);
    });
    
    it(@"has an AFHTTPSessionManager with default response serializer for JSON", ^{
        expect(authManager.sessionManager).to.beInstanceOf([AFHTTPSessionManager class]);
        expect(authManager.sessionManager.responseSerializer).to.equal(authManager.responseSerializer);
    });
    
    describe(@"#authenticateOAuthClient:tokenParametersDictionary:success:failure:", ^{
        __block FakeAFHTTPSessionManager *fakeSessionManager;
        __block id retResponseObject;
        __block NSError *retError;
        
        beforeEach(^{
            fakeSessionManager = [[FakeAFHTTPSessionManager alloc] init];
            authManager.sessionManager = fakeSessionManager;
        });
        
        context(@"on success", ^{
            beforeEach(^{
                [authManager authenticateOAuthClient:[NSURL URLWithString:@"https://api.stark.industries.com/jarvis/logmein"]
                                      tokenParametersDictionary:fakeTokenParameters
                                              success:^(id authResponseObject) {
                                                  retResponseObject = authResponseObject;
                                              } failure:nil];
                
                if (fakeSessionManager.postSuccessBlock) {
                    fakeSessionManager.postSuccessBlock(nil, fakeAuthResponseObject);
                }
            });

            it(@"calls success with authResponseObject", ^{
                expect(retResponseObject[@"access_token"]).to.equal(@"SFII-game-token");
                expect(retResponseObject[@"user"][@"id"]).to.equal(@"1234567890");
                expect(retResponseObject[@"user"][@"username"]).to.equal(@"ryu");
                expect(retResponseObject[@"user"][@"favorite-fruit"]).to.equal(@"durian");
                expect(retResponseObject[@"user"][@"profile_picture"]).to.equal(@"http://upload.wikimedia.org/wikipedia/en/e/e5/Ryu_TvC.png");
            });
            
            it(@"makes a POST call with the correct endpoint and parameters", ^{
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
                
                [authManager authenticateOAuthClient:nil
                           tokenParametersDictionary:nil
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
    
    describe(@"#authenticateOAuthClient:tokenParameters:success:failure:", ^{
        __block FakeAFHTTPSessionManager *fakeSessionManager;
        __block id retResponseObject;
        __block NSError *retError;
        
        beforeEach(^{
            fakeSessionManager = [[FakeAFHTTPSessionManager alloc] init];
            authManager.sessionManager = fakeSessionManager;
        });
        
        context(@"on success", ^{
            __block id fakeTokenParams;
            
            beforeEach(^{
                fakeTokenParams = OCMProtocolMock(@protocol(TokenParameters));
                OCMStub([fakeTokenParams build]).andReturn(fakeTokenParameters);
                
                [authManager authenticateOAuthClient:[NSURL URLWithString:@"https://api.stark.industries.com/jarvis/logmein"]
                                     tokenParameters:fakeTokenParams
                                             success:^(id authResponseObject) {
                                                 retResponseObject = authResponseObject;
                                             } failure:nil];
                
                if (fakeSessionManager.postSuccessBlock) {
                    fakeSessionManager.postSuccessBlock(nil, fakeAuthResponseObject);
                }
            });
            
            it(@"calls success with authResponseObject", ^{
                expect(retResponseObject[@"access_token"]).to.equal(@"SFII-game-token");
                expect(retResponseObject[@"user"][@"id"]).to.equal(@"1234567890");
                expect(retResponseObject[@"user"][@"username"]).to.equal(@"ryu");
                expect(retResponseObject[@"user"][@"favorite-fruit"]).to.equal(@"durian");
                expect(retResponseObject[@"user"][@"profile_picture"]).to.equal(@"http://upload.wikimedia.org/wikipedia/en/e/e5/Ryu_TvC.png");
            });
            
            it(@"makes a POST call with the correct endpoint and parameters", ^{
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
                
                [authManager authenticateOAuthClient:nil
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
