//
//  ViewController.m
//  RegisterPractice1202
//
//  Created by PiHan Hsu on 2014/12/2.
//  Copyright (c) 2014年 PiHan Hsu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate, UIGestureRecognizerDelegate, UIPickerViewDataSource, UIPickerViewDelegate>
{
    // ToolBar
    UIToolbar   *keyboardDoneButtonView;
    
    UITextField *email;
    UITextField *user_password;
    UITextField *user_confirm;
    
    UITextField *first_name;
    UITextField *last_name;
    UITextField *gender;
    
    NSArray *genderData;
    
    // Pickers
    UIPickerView *genderPicker;
    UIDatePicker *birthdayPicker;
    
    UITextField *birthday;
    UITextField *tel_1;
    UITextField *tel_2;
    UITextField *address;
 
}


@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //customize the title view put in navigation bar
    UIView *navView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 60)];
    UIImageView * imgviw =[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 150, 35)];
    imgviw.image = [UIImage imageNamed:@"alphacamp"];
    imgviw.backgroundColor = [UIColor clearColor];
    imgviw.center = navView.center;
    
    [navView addSubview:imgviw];
    self.navigationItem.titleView =navView;
    
    email =[[UITextField alloc]initWithFrame:CGRectMake(130, 0, 180, 40)];
    email.placeholder =@"會員登入帳號";
    email.textColor =[UIColor lightGrayColor];
    email.delegate =self;
    email.textAlignment = NSTextAlignmentRight;
    email.font =[UIFont systemFontOfSize:13];
    email.tag=101;
    email.keyboardType = UIKeyboardTypeEmailAddress;
    email.autocapitalizationType = UITextAutocapitalizationTypeNone;

    user_password =[[UITextField alloc]initWithFrame:CGRectMake(130, 0, 180, 40)];
    user_password.placeholder =@"6-12位數字,不含標點符號";
    user_password.textColor =[UIColor lightGrayColor];
    user_password.delegate =self;
    user_password.textAlignment = NSTextAlignmentRight;
    [user_password setSecureTextEntry:YES];
    user_password.font =[UIFont systemFontOfSize:13];
    user_password.tag=102;

    user_confirm =[[UITextField alloc]initWithFrame:CGRectMake(130, 0, 180, 40)];
    user_confirm.placeholder =@"再次輸入同樣密碼";
    user_confirm.textColor =[UIColor lightGrayColor];
    user_confirm.delegate =self;
    user_confirm.textAlignment = NSTextAlignmentRight;
    [user_confirm setSecureTextEntry:YES];
    user_confirm.font =[UIFont systemFontOfSize:13];
    user_confirm.tag=103;
    
    first_name =[[UITextField alloc]initWithFrame:CGRectMake(130, 0, 180, 40)];
    first_name.textColor =[UIColor lightGrayColor];
    first_name.delegate =self;
    first_name.textAlignment = NSTextAlignmentRight;
    first_name.font =[UIFont systemFontOfSize:13];
    first_name.tag=104;
    
    last_name =[[UITextField alloc]initWithFrame:CGRectMake(130, 0, 180, 40)];
    last_name.textColor =[UIColor lightGrayColor];
    last_name.delegate =self;
    last_name.textAlignment = NSTextAlignmentRight;
    last_name.font =[UIFont systemFontOfSize:13];
    last_name.tag=105;
    
    gender =[[UITextField alloc]initWithFrame:CGRectMake(130, 0, 160, 40)];
    gender.textColor =[UIColor lightGrayColor];
    gender.delegate =self;
    gender.textAlignment = NSTextAlignmentRight;
    gender.font =[UIFont systemFontOfSize:13];
    gender.tag=106;
    
    genderData =@[@"選擇", @"男", @"女"];
    
    birthday =[[UITextField alloc]initWithFrame:CGRectMake(130, 0, 180, 40)];
    birthday.textColor =[UIColor lightGrayColor];
    birthday.delegate =self;
    birthday.textAlignment = NSTextAlignmentRight;
    birthday.font =[UIFont systemFontOfSize:13];
    birthday.tag=107;

    tel_1=[[UITextField alloc]initWithFrame:CGRectMake(130, 0, 180, 40)];
    tel_1.placeholder =@"驗證碼將寄送至此";
    tel_1.textColor =[UIColor lightGrayColor];
    tel_1.delegate =self;
    tel_1.textAlignment = NSTextAlignmentRight;
    tel_1.font =[UIFont systemFontOfSize:13];
    tel_1.tag=108;

    tel_2 =[[UITextField alloc]initWithFrame:CGRectMake(130, 0, 180, 40)];
    tel_2.textColor =[UIColor lightGrayColor];
    tel_2.delegate =self;
    tel_2.textAlignment = NSTextAlignmentRight;
    tel_2.font =[UIFont systemFontOfSize:13];
    tel_2.tag=109;
    
    tel_2.keyboardType =UIKeyboardTypePhonePad;

    
    address =[[UITextField alloc]initWithFrame:CGRectMake(130, 0, 180, 40)];
    address.textColor =[UIColor lightGrayColor];
    address.delegate =self;
    address.textAlignment = NSTextAlignmentRight;
    address.font =[UIFont systemFontOfSize:13];
    address.tag=110;

    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hideKeyboard)];
    [gestureRecognizer setDelegate:self];
    [self.view addGestureRecognizer:gestureRecognizer];
    
    [self registerForKeyboardNotification];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma tableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30.0;
}


