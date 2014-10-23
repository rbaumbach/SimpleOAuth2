#import <UIKit/UIKit.h>


@interface SimpleOAuth2ErrorAlertView : UIAlertView

@property (copy, nonatomic, readonly) NSString *clientName;
@property (strong, nonatomic, readonly) NSError *oAuth2Error;

- (instancetype)initWithClientName:(NSString *)clientName
                       oAuth2Error:(NSError *)error;

@end
