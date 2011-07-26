#import <Foundation/Foundation.h>

@interface Dealer : NSObject{
    int dealerHand, dealerBust;
}
@property int dealerHand, dealerBust;
- (int) dealCard:(int)hand;
- (int) selfDeal:(int)hand;

@end
