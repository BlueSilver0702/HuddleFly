//
//  ComSelViewController.m
//  HuddleFly
//
//  Created by User on 8/8/15.
//  Copyright (c) 2015 XianA. All rights reserved.
//

#import "ComSelViewController.h"
#import "CommandsViewController.h"

@interface ComSelViewController ()
{
    IBOutlet UIPickerView *commandPicker;
    NSString *selected;
    NSArray *selArr;
}
@end

@implementation ComSelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    selArr = [NSArray arrayWithObjects:@"Stop YouTube", @"Reboot", @"Update Version", @"Shutdown", @"Wait", nil];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return 5;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    selected = [selArr objectAtIndex:row];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [selArr objectAtIndex:row];
}

- (IBAction)onExit:(id)sender {
    CommandsViewController *homeCtrl = (CommandsViewController *)self.parentViewController;
    [homeCtrl closeModal:selected];
    
}

@end
