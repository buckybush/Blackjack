#import "Dealer.h"
#import <stdlib.h>

@implementation Dealer
@synthesize dealerHand, dealerBust;

- (int)dealCard:(int)hand{
    int h = hand; // Set input equal to h
    int x; // declare int for return
    int r = (arc4random() % 12)+1; // Create random num between 1 and 12
    
    // 1 = Ace (11 or 1 if you bust with 11)
    if(r==1){
        if((h+11)>21)
            x=1;
        else
            x=11;
    }else if(r>1&&r<10){ // 2 - 9 are face value
        x=r;
    }else if(r>=10&&r<=12){ // JQK are all 10
        x=10;
    }else{
        x=-1;
    }
    return x; // Return value of card dealt
}

- (int)selfDeal:(int)hand{
    int h = hand, c, i=3;
    c=[self dealCard:h];
    h+=c;
    NSLog(@"Dealer Card 2: %i", c);
    while(h<16){
        c=[self dealCard:h];
        h+=c;
        NSLog(@"Dealer Card %i: %i",i,c);
        i++;
    }
    if(h>21){
        NSLog(@"Dealer has Busted with %i",h);
        self.dealerBust=1;
    }else{
        NSLog(@"Dealer has: %i",h);
        self.dealerBust=0;
    }
    return h;
}


- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

@end
