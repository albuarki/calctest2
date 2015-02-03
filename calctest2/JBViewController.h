//
//  JBViewController.h
//  calctest2
//
//  Created by Jassim on 6/15/14.
//
//

#import <UIKit/UIKit.h>


@interface JBViewController : UIViewController



//Names
@property (nonatomic, strong) NSString *firstButtonName;
@property (nonatomic, strong) NSString *secondButtonName;
@property (nonatomic, strong) NSString *thirdButtonName;
@property (nonatomic, strong) NSString *forthButtonName;
@property (nonatomic, strong) NSString *fifthButtonName;
@property (nonatomic, strong) NSString *sixthButtonName;

@property (strong, nonatomic) IBOutlet UIView *consoleView;




//Mass
@property (nonatomic) float mg;
@property (nonatomic) float gram;
@property (nonatomic) float kg;
@property (nonatomic) float lb;
@property (nonatomic) float oz;
//KG TO >
@property (nonatomic) float kgToKg;
@property (nonatomic) float kgToLb;
@property (nonatomic) float kgToOz;
@property (nonatomic) float kgToMg;
@property (nonatomic) float kgToGram;
//LB TO >
@property (nonatomic) float lbToKg;
@property (nonatomic) float lbToLb;
@property (nonatomic) float lbToOz;
@property (nonatomic) float lbToMg;
@property (nonatomic) float lbToGram;
//OZ TO >
@property (nonatomic) float ozToLb;
@property (nonatomic) float ozToKg;
@property (nonatomic) float ozToMg;
@property (nonatomic) float ozToGram;
@property (nonatomic) float ozToOz;
// MG TO >
@property (nonatomic) float mgToGram;
@property (nonatomic) float mgToKg;
@property (nonatomic) float mgToLb;
@property (nonatomic) float mgToOz;
//GRAM TO >
@property (nonatomic) float gramToMg;
@property (nonatomic) float gramToKg;
@property (nonatomic) float gramToLb;
@property (nonatomic) float gramToOz;
@property (nonatomic) float gramToGram;



//Length
@property (nonatomic) float cm;
@property (nonatomic) float meter;
@property (nonatomic) float km;
@property (nonatomic) float foot;
@property (nonatomic) float yard;
@property (nonatomic) float mile;
//METER TO >
@property (nonatomic) float meterToCm;
@property (nonatomic) float meterToKm;
@property (nonatomic) float meterToFoot;
@property (nonatomic) float meterToYard;
@property (nonatomic) float meterToMile;
//FOOT TO >
@property (nonatomic) float footToCm;
@property (nonatomic) float footToKm;
@property (nonatomic) float footTometer;
@property (nonatomic) float footToYard;
@property (nonatomic) float footToMile;
//YARD TO >
@property (nonatomic) float yardToCm;
@property (nonatomic) float yardToKm;
@property (nonatomic) float yardTometer;
@property (nonatomic) float yardToFoot;
@property (nonatomic) float yardToMile;
//MILE TO >
@property (nonatomic) float mileToCm;
@property (nonatomic) float mileToKm;
@property (nonatomic) float mileToMeter;
@property (nonatomic) float mileToFoot;
@property (nonatomic) float mileToYard;
//CM TO >
@property (nonatomic) float cmToMeter;
@property (nonatomic) float cmToKm;
@property (nonatomic) float cmToFoot;
@property (nonatomic) float cmToYard;
@property (nonatomic) float cmToMile;
//KM TO >
@property (nonatomic) float kmToCm;
@property (nonatomic) float kmToMeter;
@property (nonatomic) float kmToFoot;
@property (nonatomic) float kmToYard;
@property (nonatomic) float kmToMile;



//Weather
@property (nonatomic) float celcius;
@property (nonatomic) float fahren;
@property (nonatomic) float kelvin;
//C TO >
@property (nonatomic) float cToC;
@property (nonatomic) float cToF;
@property (nonatomic) float cToK;
//F TO >
@property (nonatomic) float fToC;
@property (nonatomic) float fToF;
@property (nonatomic) float fToK;
//K TO >
@property (nonatomic) float kToC;
@property (nonatomic) float kToF;
@property (nonatomic) float kToK;

