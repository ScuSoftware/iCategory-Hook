#import "ViewController+HookViewDidLoad.h"
#include <objc/runtime.h>

@implementation ViewController (HookViewDidLoad)

- (void)viewDidLoad {
    NSLog(@"Invoke Category viewDidLoad");
    
    // Call original method
    [ViewController invokeOriginalMethod:self selector:_cmd];
}

+ (void)invokeOriginalMethod:(id)target selector:(SEL)selector {
    // Get the class method list
    uint count;
    Method *methodList = class_copyMethodList([target class], &count);
    
    // Print to console
    for (int i = 0; i < count; i++) {
        Method method = methodList[i];
        NSLog(@"Category get selector : %d %@", i, NSStringFromSelector(method_getName(method)));
    }
    
    // Call original method . Note here take the last same name method as the original method
    for ( int i = count - 1 ; i >= 0; i--) {
        Method method = methodList[i];
        SEL name = method_getName(method);
        IMP implementation = method_getImplementation(method);
        if (name == selector) {
            // id (*IMP)(id, SEL, ...)
            ((void (*)(id, SEL))implementation)(target, name);
            break;
        }
    }
    free(methodList);
}

@end