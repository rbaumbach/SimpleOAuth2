#import <Specta/Specta.h>
#define EXP_SHORTHAND
#import <Expecta/Expecta.h>
#import <OCMock/OCMock.h>
#import "SimpleOAuth2.h"


SpecBegin(SimpleOAuth2Tests)

describe(@"SimpleOAuth2", ^{
    __block SimpleOAuth2 *simpleOAuth2;
    
    beforeEach(^{
        simpleOAuth2 = [[SimpleOAuth2 alloc] init];
    });
    
    it(@"exists", ^{
        expect(simpleOAuth2).toNot.beNil();
    });
});

SpecEnd
