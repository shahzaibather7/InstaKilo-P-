//
//  CustomCollectionViewController.m
//  InstaKilo (P)
//
//  Created by Mohammad Shahzaib Ather on 2017-08-09.
//  Copyright © 2017 Mohammad Shahzaib Ather. All rights reserved.
//

#import "CollectionReusableView.h"
#import "CustomCollectionViewCell.h"
#import "CustomCollectionViewController.h"

@interface CustomCollectionViewController ()

@property (nonatomic ,strong) NSArray <UIImage*>* imageArray;
@property (nonatomic ,strong) NSArray <UIImage*>* imageArray2;
@property (nonatomic ,strong) NSArray *pictureGroupArray;
@property (weak, nonatomic) IBOutlet UISegmentedControl *toggle;
@property (nonatomic ,strong) NSArray <UIImage*>* imageArrayVan;

@property (nonatomic ,strong) NSArray <UIImage*>* imageArrayTor;

@property (nonatomic ,strong) NSArray <UIImage*>* imageArrayDubai;
@property (nonatomic ,strong) NSArray <UILabel*>* locationLabels;
@property (nonatomic ,strong) NSArray *pictureGroupLocationArray;

@end

@implementation CustomCollectionViewController

//static NSString * const reuseIdentifier = @"cellidentifier";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes

    
    self.imageArray = @[
                          [UIImage imageNamed:@"86"],
                          [UIImage imageNamed:@"aventador"],
                          [UIImage imageNamed:@"benzo"],
                          [UIImage imageNamed:@"bull"],
                          [UIImage imageNamed:@"bull2"],
                          [UIImage imageNamed:@"silvia"],
                          [UIImage imageNamed:@"toyota"],
                          [UIImage imageNamed:@"wagon"],
                          ];
    
    self.imageArray2 = @[
                        [UIImage imageNamed:@"1"],
                        [UIImage imageNamed:@"2"],
                        [UIImage imageNamed:@"3"],
                        [UIImage imageNamed:@"4"],
                        ];

    
    
    
    
    self.pictureGroupArray = @[
                                   self.imageArray ,
                                   self.imageArray2
                                   ];

    
    self.imageArrayVan = @[
                           [UIImage imageNamed:@"silvia"],
                           [UIImage imageNamed:@"toyota"],
                           [UIImage imageNamed:@"86"],
                           [UIImage imageNamed:@"3"],
                           [UIImage imageNamed:@"4"],

                           ];
    
    self.imageArrayDubai =@[

                            [UIImage imageNamed:@"bull"],
                            [UIImage imageNamed:@"bull2"],
                            [UIImage imageNamed:@"silvia"],
                            [UIImage imageNamed:@"wagon"],
                            [UIImage imageNamed:@"2"],

                            ];
    
    self.imageArrayTor = @[
                            [UIImage imageNamed:@"aventador"],
                            [UIImage imageNamed:@"1"],
                            [UIImage imageNamed:@"benzo"]

                                   ];
    UILabel *vanLabel =  [[UILabel alloc] init];
    vanLabel.text = @"Vancouver";
    UILabel *dubLabel =  [[UILabel alloc] init];
    dubLabel.text = @"Dubai";
    UILabel *torLabel =  [[UILabel alloc] init];
    torLabel.text = @"Toronto";
    
    self.locationLabels = @[
                            vanLabel ,
                            dubLabel ,
                            torLabel
                            ];
    
    self.pictureGroupLocationArray = @[
                                       self.imageArrayVan,
                                       self.imageArrayDubai,
                                       self.imageArrayTor
                                       ];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}







/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    if (self.toggle.selectedSegmentIndex == 0){
    return self.pictureGroupArray.count;
    } else if (self.toggle.selectedSegmentIndex == 1){
    return self.pictureGroupLocationArray.count;
    } else return 0;
}


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of items
    if (self.toggle.selectedSegmentIndex == 0){
        if (section== 0) {
            return self.imageArray.count;
        } else{
            return self.imageArray2.count;
        }
    }
    else if (self.toggle.selectedSegmentIndex == 1){
        if (section== 0) {
            return self.imageArray.count;
        } else{
            return self.imageArray2.count;
        }
    } else return 0;

}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellidentifier" forIndexPath:indexPath];
    if (self.toggle.selectedSegmentIndex == 0) {
        if (indexPath.section == 0){
        cell.imageView.image = self.imageArray[indexPath.row];
        cell.labelNum.text = [NSString stringWithFormat:@"Car :%ld",(long)indexPath.row];
        }else {
        cell.imageView.image = self.imageArray2[indexPath.row];
        cell.labelNum.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
             }
    }
    else if (self.toggle.selectedSegmentIndex == 0){
        if (indexPath.section == 0){
            cell.imageView.image = self.imageArrayVan[indexPath.row];
            cell.labelNum.text = [NSString stringWithFormat:@"Vancouver :%ld",(long)indexPath.row];
            
        }else if (indexPath.section == 1){
            cell.imageView.image = self.imageArrayDubai[indexPath.row];
            cell.labelNum.text = [NSString stringWithFormat:@"Dubai: %ld",(long)indexPath.row];
        } else {
            cell.imageView.image = self.imageArrayTor[indexPath.row];
            cell.labelNum.text = [NSString stringWithFormat:@"Toronto: %ld",(long)indexPath.row];
        }
            
            
    }
    return cell;
}



- (IBAction)valueChanged:(id)sender {
    [self.collectionView reloadData];
    
   
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionReusableView *reusableview = nil;
    
    
    
    
    if (kind == UICollectionElementKindSectionHeader) {
        CollectionReusableView *headerView = [self.collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerID" forIndexPath:indexPath];
        
        
        
        
        
        if (self.toggle.selectedSegmentIndex == 0) {
          
            headerView.sectionLabel.text = @"General";
        }
        
        if (self.toggle.selectedSegmentIndex == 1){
         
            if (indexPath.section ==0) {
        headerView.sectionLabel.text = @"Vancouver";
            }
            else if (indexPath.section ==1) {
                headerView.sectionLabel.text =@"Dubai";
            }else if (indexPath.section ==2){
                headerView.sectionLabel.text =@"Toronto";
            }
            else {
                headerView.sectionLabel.text = nil;
            }
        }
        
        
        reusableview = headerView;
    }
    
    
    
    return reusableview;
    
    
    
    
    
 }


#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
