#import <Foundation/Foundation.h>
#import "Dealer.h"

int main (int argc, const char * argv[])
{

    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    
    Dealer *frank = [[Dealer alloc]init];
    int hand = 0;
    int card;
    
    card=[frank dealCard:hand]; // Deal card 1
    hand+=card;
    NSLog(@"Card 1: %i",card);
    card=[frank dealCard:hand]; // Deal card 2
    hand+=card;
    NSLog(@"Card 2: %i",card);
    NSLog(@"Hand = %i",hand);
    
    
    frank.dealerHand=[frank selfDeal:frank.dealerHand];
    NSLog(@"Final Hand: %i",frank.dealerHand);
    
    
    // Housekeeping
    [frank release];
    
    [pool drain];
    return 0;
}

