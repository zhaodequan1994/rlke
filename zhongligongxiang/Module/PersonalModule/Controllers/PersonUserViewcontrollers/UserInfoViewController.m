//
//  UserInfoViewController.m
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/27.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import "UserInfoViewController.h"

//View
#import "AgePickView.h"

//Cells
#import "UserInfoIconTableViewCell.h"
#import "UserInfoTableViewCell.h"

//Controllers
#import "UserNickNameAlterViewController.h"
#import "AuthenViewController.h"

@interface UserInfoViewController ()<UITableViewDelegate,UITableViewDataSource,UIImagePickerControllerDelegate,UINavigationControllerDelegate,infoUpdateDelegate>

@property (nonatomic,strong) UITableView * tableView;

@end

@implementation UserInfoViewController

-(UITableView *)tableView{
    
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 5, SCREEN_WIDTH, SCREEN_HEIGHT - 5) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = RGB(247, 247, 247);
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerNib:[UINib nibWithNibName:@"UserInfoIconTableViewCell" bundle:nil] forCellReuseIdentifier:@"UserInfoIconTableViewCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"UserInfoTableViewCell" bundle:nil] forCellReuseIdentifier:@"UserInfoTableViewCell"];
        
    }
    return _tableView;
}


-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    
}
-(void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initializeBaseNavigationAppearance];
    [self initializeAppearance];
    [self initializeDataSource];
    
}

-(void)initializeBaseNavigationAppearance{
    
    self.title = @"我的资料";
}

-(void)initializeAppearance{
    
    [self.view addSubview:self.tableView];
    
}

-(void)initializeDataSource{
    
    self.view.backgroundColor = RGB(247, 247, 247);
    
}

-(void)userInfoNetworkRequest:(NSDictionary *)parameter{
    
    WEAKSELF
    [PublicMethod networkRequestWithPath:PATH_MODIFYINFO Parameters:parameter sender:nil begin:^{
        
        [weakSelf startActivityView];
        
    } success:^(id  _Nonnull object) {
        
        [[PublicManager shareInstance].userObjectManager encodeUserModelObject:object[@"data"] superUserModel:self.userModel];
        
        [weakSelf.tableView reloadData];
        
        [weakSelf stopActivityView];
        
    } error:^(id  _Nonnull object) {
        
        [PublicMethod alertControllerViewWithTitle:object[@"msg"] sender:weakSelf];
        
        [weakSelf stopActivityView];
        
        
    } failure:^(id  _Nonnull object) {
        
        [PublicMethod alertControllerViewWithTitle:object[@"msg"] sender:weakSelf];
        
        [weakSelf stopActivityView];
        
    }];
}

#pragma mark  **********  tableView  delegate  ********

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 5;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 55;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        
        UserInfoIconTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"UserInfoIconTableViewCell" forIndexPath:indexPath];
        
        return cell;
    }
    
    UserInfoTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"UserInfoTableViewCell" forIndexPath:indexPath];
    
    [cell addIndex:indexPath.row withModel:self.userModel];
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == 0) {
        
        WEAKSELF
        
        UIAlertController * actionSheet = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
        
        UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
             [weakSelf openCamera];
        }];
        UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"从相册中选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
             [weakSelf openPhotoLibrary];
        }];
        UIAlertAction *action3 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }];
       
        //action 的颜色
        [action1 setValue:[UIColor blackColor] forKey:@"titleTextColor"];
        [action2 setValue:[UIColor blackColor] forKey:@"titleTextColor"];
        [action3 setValue:[UIColor redColor] forKey:@"titleTextColor"];

        
        [actionSheet addAction:action1];
        [actionSheet addAction:action2];
        [actionSheet addAction:action3];

        [self presentViewController:actionSheet animated:YES completion:nil];

    }else if (indexPath.row == 1){
        
        self.hidesBottomBarWhenPushed = YES;
        
        UserNickNameAlterViewController * unvc = [[UserNickNameAlterViewController alloc] init];
        
        unvc.delegate = self;
        
        [self.navigationController pushViewController:unvc animated:YES];
    }else if (indexPath.row == 2){
        
        WEAKSELF
        
        UIAlertController * actionSheet = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
        
        UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"男" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            NSDictionary * parameter = @{@"uid":weakSelf.userModel.userId,@"sex":[NSString stringWithFormat:@"%ld",(long)SexTypeMale]};
            
            [weakSelf userInfoNetworkRequest:parameter];
        }];
        UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"女" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            NSDictionary * parameter = @{@"uid":weakSelf.userModel.userId,@"sex":[NSString stringWithFormat:@"%ld",(long)SexTypeFemale]};

            [weakSelf userInfoNetworkRequest:parameter];

        }];
        UIAlertAction *action3 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        
        //action 的颜色
        [action1 setValue:[UIColor blackColor] forKey:@"titleTextColor"];
        [action2 setValue:[UIColor blackColor] forKey:@"titleTextColor"];
        [action3 setValue:[UIColor redColor] forKey:@"titleTextColor"];
        
        [actionSheet addAction:action1];
        [actionSheet addAction:action2];
        [actionSheet addAction:action3];
        
        [self presentViewController:actionSheet animated:YES completion:nil];

    }else if (indexPath.row == 3){
        
        [self getAgeSelectView];
        
    }else if (indexPath.row == 4){
        
        [self autherComfire];
    }
}

