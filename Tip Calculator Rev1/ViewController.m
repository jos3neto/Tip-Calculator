//
//  ViewController.m
//  Tip Calculator Rev1
//
//  Created by Jose on 24/11/17.
//  Copyright © 2017 appCat. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *billAmount;
@property (weak, nonatomic) IBOutlet UITextField *percent;
@property (weak, nonatomic) IBOutlet UILabel *display;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.billAmount.delegate = self;
    self.percent.delegate = self;
    UITapGestureRecognizer* tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tapGesture];
}

- (void) dismissKeyboard {
    // this method will resign first responder or end editting, and dismiss the keyboard
    [self.billAmount resignFirstResponder];
    [self.percent resignFirstResponder];
    //[self.view endEditing:YES]; alternate way of dismissing keyboard
}

- (IBAction)calculateTip:(UIButton *)sender {
    [self.view endEditing:YES]; // alternate way implemented here
    float billAmountFloat = [self.billAmount.text floatValue];
    float percentFloat = [self.percent.text floatValue];
    float tipAmount = billAmountFloat * percentFloat/100;
    self.display.text = [NSString stringWithFormat:@"$%.2f", tipAmount];
}

- (IBAction)sliderValueChanged:(UISlider*)sender {
    self.percent.text = [NSString stringWithFormat:@"%.0f",sender.value*100];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