//欄位高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40.0;
}
//要顯示幾個欄位
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ((section == 0) || (section ==2)) {
        return 3;
        
    }else
    {
        return 4;
    }
    
}


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UILabel *headerLabel = [[UILabel alloc]init];
    
    headerLabel.frame = CGRectMake(0, 0, 300, 35.0);
    headerLabel.textColor =[ UIColor grayColor];
    headerLabel.font = [UIFont systemFontOfSize:12.0f];
    
    if (section ==0)
         headerLabel.text = @"    設定帳號密碼（紅色圖示為必填欄位）";
    else if (section ==1)
        headerLabel.text =  @"    基本資料";
    else if (section ==2)
        headerLabel.text =  @"    聯絡資訊";
    
    return headerLabel;
    
}

-(CGFloat) tableView:(UITableView *)tableView estimatedHeightForFooterInSection:(NSInteger)section
{
    // 把section 2 以下多的空白切掉
    if (section ==2)
        return 200.0f;
    else
        return 0.0f;
}

-(UIView *) tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if(section ==2){
        UIView *footerView =[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 120)];
        UIButton *addcharity = [UIButton buttonWithType:UIButtonTypeCustom];
        [addcharity setTitle:@"下一步" forState:UIControlStateNormal];
        [addcharity addTarget:self action:@selector(goNext) forControlEvents:UIControlEventTouchUpInside];
        [addcharity setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        addcharity.frame = CGRectMake(14, 20, 292, 40);
        addcharity.backgroundColor = [UIColor greenColor];
        
        [addcharity.layer setCornerRadius:5.0f];
        [footerView addSubview:addcharity];
        return footerView;
    }else
        return nil;
    
}