#pragma mark    ***********  picture   ************

-(void)openCamera{
    
    //判断是否可以打开相机，模拟器此功能无法使用
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        UIImagePickerController * picker = [[UIImagePickerController alloc]init];
        picker.delegate = self;
        picker.allowsEditing = YES;  //是否可编辑
        //摄像头
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        
        [self presentViewController:picker animated:YES completion:nil];
        
    }else{
        //如果没有提示用户
        [self informationMessage];
    }
}

-(void)openPhotoLibrary{
    
    //相册是可以用模拟器打开的
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        
        UIImagePickerController * picker = [[UIImagePickerController alloc]init];
        
        picker.delegate = self;
        
        picker.allowsEditing = YES;//是否可以编辑
        
        //打开相册选择照片
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        
        [self presentViewController:picker animated:YES completion:nil];
        
    }else{
        
        [self informationMessage];
    }
    
}

-(void)informationMessage{
    
    UIAlertController * arlet = [UIAlertController alertControllerWithTitle:@"错误" message:@"你没有摄像头" preferredStyle:UIAlertControllerStyleAlert];
    [arlet addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //点击确定的事件响应
    }]];
    
    [self presentViewController:arlet animated:YES completion:nil];
}

#pragma mark ********* imagePickerController   delegate  **********

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    WEAKSELF
    [picker dismissViewControllerAnimated:YES completion:^{
        
        //        NSString *const  UIImagePickerControllerMediaType ;指定用户选择的媒体类型（文章最后进行扩展）
        //        NSString *const  UIImagePickerControllerOriginalImage ;原始图片
        //        NSString *const  UIImagePickerControllerEditedImage ;修改后的图片
        //        NSString *const  UIImagePickerControllerCropRect ;裁剪尺寸
        //        NSString *const  UIImagePickerControllerMediaURL ;媒体的URL
        //        NSString *const  UIImagePickerControllerReferenceURL ;原件的URL
        //        NSString *const  UIImagePickerControllerMediaMetadata;当来数据来源是照相机的时候这个值才有效
        
    }];
}

#pragma mark ********* infoUpdateDelegate  **********

-(void)infoUpdateDelegate{
    
    [self.tableView reloadData];
}

#pragma mark   ---------  other  ---------

-(void)getAgeSelectView{
    
    AgePickView  * ageView = [[AgePickView alloc] init];
    ageView.dataSource = @[@"20",@"21",@"22",@"23",@"24",@"25"];
    ageView.pickerTitle = @"选择年龄";
    ageView.defaultStr = @"22/3";
    WEAKSELF
    ageView.valueDidSelect = ^(NSString * ageString){
        
        NSDictionary * parameter = @{@"uid":weakSelf.userModel.userId,@"age":ageString};
        
        [weakSelf userInfoNetworkRequest:parameter];

    };
    
    [ageView show];
}

-(void)autherComfire{
    
    if (self.userModel.is_real.integerValue == 1) {
        
        [PublicMethod alertControllerViewWithTitle:@"已认证" sender:self];
        
    }else{
        
        self.hidesBottomBarWhenPushed = YES;
        
        AuthenViewController * avc = [[AuthenViewController alloc] init];
        
        [self.navigationController pushViewController:avc animated:YES];
    }
}

#pragma mark   **********  event clcik ********

-(void)leftClick{
    
    [PublicMethod postNotificationName:MESSAGE_HOMEPAGE_UPDATEINFO object:nil];
    
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark   **********  dealloc ********

-(void)dealloc{
    
    [PublicMethod removeAllObserver:self];
}

@end
