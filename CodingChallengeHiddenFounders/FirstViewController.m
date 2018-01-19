//
//  FirstViewController.m
//  CodingChallengeHiddenFounders
//
//  Created by cmoissam on 18/01/2018.
//  Copyright © 2018 rmi. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.repositoriesTableView.delegate = self;
    self.repositoriesTableView.dataSource = self;
    self.repositoriesTableView.rowHeight = UITableViewAutomaticDimension;
    self.repositoriesTableView.estimatedRowHeight = 140.0;
    self.repositoriesTableView.contentInset = UIEdgeInsetsZero;
    self.automaticallyAdjustsScrollViewInsets = NO;
    [NOTIFICATION addObserver:self selector:@selector(getRepositoriesDidSuccessNotification:) name:GetRepoSuccessNotification object:nil];
    
    // Do any additional setup after loading the view from its nib.
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITabBarItem *)tabBarItem
{
    UITabBarItem *baritem =[[UITabBarItem alloc] initWithTitle:@"Repositories" image:[UIImage imageNamed:@"star.png"] tag:0];
    return baritem;
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.page = [NSNumber numberWithInt:0];
    self.fromPagin = NO;
    self.SettingsView.hidden = YES;
    [self.segmentControl setSelectedSegmentIndex:0];
    self.count = 0;
    [[RepositoriesService shared] getAllRepos:self.page];
    [self.repositoriesTableView scrollRectToVisible:CGRectMake(0, 0, 1, 1) animated:YES];
    
}
-(void)getRepositoriesDidSuccessNotification:(NSNotification*)notification{
    
    self.repositoriesTableView.showsPullToRefresh = NO;
    [self.repositoriesTableView.pullToRefreshView stopAnimating];
    self.count = self.count + 30;
    if (!self.fromPagin) {
        self.repositories= [[ NSMutableArray<Repository *> alloc] init];
    }
    [self.repositories addObjectsFromArray:[RepositoryStore shared].repositories];
    self.fromPagin = NO;
    [self.repositoriesTableView reloadData];
    
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.repositories count];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 0;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 0;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"RepositoryCell" owner:self options:nil];
    RepositoryCell  *cell = [nib objectAtIndex:0];
    
    Repository *repository;
    
    repository = [self.repositories objectAtIndex:indexPath.row] ;
    if (indexPath.row == self.count - 1 && self.count == self.repositories.count)
    {
        [tableView addPullToRefreshWithActionHandler:^{} position:SVPullToRefreshPositionBottom];
        tableView.showsPullToRefresh = YES;
        [tableView.pullToRefreshView startAnimating];
        self.page=[NSNumber numberWithInt:(self.count/30)+1];
        [[RepositoriesService shared] getAllRepos:self.page];
        self.fromPagin = YES;
    }
    
    int stars=[repository.stargazers_count intValue];
    if(stars<1000)
    {
        cell.stars.text=[NSString stringWithFormat:@"%d",stars];
    }
    else{
        cell.stars.text=[NSString stringWithFormat:@"%.2fk",(double)stars/1000];
    }

    
    [cell.UserImage sd_setImageWithURL:[NSURL URLWithString:repository.owner.avatar_url] placeholderImage:[UIImage imageNamed:@"default_user.png"]];
    cell.repoName.text = repository.name;
    cell.repoDescription.text = repository.rep_description;
    cell.UserName.text = repository.owner.login;
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (IBAction)segmentAction:(id)sender {
    if(self.segmentControl.selectedSegmentIndex == 0){
        
        self.SettingsView.hidden = YES;
    } else{
        
        self.SettingsView.hidden = NO;
    }

}
@end
