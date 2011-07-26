#import <Foundation/Foundation.h>
#import "Dealer.h"

int main (int argc, const char * argv[])
{

    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    
    Dealer *frank = [[Dealer alloc]init];
    int hand = 0;
    int card;
    
    // Player First Deal
    card=[frank dealCard:hand]; // Deal card 1
    hand+=card;
    NSLog(@"Card 1: %i",card);
    card=[frank dealCard:hand]; // Deal card 2
    hand+=card;
    NSLog(@"Card 2: %i",card);
    NSLog(@"Hand = %i",hand);
    
    
    // Dealer selfDeal
    frank.dealerHand=[frank selfDeal:frank.dealerHand];
    NSLog(@"Final Hand: %i",frank.dealerHand);
    
    
    // Who wins?
    if (frank.dealerBust) {
        NSLog(@"The dealer busted, YOU WIN!");
    }else if (hand>frank.dealerHand){
        NSLog(@"You win!");
    }else if (hand<frank.dealerHand){
        NSLog(@"Dealer wins");
    }
    
    
    // Housekeeping
    [frank release];
    
    [pool drain];
    return 0;
}

