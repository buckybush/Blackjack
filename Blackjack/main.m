#import <Foundation/Foundation.h>
#include <stdlib.h>

int main (int argc, const char * argv[])
{

    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    int r = arc4random() % 13;
    
    
    
    [pool drain];
    return 0;
}

