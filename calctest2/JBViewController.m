//
//  JBViewController.m
//  calctest2
//
//  Created by Jassim on 6/15/14.
//
//

#import "JBViewController.h"
#import "JBFactory.h"
#import "JBType.h"


@interface JBViewController ()

@end


@implementation JBViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIView *dummyView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    self.inputTextField.inputView = dummyView;
    [self.inputTextField becomeFirstResponder];
    
    self.unit1Button.hidden = YES;
    self.unit2Button.hidden = YES;
    self.unit3Button.hidden = YES;
    self.unit4Button.hidden = YES;
    self.unit5Button.hidden = YES;
    self.unit6Button.hidden = YES;
    self.backButton.hidden = YES;
    
    JBFactory *factory = [[JBFactory alloc]init];
    self.types = [factory types];
    self.currentPoint = 0;
    [self updateTypes];

    //self.infoBarLabel.backgroundColor = [UIColor clearColor];
    
/*
    if (self.massButton.state == UIControlStateHighlighted) {
        if (self.massButton.state == UIControlStateSelected) {
            [UIView animateWithDuration:0.25 animations:^{
                self.massButton.alpha = 0.0;
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:0.25 animations:^{
                    self.massButton.alpha = 1.0;
                } completion:nil];
            }];

        }
           }
*/
    
}




-(void)updateTypes
{
    JBType *typeModel = [self.types objectAtIndex:self.currentPoint];
    
    //Call button names from JBFactory
    
    
    self.firstButtonName = typeModel.unit1ButtonName;
    self.secondButtonName = typeModel.unit2ButtonName;
    self.thirdButtonName = typeModel.unit3ButtonName;
    self.forthButtonName = typeModel.unit4ButtonName;
    self.fifthButtonName = typeModel.unit5ButtonName;
    self.sixthButtonName = typeModel.unit6ButtonName;


    //Change Units Button Names
    
    if ([self.unit1Button isKindOfClass:[UIButton class]])
    {
        [self.unit1Button setTitle:typeModel.unit1ButtonName forState:UIControlStateNormal];
        
        if ([self.unit2Button isKindOfClass:[UIButton class]])
        {
            [self.unit2Button setTitle:typeModel.unit2ButtonName forState:UIControlStateNormal];
        }
        if ([self.unit3Button isKindOfClass:[UIButton class]])
        {
            [self.unit3Button setTitle:typeModel.unit3ButtonName forState:UIControlStateNormal];
        }
        if ([self.unit4Button isKindOfClass:[UIButton class]])
        {
            [self.unit4Button setTitle:typeModel.unit4ButtonName forState:UIControlStateNormal];
        }
        if ([self.unit5Button isKindOfClass:[UIButton class]])
        {
            [self.unit5Button setTitle:typeModel.unit5ButtonName forState:UIControlStateNormal];
        }
        if ([self.unit6Button isKindOfClass:[UIButton class]])
        {
            [self.unit6Button setTitle:typeModel.unit6ButtonName forState:UIControlStateNormal];
        }

        
    }
    
}