-(void)goNext
{
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *requestIdentifier = @"LoginCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:requestIdentifier];
    
    if (!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:requestIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleGray;
        cell.textLabel.font = [UIFont fontWithName:@"STHeitiSC-Medium" size:14.0];
        cell.detailTextLabel.font =[UIFont fontWithName:@"STHeitiSC-Medium" size:14.0];
        cell.accessoryType =UITableViewCellAccessoryNone;
        cell.textLabel.textAlignment= NSTextAlignmentLeft;
        cell.textLabel.textColor =[UIColor colorWithRed:121/255.0 green:121/255.0 blue:121/255.0 alpha:1];
        cell.backgroundColor = [UIColor whiteColor];
        cell.selectionStyle =UITableViewCellSelectionStyleNone;
        
    }
    
    switch (indexPath.section) {
        case 0: {
            switch (indexPath.row) {
                case 0:
                    cell.imageView.image = [UIImage imageNamed:@"img_info_account"];
                    cell.textLabel.text = @"Email";
                    [cell.contentView addSubview:email];
                    break;
                case 1:
                    cell.imageView.image = [UIImage imageNamed:@"img_info_password"];
                    cell.textLabel.text = @"密碼";
                    [cell.contentView addSubview:user_password];
                    break;
                case 2:
                    cell.imageView.image = [UIImage imageNamed:@"img_info_password"];
                    cell.textLabel.text = @"確認密碼";
                    [cell.contentView addSubview:user_confirm];
                    break;
                default:
                    break;
            }
            
            break;
        }
            
        case 1: {
            switch (indexPath.row) {
                case 0:
                    cell.imageView.image = [UIImage imageNamed:@"img_info_name"];
                    cell.textLabel.text = @"中文姓";
                    [cell.contentView addSubview:last_name];
                    break;
                case 1:
                    cell.imageView.image = [UIImage imageNamed:@"img_info_name"];
                    cell.textLabel.text = @"中文名";
                    [cell.contentView addSubview:first_name];
                    break;
                case 2:
                    cell.imageView.image = [UIImage imageNamed:@"img_info_gender"];
                    cell.textLabel.text = @"性別";
                    [cell.contentView addSubview:gender];
                    gender.placeholder = @"請選擇";
                    
                    cell.accessoryView = [[ UIImageView alloc ] initWithImage:[UIImage imageNamed:@"img_moreoption"]];
                    [cell.accessoryView setFrame:CGRectMake(0, 0, 20, 40)];
                    
                    break;
                case 3: {
                    cell.imageView.image = [UIImage imageNamed:@"img_info _birth"];
                    cell.textLabel.text = @"出生日期";
                    [cell.contentView addSubview:birthday];
                    
                    cell.accessoryView = [[ UIImageView alloc ] initWithImage:[UIImage imageNamed:@"img_moreoption"]];
                    [cell.accessoryView setFrame:CGRectMake(0, 0, 20, 40)];
                    
                    break;
                }
                    
                default:
                    break;
            }
            
            break;
        }
            
        case 2: {
            switch (indexPath.row) {
                case 0:
                    cell.imageView.image = [UIImage imageNamed:@"img_info_phone1"];
                    cell.textLabel.text = @"手機號碼";
                    [cell.contentView addSubview:tel_1];
                    break;
                case 1:
                    cell.imageView.image = [UIImage imageNamed:@"img_info_phone2"];
                    cell.textLabel.text = @"聯絡電話(次)";
                    [cell.contentView addSubview:tel_2];
                    break;
                case 2:
                    cell.imageView.image = [UIImage imageNamed:@"img_info_address"];
                    cell.textLabel.text = @"聯絡地址";
                    [cell.contentView addSubview:address];
                    break;
                    
                default:
                    break;
            }
            
            break;
        }
    }

    
    return cell;
}


- (BOOL)textFieldShouldBeginEditing:(UITextField*)textField
{
    NSIndexPath *indexPath;
    
    if (textField.tag == 106) { //first textField tag
        
        indexPath = [NSIndexPath indexPathForRow:2 inSection:1];
        
        UIPickerView *pickerView = [[UIPickerView alloc] init];
        pickerView.tag = 106;
        
        [pickerView sizeToFit];
        
        pickerView.delegate = self;
        pickerView.dataSource = self;
        
        pickerView.showsSelectionIndicator = YES;
        
        
        //
        textField.inputView = pickerView;
        textField.inputAccessoryView = [self createAccessoryView:@"性別"];
        
        NSInteger index = -1;
        
        if ([gender.text isEqualToString:@""]) {
            index = 0;
        }
        else {
            index = [genderData indexOfObject:gender.text];
        }
        
        [pickerView selectRow:index inComponent:0 animated:YES];
    }
    
    if (textField.tag == 107) {
        indexPath = [NSIndexPath indexPathForRow:3 inSection:1];
        
        birthdayPicker = [[UIDatePicker alloc]init];
        birthdayPicker.tag = 107;
        
        NSLocale *datelocale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_TW"];
        birthdayPicker.locale = datelocale;
        
        //        birthdayPicker.timeZone = [NSTimeZone timeZoneWithName:@"GMT"];
        
        birthdayPicker.datePickerMode = UIDatePickerModeDate;
        
        NSDateFormatter *df = [[NSDateFormatter alloc] init];
        [df setDateFormat:@"yyyy/MM/dd"];
        
        NSDate *myDate;
        
        if ([birthday.text isEqualToString:@""]) {
            NSInteger given_year = [self getYear] - 30;
            NSString *birthdate = [NSString stringWithFormat:@"%04d/%02d/%02d", given_year, 1, 1];
            myDate = [df dateFromString: birthdate];
        }
        else {
            myDate = [df dateFromString: birthday.text];
        }
        
        [birthdayPicker setDate:myDate];
        
        textField.inputView = birthdayPicker;
        textField.inputAccessoryView = [self createAccessoryView:@"出生日期"];
        
        [birthdayPicker addTarget:self action:@selector(dataSelect:) forControlEvents:UIControlEventValueChanged];
    }
    
    return YES;
}
// Number of components.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// Total rows in our component.
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    switch (pickerView.tag) {
        case 106: {
            return [genderData count];
            break;
        }
            
        default:
            return 0;
            break;
    }
}

