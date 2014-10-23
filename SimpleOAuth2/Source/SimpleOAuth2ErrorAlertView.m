#import "SimpleOAuth2ErrorAlertView.h"


NSString *const OAuth2Error = @"OAuth2 Error";
NSString *const NSLocalizedDescriptionErrorKey = @"NSLocalizedDescription";
NSString *const OkButtonTitle = @"OK";

@interface SimpleOAuth2ErrorAlertView ()

@property (copy, nonatomic, readwrite) NSString *clientName;
@property (strong, nonatomic, readwrite) NSError *oAuth2Error;

@end

@implementation SimpleOAuth2ErrorAlertView

#pragma mark - Init Methods

- (instancetype)initWithClientName:(NSString *)clientName
                       oAuth2Error:(NSError *)error
{
    NSString *title = [NSString stringWithFormat:@"%@ %@", clientName, OAuth2Error];
    NSString *errorMessage = [NSString stringWithFormat:@"%@ - %@", error.domain, error.userInfo[NSLocalizedDescriptionErrorKey]];
    
    self = [super initWithTitle:title
                        message:errorMessage
                       delegate:nil
              cancelButtonTitle:OkButtonTitle
              otherButtonTitles:nil];
    if (self) {
        self.clientName = clientName;
        self.oAuth2Error = error;
    }
    return self;
}

- (instancetype)init
{
    NSError *defaultError = [NSError errorWithDomain:@"OAuth2Client Domain"
                                                code:42
                                            userInfo:@{ NSLocalizedDescriptionErrorKey: @"Default Error" }];
    
    return [self initWithClientName:@"OAuth2Client"
                        oAuth2Error:defaultError];
}

@end
