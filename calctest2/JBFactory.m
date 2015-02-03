//
//  JBFactory.m
//  calctest2
//
//  Created by Jassim on 6/16/14.
//
//

#import "JBFactory.h"
#import "JBType.h"


@implementation JBFactory

// 5 4 1 metric
// 2 3 6 US

-(NSArray *)types
{
    JBType *mass = [[JBType alloc]init];
    mass.unit1ButtonName = @"kg";
    mass.unit1ButtonLogic = 1;
    mass.unit2ButtonName = @"lb";
    mass.unit2ButtonLogic = 0.45359237;
    mass.unit3ButtonName = @"oz";
    mass.unit3ButtonLogic = (0.45359237/16);
    mass.unit4ButtonName = @"g";
    mass.unit4ButtonLogic = (mass.unit1ButtonLogic*1000);
    mass.unit5ButtonName =@"mg";
    mass.unit5ButtonLogic = (1/100000);
    mass.unit6ButtonName =@"abc";
    mass.unit6ButtonLogic;

    // 5 4 1 metric
    // 2 3 6 US

    
    JBType *length = [[JBType alloc]init];
    length.unit1ButtonName = @"m";
    length.unit1ButtonLogic = 1;
    length.unit2ButtonName = @"foot";
    length.unit2ButtonLogic;
    length.unit3ButtonName = @"yard";
    length.unit3ButtonLogic;
    length.unit4ButtonName = @"cm";
    length.unit4ButtonLogic = (1/100);
    length.unit5ButtonName = @"mm";
    length.unit5ButtonLogic = (1/1000);
    length.unit6ButtonName = @"mile";
    length.unit6ButtonLogic;

    // 5 4 1 metric
    // 2 3 6 US
    
    JBType *temp = [[JBType alloc]init];
    temp.unit1ButtonName = @"+/-";
    temp.unit1ButtonLogic;
    temp.unit2ButtonName = @"C";
    temp.unit2ButtonLogic;
    temp.unit3ButtonName = @"F";
    temp.unit3ButtonLogic;
    temp.unit4ButtonName = @"";
    temp.unit5ButtonName = @"";
    temp.unit5ButtonLogic;
    temp.unit6ButtonName = @"K";
    temp.unit6ButtonLogic;

    
    JBType *calander = [[JBType alloc]init];
    calander.unit1ButtonName = @"days";
    calander.unit2ButtonName = @"weeks";
    calander.unit3ButtonName = @"months";
    calander.unit4ButtonName = @"years";
    calander.unit5ButtonName = @"";
    calander.unit6ButtonName = @"";
    
    
    NSMutableArray *myTypesArray = [[NSMutableArray alloc]init];
    [myTypesArray addObject:mass];
    [myTypesArray addObject:length];
    [myTypesArray addObject:temp];
    [myTypesArray addObject:calander];
    
    return myTypesArray;
}

@end