// Display each row's data.
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    switch (pickerView.tag) {
        case 106: {
            return [genderData objectAtIndex: row];
            
            break;
        }
            
        default:
            return nil;
            break;
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    switch (pickerView.tag) {
        case 106: {
            NSLog(@"You selected this: %@", [genderData objectAtIndex: row]);
            gender.text = [genderData objectAtIndex: row];
            
            break;
        }
            
        default:
            break;
    }
}

- (void)dataSelect:(id)sender
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    NSLocale *datelocale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_TW"];
    NSString *dateFormat = [NSDateFormatter dateFormatFromTemplate:@"yyyy/MM/dd" options:0 locale:datelocale];
    
    [formatter setDateFormat:dateFormat];
    [formatter setLocale:datelocale];
    
    birthday.text = [NSString stringWithFormat:@"%@",[formatter stringFromDate:birthdayPicker.date]];
}

-(NSInteger)getYear
{
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents * components = [gregorian components:NSYearCalendarUnit fromDate:[NSDate date]];
                                     
    NSInteger year = [components year];
    
    return year;
}



- (UIToolbar *)createAccessoryView:(NSString *)labelTitle
{
    if (keyboardDoneButtonView == nil) {
        keyboardDoneButtonView = [[UIToolbar alloc] init];
        keyboardDoneButtonView.barTintColor     = [UIColor colorWithRed:150.0/255.0 green:195.0/255.0 blue:35.0/255.0 alpha:0.5];
        keyboardDoneButtonView.barStyle = UIBarStyleBlack;
        keyboardDoneButtonView.translucent = YES;
        keyboardDoneButtonView.tintColor = [UIColor whiteColor];
        [keyboardDoneButtonView sizeToFit];
    }
    
    UIButton *a1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [a1 setTitle:labelTitle forState:UIControlStateNormal];
    [a1 setFrame:CGRectMake(0.0f, 0.0f, 160.0f, 40.0f)];
    a1.tintColor = [UIColor whiteColor];
    a1.userInteractionEnabled = YES;
    a1.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    a1.titleLabel.font = [UIFont systemFontOfSize:14];
    
    UIBarButtonItem *title = [[UIBarButtonItem alloc] initWithCustomView:a1];
    UIBarButtonItem *spacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    UIBarButtonItem* doneButton = [[UIBarButtonItem alloc] initWithTitle:@"確定"
                                                                   style:UIBarButtonItemStyleBordered target:self
                                                                  action:@selector(doneClicked)];
    
    [doneButton setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys: [UIColor whiteColor],  NSForegroundColorAttributeName, [UIFont systemFontOfSize:14], NSFontAttributeName, nil] forState:UIControlStateNormal];
    
    [keyboardDoneButtonView setItems:[NSArray arrayWithObjects:title, spacer, spacer, doneButton, nil]];
    return keyboardDoneButtonView;
}

-(void) registerForKeyboardNotification
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow: ) name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillBeHidden: ) name:UIKeyboardWillHideNotification object:nil];
}

//-(void)keyboardWasShown:(NSNotification*)aNotification
//{
//    
//    NSDictionary * info = [aNotification userInfo];
//    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
//    
//    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height, 0.0);
//    self.tableView.contentInset = contentInsets;
//    self.tableView.scrollIndicatorInsets = contentInsets;
//    
//}

-(void)keyboardWillShow: (NSNotification*) sender
{
    
    CGSize kbSize = [[[sender userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    NSTimeInterval duration = [[[sender userInfo] objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    [UIView animateWithDuration:duration animations:^{
        UIEdgeInsets edgeInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height, 0.0);
        [self.tableView setContentInset:edgeInsets];
        [self.tableView setScrollIndicatorInsets:edgeInsets];
    }];

}



-(void)keyboardWillBeHidden: (NSNotification*)aNotification
{
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    self.tableView.contentInset = contentInsets;
    self.tableView.scrollIndicatorInsets = contentInsets;
    
    
    
}

    
-(void) hideKeyboard
{
    [self.view endEditing:YES];
    
}

@end
