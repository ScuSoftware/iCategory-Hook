#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSLog(@"++++++ Invoke Original viewDidLoad");
    
    // add a gray view
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 100, 100)];
    view.backgroundColor = [UIColor grayColor];
    [self.view addSubview: view];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
