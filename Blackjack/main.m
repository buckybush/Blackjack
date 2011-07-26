#import <Foundation/Foundation.h>
#import "Dealer.h"

int main (int argc, const char * argv[])
{

    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    
    Dealer *frank = [[Dealer alloc]init];
    int hand = 0;
    int card;
    
    // Player Deal
    card=[frank dealCard:hand]; // Deal card 1
    hand+=card;
    NSLog(@"Card 1: %i",card);
    card=[frank dealCard:hand]; // Deal card 2
    hand+=card;
    NSLog(@"Card 2: %i",card);
    NSLog(@"Hand = %i",hand);

    NSLog(@"\n"); //Break
    
    // Dealer Card 1
    frank.dealerHand=[frank dealCard:frank.dealerHand];
    NSLog(@"Dealer Card 1: %i",frank.dealerHand);
    
    NSLog(@"\n"); //Break
    
    int stand = 0;
    int userInput;
    int bust = 0;
    
    while(!stand && !bust){
        userInput=-1;
        
        // User Input
        NSLog(@"1: Hit");
        NSLog(@"2: Split");
        NSLog(@"3: Stand");
        NSLog(@"0: Quit");
        printf("Your turn: ");
        scanf("%i",&userInput);
        
        if (userInput==1) {
            card=[frank dealCard:hand]; // Deal card 1
            hand+=card;
            NSLog(@"Card Drawn: %i",card);
            NSLog(@"New Hand = %i",hand);
            if (hand>21) {
                NSLog(@"BUST!");
                bust = 1;
            }
        }else if(userInput==2){
            //Split
        }else if(userInput==3){
        
        }else {
            NSLog(@"\nPlease enter a valid input\n");
            userInput= -1;
        }
    }
    
    
    
    if(!bust){
    // Dealer selfDeal Cards 2-n
    frank.dealerHand=[frank selfDeal:frank.dealerHand];
    } else {
        NSLog(@"You busted...");
    }
    
    if(!bust){
        // Who wins?
        if (frank.dealerBust && !bust) {
            NSLog(@"The dealer busted, YOU WIN!");
        }else if (hand>frank.dealerHand && !bust){
            NSLog(@"You win!");
        }else if (hand<frank.dealerHand){
            NSLog(@"Dealer wins");
        }else {
            NSLog(@"else");
        }
    }
    
    
    // Housekeeping
    [frank release];
    
    [pool drain];
    return 0;
}