-(void)updateLogic
{
    JBType *logic = [self.types objectAtIndex:self.currentPoint];
    
    
    //MASS
    if (self.currentPoint == 0)
    {
        self.kg = logic.unit1ButtonLogic;
        self.lb = logic.unit2ButtonLogic;
        self.oz = logic.unit3ButtonLogic;
        self.gram = logic.unit4ButtonLogic;
        
        
        self.kgToKg = self.kg * [self.inputTextField.text floatValue];
        self.kgToLb = (1/self.lb) * [self.inputTextField.text floatValue];
        self.kgToOz = [self.inputTextField.text floatValue] / self.oz;
        self.kgToGram = self.gram * [self.inputTextField.text floatValue];
        
        self.lbToKg = self.lb * [self.inputTextField.text floatValue];
        self.lbToLb = 1 * [self.inputTextField.text floatValue];
        self.lbToOz = 16 *[self.inputTextField.text floatValue];
        self.lbToGram = (self.lb*1000) * [self.inputTextField.text floatValue];
        
        self.ozToKg = self.oz * [self.inputTextField.text floatValue];
        self.ozToLb = [self.inputTextField.text floatValue]/16;
        self.ozToOz = 1 * [self.inputTextField.text floatValue];
        self.ozToGram = (self.ozToKg * 1000);
        
        self.gramToKg = [self.inputTextField.text floatValue] / self.gram;
        self.gramToLb = [self.inputTextField.text floatValue] / (self.lb*1000);
        self.gramToOz = 1/(([self.inputTextField.text floatValue]) * (self.gram*self.oz));
        self.gramToGram = 1 * [self.inputTextField.text floatValue];
        
    
      //INPUT UNIT = KG

        if ([self.inputUnit.text isEqualToString:self.firstButtonName])
        {
            if ([self.outputUnit.text isEqualToString:self.firstButtonName]) //KG
            {
                self.outputLabel.text = [NSString stringWithFormat:@"%f", self.kgToKg];
                self.infoBarLabel.text = [NSString stringWithFormat:@""];
            }
            
            if ([self.outputUnit.text isEqualToString:self.secondButtonName]) //LB
            {
                self.outputLabel.text = [NSString stringWithFormat:@"%f", self.kgToLb];
                self.infoBarLabel.text = [NSString stringWithFormat:@"= [%.2f] x 0.45359237",[self.inputTextField.text floatValue]];
            }
            if ([self.outputUnit.text isEqualToString:self.thirdButtonName]) //OZ
            {
                self.outputLabel.text = [NSString stringWithFormat:@"%f", self.kgToOz];
                self.infoBarLabel.text = [NSString stringWithFormat:@""];
            }
            if ([self.outputUnit.text isEqualToString:self.forthButtonName]) //GRAM
            {
                self.outputLabel.text = [NSString stringWithFormat:@"%f", self.kgToGram];
                self.infoBarLabel.text = [NSString stringWithFormat:@""];
            }
        }
        //INPUT UNIT = LB
        if ([self.inputUnit.text isEqualToString:self.secondButtonName])
        {
            if ([self.outputUnit.text isEqualToString:self.firstButtonName]) //KG
            {
                self.outputLabel.text = [NSString stringWithFormat:@"%f", self.lbToKg];
                self.infoBarLabel.text = [NSString stringWithFormat:@""];
            }
                
            if ([self.outputUnit.text isEqualToString:self.secondButtonName]) //LB
            {
                self.outputLabel.text = [NSString stringWithFormat:@"%f", self.lbToLb];
                self.infoBarLabel.text = [NSString stringWithFormat:@""];
            }
            if ([self.outputUnit.text isEqualToString:self.thirdButtonName]) //OZ
            {
                self.outputLabel.text = [NSString stringWithFormat:@"%f", self.lbToOz];
                self.infoBarLabel.text = [NSString stringWithFormat:@""];
            }
            if ([self.outputUnit.text isEqualToString:self.forthButtonName]) //GRAM
            {
                self.outputLabel.text = [NSString stringWithFormat:@"%f", self.lbToGram];
                self.infoBarLabel.text = [NSString stringWithFormat:@""];
            }
   
        }
        //INPUT UNIT = OZ
        if ([self.inputUnit.text isEqualToString:self.thirdButtonName])
        {
            if ([self.outputUnit.text isEqualToString:self.firstButtonName]) //KG
            {
                self.outputLabel.text = [NSString stringWithFormat:@"%f", self.ozToKg];
                self.infoBarLabel.text = [NSString stringWithFormat:@""];
            }
            
            if ([self.outputUnit.text isEqualToString:self.secondButtonName]) //LB
            {
                self.outputLabel.text = [NSString stringWithFormat:@"%f", self.ozToLb];
                self.infoBarLabel.text = [NSString stringWithFormat:@""];
            }
            if ([self.outputUnit.text isEqualToString:self.thirdButtonName]) //OZ
            {
                self.outputLabel.text = [NSString stringWithFormat:@"%f", self.ozToOz];
                self.infoBarLabel.text = [NSString stringWithFormat:@""];
            }
            if ([self.outputUnit.text isEqualToString:self.forthButtonName]) //GRAM
            {
                self.outputLabel.text = [NSString stringWithFormat:@"%f", self.ozToGram];
                self.infoBarLabel.text = [NSString stringWithFormat:@""];
            }
            
        }
        //INPUT UNIT = G
        if ([self.inputUnit.text isEqualToString:self.forthButtonName])
        {
            if ([self.outputUnit.text isEqualToString:self.firstButtonName]) //KG
            {
                self.outputLabel.text = [NSString stringWithFormat:@"%f", self.gramToKg];
                self.infoBarLabel.text = [NSString stringWithFormat:@""];
            }
            
            if ([self.outputUnit.text isEqualToString:self.secondButtonName]) //LB
            {
                self.outputLabel.text = [NSString stringWithFormat:@"%f", self.gramToLb];
                self.infoBarLabel.text = [NSString stringWithFormat:@""];
            }
            if ([self.outputUnit.text isEqualToString:self.thirdButtonName]) //OZ
            {
                self.outputLabel.text = [NSString stringWithFormat:@"%f", self.gramToOz];
                self.infoBarLabel.text = [NSString stringWithFormat:@""];
            }
            if ([self.outputUnit.text isEqualToString:self.forthButtonName]) //GRAM
            {
                self.outputLabel.text = [NSString stringWithFormat:@"%f", self.gramToGram];
                self.infoBarLabel.text = [NSString stringWithFormat:@""];
            }
            
        }

    }
    
    if (self.currentPoint == 1)
    {
        self.kg = logic.unit1ButtonLogic;
        self.lb = logic.unit2ButtonLogic;
        self.oz = logic.unit3ButtonLogic;
        self.gram = logic.unit4ButtonLogic;
        
        
        
    }
    
    if (self.currentPoint == 2)
    {
        self.cToC = 1 * [self.inputTextField.text floatValue];
        self.cToF = (1.8*[self.inputTextField.text floatValue]+32);
        self.cToK = 273.15 + [self.inputTextField.text floatValue];
        
        self.fToC = ([self.inputTextField.text floatValue]-32) * (5/9);
        self.fToF = 1 * [self.inputTextField.text floatValue];
        self.fToK = ((0.55555556)*([self.inputTextField.text floatValue]-32)) + 273.15;
        
        self.kToC = -273.15 + [self.inputTextField.text floatValue];
        self.kToF;
        self.kToK = 1 * [self.inputTextField.text floatValue];
        
        //C
        if ([self.inputUnit.text isEqualToString:self.secondButtonName])
        {
            if ([self.outputUnit.text isEqualToString:self.secondButtonName]) //C
            {
                self.outputLabel.text = [NSString stringWithFormat:@"%f", self.cToC];
                self.infoBarLabel.text = [NSString stringWithFormat:@""];
            }
            
            if ([self.outputUnit.text isEqualToString:self.thirdButtonName]) //F
            {
                self.outputLabel.text = [NSString stringWithFormat:@"%f", self.cToF];
                self.infoBarLabel.text = [NSString stringWithFormat:@""];
            }
            if ([self.outputUnit.text isEqualToString:self.sixthButtonName]) //K
            {
                self.outputLabel.text = [NSString stringWithFormat:@"%f", self.cToK];
                self.infoBarLabel.text = [NSString stringWithFormat:@""];
            }
        }
       //F
        if ([self.inputUnit.text isEqualToString:self.thirdButtonName])
        {
            if ([self.outputUnit.text isEqualToString:self.secondButtonName]) //C
            {
                self.outputLabel.text = [NSString stringWithFormat:@"%f", self.fToC];
                self.infoBarLabel.text = [NSString stringWithFormat:@""];
            }
            
            if ([self.outputUnit.text isEqualToString:self.thirdButtonName]) //F
            {
                self.outputLabel.text = [NSString stringWithFormat:@"%f", self.fToF];
                self.infoBarLabel.text = [NSString stringWithFormat:@""];
            }
            if ([self.outputUnit.text isEqualToString:self.sixthButtonName]) //K
            {
                self.outputLabel.text = [NSString stringWithFormat:@"%f", self.fToK];
                self.infoBarLabel.text = [NSString stringWithFormat:@""];
            }
        }
        
        //K
        if ([self.inputUnit.text isEqualToString:self.sixthButtonName])
        {
            if ([self.outputUnit.text isEqualToString:self.secondButtonName]) //C
            {
                self.outputLabel.text = [NSString stringWithFormat:@"%f", self.kToC];
                self.infoBarLabel.text = [NSString stringWithFormat:@""];
            }
            
            if ([self.outputUnit.text isEqualToString:self.thirdButtonName]) //F
            {
                self.outputLabel.text = [NSString stringWithFormat:@"%f", self.kToF];
                self.infoBarLabel.text = [NSString stringWithFormat:@""];
            }
            if ([self.outputUnit.text isEqualToString:self.sixthButtonName]) //K
            {
                self.outputLabel.text = [NSString stringWithFormat:@"%f", self.kToK];
                self.infoBarLabel.text = [NSString stringWithFormat:@""];
            }
        }
        

        
        
    }
    
    if (self.currentPoint == 3)
    {
        
        self.daysToDays = (1 * [self.inputTextField.text floatValue]);
        self.daysToWeeks = ([self.inputTextField.text floatValue]/7);
        self.daysToMonths = ([self.inputTextField.text floatValue]/30);
        self.daysToYears = ([self.inputTextField.text floatValue]/360);
        
        self.weeksToDays = ([self.inputTextField.text floatValue] *7);
        self.weeksToWeeks = (1 * [self.inputTextField.text floatValue]);
        self.weeksToMonths = ([self.inputTextField.text floatValue]/4);
        self.weeksToYears = ([self.inputTextField.text floatValue]/(51.4285714));
        
        self.monthsToDays = ([self.inputTextField.text floatValue]*30);
        self.monthsToWeeks = ([self.inputTextField.text floatValue]*4);
        self.monthsToMonths = 1*[self.inputTextField.text floatValue];
        self.monthsToYears = ([self.inputTextField.text floatValue]/12);
        
        self.yearsToDays = ([self.inputTextField.text floatValue]*360);
        self.yearsToWeeks = ([self.inputTextField.text floatValue]*(51.4285714));
        self.yearsToMonths = ([self.inputTextField.text floatValue]*12);
        self.yearsToYears = 1*[self.inputTextField.text floatValue];
        
        
        //Days
        if ([self.inputUnit.text isEqualToString:self.firstButtonName])
        {
            if ([self.outputUnit.text isEqualToString:self.firstButtonName]) //Days
            {
                self.outputLabel.text = [NSString stringWithFormat:@"%f", self.daysToDays];
                self.infoBarLabel.text = [NSString stringWithFormat:@""];
            }
            
            if ([self.outputUnit.text isEqualToString:self.secondButtonName]) //Weeks
            {
                self.outputLabel.text = [NSString stringWithFormat:@"%f", self.daysToWeeks];
                self.infoBarLabel.text = [NSString stringWithFormat:@""];
            }
            if ([self.outputUnit.text isEqualToString:self.thirdButtonName]) //Months
            {
                self.outputLabel.text = [NSString stringWithFormat:@"%f", self.daysToMonths];
                self.infoBarLabel.text = [NSString stringWithFormat:@""];
            }
            if ([self.outputUnit.text isEqualToString:self.forthButtonName]) //Years
            {
                self.outputLabel.text = [NSString stringWithFormat:@"%f", self.daysToYears];
                self.infoBarLabel.text = [NSString stringWithFormat:@""];
            }
        }
        //Weeks
        if ([self.inputUnit.text isEqualToString:self.secondButtonName])
        {
            if ([self.outputUnit.text isEqualToString:self.firstButtonName]) //Days
            {
                self.outputLabel.text = [NSString stringWithFormat:@"%f", self.weeksToDays];
                self.infoBarLabel.text = [NSString stringWithFormat:@""];
            }
            
            if ([self.outputUnit.text isEqualToString:self.secondButtonName]) //Weeks
            {
                self.outputLabel.text = [NSString stringWithFormat:@"%f", self.weeksToWeeks];
                self.infoBarLabel.text = [NSString stringWithFormat:@""];
            }
            if ([self.outputUnit.text isEqualToString:self.thirdButtonName]) //Months
            {
                self.outputLabel.text = [NSString stringWithFormat:@"%f", self.weeksToMonths];
                self.infoBarLabel.text = [NSString stringWithFormat:@""];
            }
            if ([self.outputUnit.text isEqualToString:self.forthButtonName]) //Years
            {
                self.outputLabel.text = [NSString stringWithFormat:@"%f", self.weeksToYears];
                self.infoBarLabel.text = [NSString stringWithFormat:@""];
            }
        }
        //Months
        if ([self.inputUnit.text isEqualToString:self.thirdButtonName])
        {
            if ([self.outputUnit.text isEqualToString:self.firstButtonName]) //Days
            {
                self.outputLabel.text = [NSString stringWithFormat:@"%f", self.monthsToDays];
                self.infoBarLabel.text = [NSString stringWithFormat:@""];
            }
            
            if ([self.outputUnit.text isEqualToString:self.secondButtonName]) //Weeks
            {
                self.outputLabel.text = [NSString stringWithFormat:@"%f", self.monthsToWeeks];
                self.infoBarLabel.text = [NSString stringWithFormat:@""];
            }
            if ([self.outputUnit.text isEqualToString:self.thirdButtonName]) //Months
            {
                self.outputLabel.text = [NSString stringWithFormat:@"%f", self.monthsToMonths];
                self.infoBarLabel.text = [NSString stringWithFormat:@""];
            }
            if ([self.outputUnit.text isEqualToString:self.forthButtonName]) //Years
            {
                self.outputLabel.text = [NSString stringWithFormat:@"%f", self.monthsToYears];
                self.infoBarLabel.text = [NSString stringWithFormat:@""];
            }
        }
        //Years
        if ([self.inputUnit.text isEqualToString:self.forthButtonName])
        {
            if ([self.outputUnit.text isEqualToString:self.firstButtonName]) //Days
            {
                self.outputLabel.text = [NSString stringWithFormat:@"%f", self.yearsToDays];
                self.infoBarLabel.text = [NSString stringWithFormat:@""];
            }
            
            if ([self.outputUnit.text isEqualToString:self.secondButtonName]) //Weeks
            {
                self.outputLabel.text = [NSString stringWithFormat:@"%f", self.yearsToWeeks];
                self.infoBarLabel.text = [NSString stringWithFormat:@""];
            }
            if ([self.outputUnit.text isEqualToString:self.thirdButtonName]) //Months
            {
                self.outputLabel.text = [NSString stringWithFormat:@"%f", self.yearsToMonths];
                self.infoBarLabel.text = [NSString stringWithFormat:@""];
            }
            if ([self.outputUnit.text isEqualToString:self.forthButtonName]) //Years
            {
                self.outputLabel.text = [NSString stringWithFormat:@"%f", self.yearsToYears];
                self.infoBarLabel.text = [NSString stringWithFormat:@""];
            }
        }

        

        
        
        
        
    
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)decimalButton:(UIButton *)sender
{
    if ([self.inputTextField.text rangeOfString:@"."].location == NSNotFound)
    {
    if ([self.inputTextField.text isEqual: @""])
        {
        self.inputTextField.text = [NSString stringWithFormat:@"0."];
        }
    else
        {
        self.inputTextField.text = [NSString stringWithFormat:@"%@.", self.inputTextField.text];
        }
    }
}

- (IBAction)backspaceButton:(UIButton *)sender
{
    int inputTextFieldLength = [self.inputTextField.text length];
    if (inputTextFieldLength != 0) {
        NSString *string = [self.inputTextField text];
        int length = [string length];
        NSString *backspace = [string substringToIndex:length-1];
        [self.inputTextField setText:backspace];
    }
    else
    {}
}


- (IBAction)zeroButton:(UIButton *)sender
{
    if ([self.inputTextField.text isEqualToString:@"0"])
    {}
    else
    {
    self.inputTextField.text = [NSString stringWithFormat:@"%@0", self.inputTextField.text];
    }
}

- (IBAction)oneButton:(UIButton *)sender
{
    if (![self.inputTextField.text isEqualToString:@"0"]) {
        self.inputTextField.text = [NSString stringWithFormat:@"%@1", self.inputTextField.text];
    }
    else
    {
        self.inputTextField.text = [NSString stringWithFormat:@"1"];
    }
}

- (IBAction)twoButton:(UIButton *)sender
{
    if (![self.inputTextField.text isEqualToString:@"0"]) {
        self.inputTextField.text = [NSString stringWithFormat:@"%@2", self.inputTextField.text];
    }
    else
    {
        self.inputTextField.text = [NSString stringWithFormat:@"2"];
    }}

- (IBAction)clearButton:(UIButton *)sender
{
        self.inputTextField.text = @"";
        self.inputUnit.text = @"";
        self.outputLabel.text = @"";
        self.outputUnit.text = @"";
        self.infoBarLabel.text = @"";
}

- (IBAction)threeButton:(UIButton *)sender
{
    if (![self.inputTextField.text isEqualToString:@"0"]) {
        self.inputTextField.text = [NSString stringWithFormat:@"%@3", self.inputTextField.text];
    }
    else
    {
        self.inputTextField.text = [NSString stringWithFormat:@"3"];
    }}

- (IBAction)fourButton:(UIButton *)sender
{
    if (![self.inputTextField.text isEqualToString:@"0"]) {
        self.inputTextField.text = [NSString stringWithFormat:@"%@4", self.inputTextField.text];
    }
    else
    {
        self.inputTextField.text = [NSString stringWithFormat:@"4"];
    }}

- (IBAction)fiveButton:(UIButton *)sender
{
    if (![self.inputTextField.text isEqualToString:@"0"]) {
        self.inputTextField.text = [NSString stringWithFormat:@"%@5", self.inputTextField.text];
    }
    else
    {
        self.inputTextField.text = [NSString stringWithFormat:@"5"];
    }}

- (IBAction)sixButton:(UIButton *)sender
{
    if (![self.inputTextField.text isEqualToString:@"0"]) {
        self.inputTextField.text = [NSString stringWithFormat:@"%@6", self.inputTextField.text];
    }
    else
    {
        self.inputTextField.text = [NSString stringWithFormat:@"6"];
    }}

- (IBAction)sevenButton:(UIButton *)sender
{
    if (![self.inputTextField.text isEqualToString:@"0"]) {
        self.inputTextField.text = [NSString stringWithFormat:@"%@7", self.inputTextField.text];
    }
    else
    {
        self.inputTextField.text = [NSString stringWithFormat:@"7"];
    }}

- (IBAction)eightButton:(UIButton *)sender
{
    if (![self.inputTextField.text isEqualToString:@"0"]) {
        self.inputTextField.text = [NSString stringWithFormat:@"%@8", self.inputTextField.text];
    }
    else
    {
        self.inputTextField.text = [NSString stringWithFormat:@"8"];
    }}

- (IBAction)nineButton:(UIButton *)sender
{
    if (![self.inputTextField.text isEqualToString:@"0"]) {
        self.inputTextField.text = [NSString stringWithFormat:@"%@9", self.inputTextField.text];
    }
    else
    {
        self.inputTextField.text = [NSString stringWithFormat:@"9"];
    }}

- (IBAction)convertButton:(UIButton *)sender

{

    if (![self.inputTextField.text isEqualToString:@""])
    {
    [self updateLogic];
    }
        else {}


}

- (IBAction)backButton:(UIButton *)sender
{
    self.massButton.hidden = NO;
    self.lengthButton.hidden = NO;
    self.tempButton.hidden = NO;
    self.calanderButton.hidden = NO;
    self.unit1Button.hidden = YES;
    self.unit2Button.hidden = YES;
    self.unit3Button.hidden = YES;
    self.unit4Button.hidden = YES;
    self.unit5Button.hidden = YES;
    self.unit6Button.hidden = YES;
    self.backButton.hidden = YES;
    self.inputTextField.text = @"";
    self.inputUnit.text = @"";
    self.outputLabel.text = @"";
    self.outputUnit.text = @"";
    self.infoBarLabel.text = @"";
    
    //self.consoleView.backgroundColor=[UIColor clearColor];

    //self.infoBarLabel.backgroundColor = [UIColor clearColor];

    
    
    
}

- (IBAction)unit1Button:(UIButton *)sender
{
    if (self.currentPoint == 0 || self.currentPoint == 1 || self.currentPoint == 3) {
        if ([self.inputUnit.text isEqual:@""])
        {
            self.inputUnit.text = [NSString stringWithFormat:@"%@", self.firstButtonName];
        }
        else
        {
            if ([self.outputUnit.text isEqual:@""]) {
                self.outputUnit.text = [NSString stringWithFormat:@"%@", self.firstButtonName];
            }
            else {}
        }

    }
    
    // ADD - To Temp
    else if (self.currentPoint == 2)
    {

        if ([self.inputTextField.text rangeOfString:@"-"].location == NSNotFound)
        {
            self.inputTextField.text = [NSString stringWithFormat:@"-%@", self.inputTextField.text];
        }
        else {}
        
    }
    
}

- (IBAction)unit2Button:(UIButton *)sender
{
    if ([self.inputUnit.text isEqual:@""])
    {
        self.inputUnit.text = [NSString stringWithFormat:@"%@", self.secondButtonName];
    }
    else
    {
        if ([self.outputUnit.text isEqual:@""]) {
            self.outputUnit.text = [NSString stringWithFormat:@"%@", self.secondButtonName];
        }
        else {}
    }
    

}

- (IBAction)unit3Button:(UIButton *)sender
{
    if ([self.inputUnit.text isEqual:@""])
    {
        self.inputUnit.text = [NSString stringWithFormat:@"%@", self.thirdButtonName];
    }
    else
    {
        if ([self.outputUnit.text isEqual:@""]) {
            self.outputUnit.text = [NSString stringWithFormat:@"%@", self.thirdButtonName];
        }
        else {}
    }
    

}

- (IBAction)unit4Button:(UIButton *)sender
{
    if ([self.inputUnit.text isEqual:@""])
    {
        self.inputUnit.text = [NSString stringWithFormat:@"%@", self.forthButtonName];
    }
    else
    {
        if ([self.outputUnit.text isEqual:@""]) {
        self.outputUnit.text = [NSString stringWithFormat:@"%@", self.forthButtonName];
        }
        else {}
    }
    
}

- (IBAction)unit5Button:(UIButton *)sender
{
    
}

- (IBAction)unit6Button:(UIButton *)sender
{
    if ([self.inputUnit.text isEqual:@""])
    {
        self.inputUnit.text = [NSString stringWithFormat:@"%@", self.sixthButtonName];
    }
    else
    {
        if ([self.outputUnit.text isEqual:@""]) {
            self.outputUnit.text = [NSString stringWithFormat:@"%@", self.sixthButtonName];
        }
        else {}
    }
    
}


- (IBAction)massButton:(UIButton *)sender
{
    self.currentPoint = 0;
    self.inputTextField.text = @"";
    self.inputUnit.text = @"";
    self.outputLabel.text = @"";
    self.outputUnit.text = @"";
    self.infoBarLabel.text = @"";
    [self updateTypes];
    self.backButton.hidden = NO;
    self.massButton.hidden = YES;
    self.lengthButton.hidden = YES;
    self.tempButton.hidden = YES;
    self.calanderButton.hidden = YES;
    

    //self.consoleView.backgroundColor=[UIColor colorWithRed:0.41 green:0.8 blue:1 alpha:1];

    self.unit1Button.hidden = NO;
    CGRect unit1Button = self.unit1Button.frame;
    unit1Button.origin.x = 214;
    unit1Button.origin.y = 151;
    self.unit1Button.frame = unit1Button;
    self.unit1ButtonSize.constant = 106;

    
    self.unit2Button.hidden = NO;
    CGRect unit2Button = self.unit2Button.frame;
    unit2Button.origin.x = 106;
    unit2Button.origin.y = 151;
    self.unit2Button.frame = unit2Button;
    
    self.unit3Button.hidden = NO;
    CGRect unit3Button = self.unit3Button.frame;
    unit3Button.origin.x = 0;
    unit3Button.origin.y = 151;
    self.unit3Button.frame = unit3Button;
    
    self.unit4Button.hidden = NO;
    CGRect unit4Button = self.unit4Button.frame;
    unit4Button.origin.x = 0;
    unit4Button.origin.y = 221;
    self.unit4Button.frame = unit4Button;
    
    self.unit5Button.hidden = NO;
    CGRect unit5Button = self.unit5Button.frame;
    unit5Button.origin.x = 214;
    unit5Button.origin.y = 221;
    self.unit5Button.frame = unit5Button;
    
    self.unit6Button.hidden = NO;
    CGRect unit6Button = self.unit6Button.frame;
    unit6Button.origin.x = 106;
    unit6Button.origin.y = 221;
    self.unit6Button.frame = unit6Button;
    
    
    //self.infoBarLabel.backgroundColor = [UIColor whiteColor];

    

    
    
}

- (IBAction)lengthButton:(UIButton *)sender
{
    self.currentPoint = 1;
    self.inputTextField.text = @"";
    self.inputUnit.text = @"";
    self.outputLabel.text = @"";
    self.outputUnit.text = @"";
    self.infoBarLabel.text = @"";
    [self updateTypes];
    self.backButton.hidden = NO;
    self.massButton.hidden = YES;
    self.lengthButton.hidden = YES;
    self.tempButton.hidden = YES;
    self.calanderButton.hidden = YES;
    
    //self.infoBarLabel.backgroundColor = [UIColor whiteColor];
    
    self.unit1Button.hidden = NO;
    CGRect unit1Button = self.unit1Button.frame;
    unit1Button.origin.x = 214;
    unit1Button.origin.y = 151;
    self.unit1Button.frame = unit1Button;
    self.unit1ButtonSize.constant = 106;
    
    
    self.unit2Button.hidden = NO;
    CGRect unit2Button = self.unit2Button.frame;
    unit2Button.origin.x = 106;
    unit2Button.origin.y = 151;
    self.unit2Button.frame = unit2Button;
    
    self.unit3Button.hidden = NO;
    CGRect unit3Button = self.unit3Button.frame;
    unit3Button.origin.x = 0;
    unit3Button.origin.y = 151;
    self.unit3Button.frame = unit3Button;
    
    self.unit4Button.hidden = NO;
    CGRect unit4Button = self.unit4Button.frame;
    unit4Button.origin.x = 0;
    unit4Button.origin.y = 221;
    self.unit4Button.frame = unit4Button;
    
    self.unit5Button.hidden = NO;
    CGRect unit5Button = self.unit5Button.frame;
    unit5Button.origin.x = 214;
    unit5Button.origin.y = 221;
    self.unit5Button.frame = unit5Button;
    
    self.unit6Button.hidden = NO;
    CGRect unit6Button = self.unit6Button.frame;
    unit6Button.origin.x = 106;
    unit6Button.origin.y = 221;
    self.unit6Button.frame = unit6Button;


}

- (IBAction)tempButton:(UIButton *)sender
{
    self.currentPoint = 2;
    self.inputTextField.text = @"";
    self.inputUnit.text = @"";
    self.outputLabel.text = @"";
    self.outputUnit.text = @"";
    self.infoBarLabel.text = @"";
    [self updateTypes];
    self.backButton.hidden = NO;
    self.massButton.hidden = YES;
    self.lengthButton.hidden = YES;
    self.tempButton.hidden = YES;
    self.calanderButton.hidden = YES;
    
    
    //self.infoBarLabel.backgroundColor = [UIColor whiteColor];
    
    self.unit1Button.hidden = NO;
    CGRect unit1Button = self.unit1Button.frame;
    unit1Button.origin.x = 214;
    unit1Button.origin.y = 151;
    self.unit1Button.frame = unit1Button;
    self.unit1ButtonSize.constant = 106;
    
    
    self.unit2Button.hidden = NO;
    CGRect unit2Button = self.unit2Button.frame;
    unit2Button.origin.x = 106;
    unit2Button.origin.y = 151;
    self.unit2Button.frame = unit2Button;
    
    self.unit3Button.hidden = NO;
    CGRect unit3Button = self.unit3Button.frame;
    unit3Button.origin.x = 0;
    unit3Button.origin.y = 151;
    self.unit3Button.frame = unit3Button;
    
    self.unit4Button.hidden = NO;
    CGRect unit4Button = self.unit4Button.frame;
    unit4Button.origin.x = 0;
    unit4Button.origin.y = 221;
    self.unit4Button.frame = unit4Button;
    
    self.unit5Button.hidden = NO;
    CGRect unit5Button = self.unit5Button.frame;
    unit5Button.origin.x = 214;
    unit5Button.origin.y = 221;
    self.unit5Button.frame = unit5Button;
    
    self.unit6Button.hidden = NO;
    CGRect unit6Button = self.unit6Button.frame;
    unit6Button.origin.x = 106;
    unit6Button.origin.y = 221;
    self.unit6Button.frame = unit6Button;
    


}

- (IBAction)calanderButton:(UIButton *)sender
{
    self.currentPoint = 3;
    self.inputTextField.text = @"";
    self.inputUnit.text = @"";
    self.outputLabel.text = @"";
    self.outputUnit.text = @"";
    self.infoBarLabel.text = @"";
    [self updateTypes];
    self.backButton.hidden = NO;
    self.massButton.hidden = YES;
    self.lengthButton.hidden = YES;
    self.tempButton.hidden = YES;
    self.calanderButton.hidden = YES;
    
    //self.consoleView.backgroundColor=[UIColor colorWithRed:1 green:1 blue:0 alpha:1];
    
    //self.infoBarLabel.backgroundColor = [UIColor whiteColor];
    
    self.unit1Button.hidden = NO;
    CGRect unit1Button = self.unit1Button.frame;
    unit1Button.origin.x = 214;
    unit1Button.origin.y = 151;
    self.unit1Button.frame = unit1Button;
    self.unit1ButtonSize.constant = 106;
    
    
    self.unit2Button.hidden = NO;
    CGRect unit2Button = self.unit2Button.frame;
    unit2Button.origin.x = 106;
    unit2Button.origin.y = 151;
    self.unit2Button.frame = unit2Button;
    
    self.unit3Button.hidden = NO;
    CGRect unit3Button = self.unit3Button.frame;
    unit3Button.origin.x = 0;
    unit3Button.origin.y = 151;
    self.unit3Button.frame = unit3Button;
    
    self.unit4Button.hidden = NO;
    CGRect unit4Button = self.unit4Button.frame;
    unit4Button.origin.x = 0;
    unit4Button.origin.y = 221;
    self.unit4Button.frame = unit4Button;
    
    self.unit5Button.hidden = NO;
    CGRect unit5Button = self.unit5Button.frame;
    unit5Button.origin.x = 214;
    unit5Button.origin.y = 221;
    self.unit5Button.frame = unit5Button;
    
    self.unit6Button.hidden = NO;
    CGRect unit6Button = self.unit6Button.frame;
    unit6Button.origin.x = 106;
    unit6Button.origin.y = 221;
    self.unit6Button.frame = unit6Button;
    


}


@end
