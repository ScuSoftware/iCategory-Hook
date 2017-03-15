#import <Foundation/Foundation.h>

@interface NSObject (Hook)

+ (void *)invokeOriginalMethod:(id)target selector:(SEL)selector;

@end
