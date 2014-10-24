//
//  DogsViewController.m
//  Assessment4
//
//  Created by Vik Denic on 8/11/14.
//  Copyright (c) 2014 MobileMakers. All rights reserved.
//

#import "DogsViewController.h"
#import "Dog.h"
#import "AddDogViewController.h"


@interface DogsViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *dogsTableView;

@property NSArray *dogs;

@end

@implementation DogsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Dogs";
    [self loadDogs];
}

-(void)loadDogs
{
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Dog"];
    request.sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES]];
    self.dogs = [self.owner.managedObjectContext executeFetchRequest:request error:nil];
    [self.dogsTableView reloadData];
}

-(IBAction)unwindFromAddDogViewController:(UIStoryboardSegue *)segue
{
    AddDogViewController *viewController = segue.sourceViewController;
    Dog *dog = [viewController addDog];
    [viewController.owner addDogObject:dog];

    [self.owner.managedObjectContext save:nil];
    [self loadDogs];
}


#pragma mark - UITableView Delegate Methods

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //TODO: UPDATE THIS ACCORDINGLY
    return self.dogs.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Dog *dog = [self.dogs objectAtIndex:indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"dogCell"];

    cell.textLabel.text = dog.name;
    cell.detailTextLabel.text = dog.breed;
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString: @"AddDogSegue"])
    {
        Owner *owner = self.owner;
        AddDogViewController *viewController = segue.destinationViewController;
        viewController.owner = owner;
    }
    else
    {

    }
}

@end
