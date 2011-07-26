#import <Foundation/Foundation.h>

@interface Dealer : NSObject{
    int dealerHand;
}
@property int dealerHand;
- (int) dealCard:(int)hand;
- (int) selfDeal:(int)hand;

@end