//Calander
@property (nonatomic) float days;
@property (nonatomic) float weeks;
@property (nonatomic) float months;
@property (nonatomic) float years;
//DAYS TO >
@property (nonatomic) float daysToWeeks;
@property (nonatomic) float daysToMonths;
@property (nonatomic) float daysToYears;
@property (nonatomic) float daysToDays;
//WEEKS TO >
@property (nonatomic) float weeksToDays;
@property (nonatomic) float weeksToMonths;
@property (nonatomic) float weeksToYears;
@property (nonatomic) float weeksToWeeks;
//MONTHS TO >
@property (nonatomic) float monthsToDays;
@property (nonatomic) float monthsToWeeks;
@property (nonatomic) float monthsToMonths;
@property (nonatomic) float monthsToYears;

//YEARS TO >
@property (nonatomic) float yearsToDays;
@property (nonatomic) float yearsToWeeks;
@property (nonatomic) float yearsToMonths;
@property (nonatomic) float yearsToYears;




@property (readwrite,strong, nonatomic) IBOutlet UITextField *inputTextField;
@property (strong, nonatomic) IBOutlet UILabel *inputUnit;
@property (strong, nonatomic) IBOutlet UILabel *outputLabel;
@property (strong, nonatomic) IBOutlet UILabel *outputUnit;
@property (strong, nonatomic) IBOutlet UILabel *infoBarLabel;
@property (strong, nonatomic) IBOutlet UIButton *backButton;

//Var
@property (nonatomic) int currentPoint;
@property (strong, nonatomic) NSArray *types;


//buttons
- (IBAction)decimalButton:(UIButton *)sender;
- (IBAction)backspaceButton:(UIButton *)sender;
- (IBAction)zeroButton:(UIButton *)sender;
- (IBAction)oneButton:(UIButton *)sender;
- (IBAction)twoButton:(UIButton *)sender;
- (IBAction)clearButton:(UIButton *)sender;
- (IBAction)threeButton:(UIButton *)sender;
- (IBAction)fourButton:(UIButton *)sender;
- (IBAction)fiveButton:(UIButton *)sender;
- (IBAction)sixButton:(UIButton *)sender;
- (IBAction)sevenButton:(UIButton *)sender;
- (IBAction)eightButton:(UIButton *)sender;
- (IBAction)nineButton:(UIButton *)sender;
- (IBAction)convertButton:(UIButton *)sender;
- (IBAction)backButton:(UIButton *)sender;


//types
- (IBAction)massButton:(UIButton *)sender;
- (IBAction)lengthButton:(UIButton *)sender;
- (IBAction)tempButton:(UIButton *)sender;
- (IBAction)calanderButton:(UIButton *)sender;


@property (strong, nonatomic) IBOutlet UIButton *massButton;
@property (strong, nonatomic) IBOutlet UIButton *tempButton;
@property (strong, nonatomic) IBOutlet UIButton *lengthButton;
@property (strong, nonatomic) IBOutlet UIButton *calanderButton;




//units
@property (strong, nonatomic) IBOutlet UIButton *unit1Button;
@property (strong, nonatomic) IBOutlet UIButton *unit2Button;
@property (strong, nonatomic) IBOutlet UIButton *unit3Button;
@property (strong, nonatomic) IBOutlet UIButton *unit4Button;
@property (strong, nonatomic) IBOutlet UIButton *unit5Button;
@property (strong, nonatomic) IBOutlet UIButton *unit6Button;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *unit1ButtonSize;



- (IBAction)unit1Button:(UIButton *)sender;
- (IBAction)unit2Button:(UIButton *)sender;
- (IBAction)unit3Button:(UIButton *)sender;
- (IBAction)unit4Button:(UIButton *)sender;
- (IBAction)unit5Button:(UIButton *)sender;
- (IBAction)unit6Button:(UIButton *)sender;





@end
