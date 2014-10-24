//
//  AddDogViewController.m
//  Assessment4
//
//  Created by Vik Denic on 8/11/14.
//  Copyright (c) 2014 MobileMakers. All rights reserved.
//

#import "AddDogViewController.h"

@interface AddDogViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *breedTextField;
@property (weak, nonatomic) IBOutlet UITextField *colorTextField;

@end

@implementation AddDogViewController

//TODO: UPDATE CODE ACCORIDNGLY

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Add Dog";
}

-(Dog *)addDog;
{
    Dog *dog = [NSEntityDescription insertNewObjectForEntityForName:@"Dog" inManagedObjectContext:self.owner.managedObjectContext];
    dog.name = self.nameTextField.text;
    dog.color = self.colorTextField.text;
    dog.breed = self.breedTextField.text;
    return dog;
}

- (IBAction)onPressedUpdateDog:(UIButton *)sender
{

    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
