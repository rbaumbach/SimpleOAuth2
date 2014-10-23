#import <Specta/Specta.h>
#define EXP_SHORTHAND
#import <Expecta/Expecta.h>
#import <OCMock/OCMock.h>
#import "SimpleOAuth2ErrorAlertView.h"


@interface SimpleOAuth2ErrorAlertView ()

@property (copy, nonatomic, readwrite) NSString *clientName;
@property (strong, nonatomic, readwrite) NSError *oAuth2Error;

@end

SpecBegin(SimpleOAuth2ErrorAlertViewTests)

describe(@"SimpleOAuth2ErrorAlertView", ^{
    __block SimpleOAuth2ErrorAlertView *errorAlertView;
    __block id fakeError;
    
    describe(@"init:", ^{
        beforeEach(^{
            errorAlertView = [[SimpleOAuth2ErrorAlertView alloc] init];
        });
        
        it(@"has clientName", ^{
            expect(errorAlertView.clientName).to.equal(@"OAuth2Client");
        });
        
        it(@"has default oAuth2Error", ^{
            expect(errorAlertView.oAuth2Error.domain).to.equal(@"OAuth2Client Domain");
            expect(errorAlertView.oAuth2Error.code).to.equal(42);
            expect(errorAlertView.oAuth2Error.userInfo).to.equal(@{@"NSLocalizedDescription": @"Default Error"});
        });
        
        it(@"calls designated initializer initWithClientName:oAuth2Error:", ^{
            expect(errorAlertView.title).to.equal(@"OAuth2Client OAuth2 Error");
            expect(errorAlertView.message).to.equal(@"OAuth2Client Domain - Default Error");
            expect([errorAlertView buttonTitleAtIndex:errorAlertView.cancelButtonIndex]).to.equal(@"OK");
            expect(errorAlertView.numberOfButtons).to.equal(1);
        });
    });
    
    describe(@"initWithClientName:oAuth2Error:", ^{
        __block NSDictionary *errorUserInfo;
        
        beforeEach(^{
            errorUserInfo = @{@"NSLocalizedDescription": @"Boooooogus error"};
            fakeError = OCMClassMock([NSError class]);
            OCMStub([fakeError domain]).andReturn(@"Fake Domain");
            OCMStub([fakeError userInfo]).andReturn(errorUserInfo);
            errorAlertView = [[SimpleOAuth2ErrorAlertView alloc] initWithClientName:@"SuperSocial.dogs"
                                                                        oAuth2Error:fakeError];
        });
        
        it(@"has a clientName", ^{
            expect(errorAlertView.clientName).to.equal(@"SuperSocial.dogs");
        });
        
        it(@"has an oAuth2Error", ^{
            expect(errorAlertView.oAuth2Error).to.equal(fakeError);
        });
        
        context(@"super view properties", ^{
            it(@"has a title", ^{
                expect(errorAlertView.title).to.equal(@"SuperSocial.dogs OAuth2 Error");
            });
            
            it(@"has a message", ^{
                expect(errorAlertView.message).to.equal(@"Fake Domain - Boooooogus error");
            });
            
            it(@"has 'OK' cancel button title", ^{
                expect([errorAlertView buttonTitleAtIndex:errorAlertView.cancelButtonIndex]).to.equal(@"OK");
            });
            
            it(@"does NOT have any other buttons", ^{
                expect(errorAlertView.numberOfButtons).to.equal(1);
            });
        });
    });
});

SpecEnd
