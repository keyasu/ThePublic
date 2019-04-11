# 公司  iOS代码规范_V1.0
---
> 公司 iOS开发端代码规范_V1.0

---

## 目录

[TOC]

## Objective-C代码规范

☺☺☺
<mark>
<br>把布局放在了第一位感觉这个是最重要的，其他的规范感觉大家平时都已经注意了，所以放在了后面 <br>
</mark>
☺☺☺

>  规范的目的: 写代码是让别人看的吗不是让自己看的
>  
> 1. 不要过分追求技巧，降低程序的可读性。
> 2. 简洁的代码可以让bug无处藏身。要写出明显没有bug的代码，而不是没有明显bug的代码。


### 一、布局规范

#### 1、头文件引入

按照一定顺序引入头文件

```
// 系统库
#import <系统库>
// 三方库
#import <第三方>
// 项目类
#import "项目类"
// 混编使用(如果有)
#import "混编"
```

#### 2、属性 和 私有变量

`public` 和 非`public` 属性建议放在相应的地方 

```
@interface ClassA ()
// 这里是下面申请的说明
@property (nonatomic,strong) NSString *name;
@end

```

私有变量建议命名遵循其中一个，为了规避iOS的命名，特性个人推荐第二种方法命名私有变量

```
NSString *_title;
NSString *title_; 
```

#### 3、类内部布局

```
#pragma mark - lifeCycle (这部分写生命周期方法)

#pragma mark - <UITableViewDelegate> (系统的delegate方法)

#pragma mark - <CustomDelegate> (自定义的delegate方法)

#pragma mark - event response (交互方法)

#pragma mark - private methods (非公共方法)

#pragma mark - view getter(lazy)  (主要是View懒加载)

#pragma mark - view setter

#pragma mark - data getter

#pragma mark - data setter

```

这个根据具体类的情况去自己可以增删

对于`private methods` 和 `event response` 等等只是在本类中调用的方法建议以p_开头,以后修改的时候能了解修改会造成的影响范围

例如：

```
#pragma mark -private methods
- (void)p_didSelectQuestionItem:(NSDictionary *)questionItem

#pragma mark -event response 
- (void)p_searchEventClick:(UIButton *)button
```
#### 4、资源文件信息 (除非必须, 统一使用英文命名)
1. 如果是 APP 内图标的话, 统一 `.png` 格式图片
    * 图片的命名根据实际使用路径 如 `userCenter_settings_about.png` `home_msg.png` (中间下划线分开)

2. 如果需要使用到其他类型的图片, 统一在文件资源文件夹内(项目中文件夹内, 见后面图片)
    * 命名以实际用途命名, 能直接表示图片用途, 如 `guide.png`, `tap.mp3`

#### 5、关于第三方库规范

项目使用cocoapods统一管理开源第三库文件，不需要手动导入和手动添加依赖库。如果第三方不支持cocoapods，可手动导入工程。

```
1. 每个需要引入的三方的前面注释用途
2. 三方引用需要注意到使用到的版本问题  '~> 4.5'
```

```
source 'https://github.com/CocoaPods/Specs.git'

# platform :ios, '8.0'

target 'MeiRiDuo' do
  
  use_frameworks!

  # Pods for MeiRiDuo
  # 网络请求第三方库
  pod 'Alamofire', '~> 4.5'
  # 自动布局
  pod 'SnapKit'
  # 下拉刷新
  pod 'MJRefresh'
  # 等待加载
  pod 'MBProgressHUD'
  # 图片加载框架
  pod 'Kingfisher'
  # ali支付
  pod 'AlipaySDK-iOS'
  # 腾讯 bugly 统计 bug 等信息
  pod 'Bugly'

end
```

```
引入预编译文件规则:
1. 如果在项目中极少部分使用到, 比如 bugly 只在 AppDelegate 中调用, 而其他地方不需要的地方, 只在 APPDelegate 中调用就行
2. 如果在项目中使用的地方比较多(大于4、5 个的地方), 引入太多反而增大工作量, 就可以加入预编译文件(如 `SDWbImage` `Kingfisher` `MBProgressHUD`)
```

#### 6、示例(建议项目结构)
1. 项目整体目录
![项目整体目录.png](https://upload-images.jianshu.io/upload_images/2144883-9b85f1a18d3cc505.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

2. 具体文件目录
![具体文件目录.png](https://upload-images.jianshu.io/upload_images/2144883-26fc2a2991ddde39.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)



### 二、注释

> 添加必要的注释
> 
* 所有的`property` 需要给出注释；
>
* 所有自定义的方法需要给出注释；
>
* 比较大的代码块需要给出注释；
>
* 所有代码中出现的阿拉伯数字需要给出注释；
>
* 程序中出现加密／解密 逻辑的操作地方，需要给出注释说明过程（无论是系统还是自定义）。
>
* 遇到比较关键的代码块、跨文件的、重要逻辑点必须注释
>

#### 1、每个类头部有自己的独白 比如一个`viewController`是用来做什么的 可以首先写个注释说明下 其他的类雷同 

```
/**
 
 这是来描述该文件的内容的作用什么的,

 注意点： 这里实现了什么什么, 需要注意的是...
 
 设计思路：从 A-> B -> C
 
 改版问题: 出现什么问题需要更改为什么
 
 改版问题: 改版人->时间
 
 等等吧 你想说的告白都在这里
 
 */

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
   
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

@end
```
#### 2、单行，多行注释


单行注释 //+说明

```
 // 初始化默认数据
 [self p_setupDefaultData];
```
多行 /* */

```
/*!
 XXX的状态
 
 - XXXType_1: 孩子找妈妈中
 - XXXType_1: 孩子找爸爸中
 - XXXType_1: 孩子找小朋友中
 */
typedef NS_ENUM(NSUInteger,XXXType) {
    XXXType_1,
    XXXType_2,
    XXXType_3,
};
```

方法注释
Commond+option+/

```
/**
 向某人默认打招呼

 @param name 某人
 */
- (void)sayHelloToPeople:(NSString *)name{
    
}

```

`TODO标记`
`//TODO:XXX`
`用//TODO去做一些值得注意 或者 自己未完成的标志`

```
- (void)sayHelloToPeople:(NSString *)name{
   //TODO:向某人打招呼逻辑
}

```


###三、命名规范

#### 1、统一要求
含义清楚，尽量做到不需要注释也能了解其作用，若做不到，就加注释，使用全称，不使用缩写。
#### 2、类名
大驼峰式命名：每个单词的首字母都采用大写字母
例：`MFHomePageViewController`
#### 3、私有变量
私有变量放在 .m 文件中声明 
以 _ 开头，第一个单词首字母小写，后面的单词的首字母全部大写。 
例： `NSString *_somePrivateVariable`
#### 4、property变量
小驼峰式命名：第一个单词以小写字母开始，后面的单词的首字母全部大写 
属性的关键字推荐按照 原子性，读写，内存管理的顺序排列。
`Block`、`NSString`属性应该使用copy关键字
禁止使用synthesize关键词 
例：

```
typedef void (^ErrorCodeBlock) (id errorCode,NSString *message);

@property (nonatomic, readwrite, strong) UIView *headerView;    //注释

@property (nonatomic, readwrite, copy) ErrorCodeBlock errorBlock;   //将block拷贝到堆中
@property (nonatomic, readwrite, copy) NSString *userName;    
```

#### 5、宏和常量命名
* 对于宏定义的常量
    *  `#define `预处理定义的常量全部大写，单词间用 _ 分隔
    *  宏定义中如果包含表达式或变量，表达式或变量必须用小括号括起来。
* 对于类型常量
    * 对于局限于某编译单元(实现文件)的常量，以字符k开头，例如`kAnimationDuration`，且需要以`static` `const`修饰
    * 对于定义于类头文件的常量，外部可见，则以定义该常量所在类的类名开头，例如`EOCViewClassAnimationDuration`, 仿照苹果风格，在头文件中进行`extern`声明，在实现文件中定义其值

例：

```
//宏定义的常量
#define ANIMATION_DURATION    0.3
#define MY_MIN(A, B)  ((A)>(B)?(B):(A))
```


```//局部类型常量
static const NSTimeInterval kAnimationDuration = 0.3;

//外部可见类型常量
//EOCViewClass.h
extern const NSTimeInterval EOCViewClassAnimationDuration;
extern NSString *const EOCViewClassStringConstant;  //字符串类型

//EOCViewClass.m
const NSTimeInterval EOCViewClassAnimationDuration = 0.3;
NSString *const EOCViewClassStringConstant = @"EOCStringConstant";
```
#### 6、Enum
`Enum`类型的命名与类的命名规则一致
`Enum`中枚举内容的命名需要以该`Enum`类型名称开头
`NS_ENUM`定义通用枚举，`NS_OPTIONS`定义位移枚举 
例：

```
typedef NS_ENUM(NSInteger, UIViewAnimationTransition) {
    UIViewAnimationTransitionNone,
    UIViewAnimationTransitionFlipFromLeft,
    UIViewAnimationTransitionFlipFromRight,
    UIViewAnimationTransitionCurlUp,
    UIViewAnimationTransitionCurlDown,
};

typedef NS_OPTIONS(NSUInteger, UIControlState) {
    UIControlStateNormal       = 0,
    UIControlStateHighlighted  = 1 << 0,
    UIControlStateDisabled     = 1 << 1,
};
```


#### 7、Delegate
* 用
```delegate
```做后缀，如`<UIScrollViewDelegate>`
* 用`optional`修饰可以不实现的方法，用required修饰必须实现的方法
* 当你的委托的方法过多, 可以拆分数据部分和其他逻辑部分, 数据部分用`dataSource`做后缀. 如`<UITableViewDataSource>`
* 使用`did`和`will`通知`Delegate`已经发生的变化或将要发生的变化。
* 类的实例必须为回调方法的参数之一
    1. 回调方法的参数只有类自己的情况，方法名要符合实际含义
    2. 回调方法存在两个以上参数的情况，以类的名字开头，以表明此方法是属于哪个类的

    
例：

```
@protocol UITableViewDataSource<NSObject>

@required

//回调方法存在两个以上参数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;

@optional

//回调方法的参数只有类自己
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;              // Default is 1 if not implemented
@protocol UITableViewDelegate<NSObject, UIScrollViewDelegate>

@optional

//使用`did`和`will`通知`Delegate`
- (nullable NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath;
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
```
##### 8、方法
* 方法名用小驼峰式命名
* 方法名不要使用new作为前缀
* 不要使用and来连接属性参数，如果方法描述两种独立的行为，使用and来串接它们
* 方法实现时，如果参数过长，则令每个参数占用一行，以冒号对齐。
* 一般方法不使用前缀命名，私有方法可以使用统一的前缀来分组和辨识
方法名要与对应的参数名保持高度一致
* 表示对象行为的方法、执行性的方法应该以动词开头
* 返回性的方法应该以返回的内容开头，但之前不要加get，除非是间接返回一个或多个值。
* 可以使用情态动词(动词前面`can`、`should`、`will`等)进一步说明属性意思，但不要使用`do`或do``es,因为这些助动词没什么实际意义。也不要在动词前使用副词或形容词修饰 
例：

```
//不要使用 and 来连接属性参数
- (int)runModalForDirectory:(NSString *)path file:(NSString *)name types:(NSArray *)fileTypes;    //推荐
- (int)runModalForDirectory:(NSString *)path andFile:(NSString *)name andTypes:(NSArray *)fileTypes;    //反对

//表示对象行为的方法、执行性的方法
- (void)insertModel:(id)model atIndex:(NSUInteger)atIndex;
- (void)selectTabViewItem:(NSTableViewItem *)tableViewItem

//返回性的方法
- (instancetype)arrayWithArray:(NSArray *)array;

//参数过长的情况
- (void)longMethodWith:(NSString *)theFoo
                  rect:(CGRect)theRect
              interval:(CGFloat)theInterval
{
   //Implementation
}

//不要加get
- (NSSize) cellSize;  //推荐
- (NSSize) getCellSize;  //反对

//使用情态动词,不要使用do或does
- (BOOL)canHide;  //推荐
- (BOOL)shouldCloseDocument;  //推荐
- (BOOL)doesAcceptGlyphInfo;  //反对

```




### 四、一些缩进

#### 1、缩进

方法之间保留一行空行，

方法和属性的格式请按照以下格式书写:

```
- (nullable NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath;
```

```
- (void)viewDidLoad {
    [super viewDidLoad];
    
}
```

```
@property (nonatomic, strong, readonly, nullable) NSIndexPath *previouslyFocusedIndexPath; 

```

### 五、常见注意点：
- 尽量避免在程序中直接出现常数，使用超过一次的应以宏定义或枚举的形式来替代。

- 常数的宏定义应与它实际使用时的类型相一致。如以3.0来定义浮点类型，用3表示整型。常量的命名应当能够表达出它的用途，并且用大写字母表示。例如：`#definePI 3.1415926`

- 删除多余的空行、注释、方法以及未被使用的资源文件。

```
UIKIT_EXTERN NSNotificationName const UIKeyboardWillShowNotification;
```
```
UIKIT_EXTERN NSString *const UIKeyboardFrameBeginUserInfoKey
```
```
typedef NS_ENUM(NSInteger, NSWritingDirectionFormatType) {
    NSWritingDirectionEmbedding     = (0 << 1),
    NSWritingDirectionOverride      = (1 << 1)
}
```
```
typedef NSString * NSAttributedStringDocumentReadingOptionKey
```

---
---




## Swift 编程规范

> 良好的编程规范有利于项目的维护，同时也能避免因人为的疏忽产生的错误。本篇编码规范主要参考了 [swift-style-guide](https://github.com/raywenderlich/swift-style-guide/blob/master/README.markdown)和[The Swift Programming Language](https://developer.apple.com/library/prerelease/ios/documentation/swift/conceptual/swift_programming_language/index.html)当中的规范，并综合了实际开发中总结的经验。




### 正确性 (Correctness)

力争让你的代码没有编译警告(`warning`)。这个规则下延伸出了许多决定，如：使用`#selector`方式，而不是直接使用字符串。



### 命名 (Naming)

描述性和一致性的命名使得代码更易读、更易懂。一些规则如下：

* 追求调用方的清晰性
* 优先使用更清晰的命名，而不是更简洁的
* 使用驼峰样式
* 类型、协议名首字母大写，其他的都首字母小写
* 包含所有需要的单词，省略不必要的
* 使用基于角色的命名，而不是基于类型的
* 工厂方法使用`make`开头
* 对方法的命名
	* 动词方法以`-ed`结尾，对于不可变的(`non-mutating`)动词方法用`-ing`结尾
	* 布尔类型(`boolean`)应该以`is`开头
	* 用于描述事物的协议(`protocols`)名称，用名词命名
	* 用于描述能力的协议(`protocols`)名称，应以`-able` 或 `-ible`结尾
* 不要用生僻的单词
* 通常不要用缩写
* 选用好的参数名来起到描述的作用

#### 类前缀 (`Class Prefixes`)

`Swift`中的类型自动使用了其所在的模块(`module`)作为命名空间(`namespace`)，所以你不必给类型加前缀。如果来自不同模块的类型名子冲突，可以显示的使用模块名作为调用前缀来避免冲突。

```swift
import SomeModule
import OtherModule

let someUsefulClass = SomeModule.UsefulClass()
let otherUsefulClass = OtherModule.UsefulClass()
```

#### 代理 (`Delegates`)

当定义一个代理方法时，第一个匿名参数应该是代理的源对象。(`UIKit`中有许多这样的的例子)

**推荐：**

```swift
func namePickerView(_ namePickerView: NamePickerView, didSelectName name: String)
func namePickerViewShouldReload(_ namePickerView: NamePickerView) -> Bool
```

**不推荐：**

```swift
/// `namePicker`应该是匿名的
func didSelectName(namePicker: NamePickerViewController, name: String)

/// 至少应包含`_ namePickerView: NamePickerView`参数，来作为代理的源对象
func namePickerShouldReload() -> Bool
```

#### 使用可类型推导的上下文 (`Use Type Inferred Context`)

利用好编译器的类型推导特性，来写出简短、清晰的代码。

**推荐：**

```swift
let selector = #selector(viewDidLoad)
view.backgroundColor = .red
let toView = context.view(forKey: .to)
let view = UIView(frame: .zero)
```

**不推荐：**

```swift
// 以下几种写法，都没有用到编译器的类型推导特性，写出来的代码较冗余
let selector = #selector(ViewController.viewDidLoad)
view.backgroundColor = UIColor.red
let toView = context.view(forKey: UITransitionContextViewKey.to)
let view = UIView(frame: CGRect.zero)
```

#### 泛型 (`Generics`)

泛型参数(`generic type parameters`)应当使用具有描述性的驼峰样式来命名。当泛型参数不具有明确的关系或角色时，可使用一个大写的字母表示即可。如：`T`，`U`，`V`

#### 使用的语言 (`Language`)

应使用美式英语的拼写方式以匹配`Apple`的`API`，应尽量保持命名的可读性，不应该用多含义且有相反或者混淆意思的单词。

**推荐：**

```swift
let color = "red"
```

**不推荐：**

```swift
let colour = "red"
```



### 代码组织 (Code Organization)

尽可能的使用扩展(`extensions`)来解耦你的代码，将代码划分到不同的扩展模块中，每个扩展应以`// MARK: -`开头，来更好的区分扩展。

#### 协议的遵守 (Protocol Conformance)

具体来讲，当让一个`Model`遵守某个协议时，推荐添加一个独立的`Model`扩展(`extensions`)来遵守该协议。这样使得相关的协议方法能组织在一起。

**推荐：**

```swift
class MyViewController: UIViewController {
    // class stuff here
}

// MARK: - UITableViewDataSource
extension MyViewController: UITableViewDataSource {
    // table view data source methods
}

// MARK: - UIScrollViewDelegate
extension MyViewController: UIScrollViewDelegate {
    // scroll view delegate methods
}
```

**不推荐：**

```swift
class MyViewController: UIViewController, UITableViewDataSource, UIScrollViewDelegate {
    // all methods
}
```

对于`UIKit`的视图控制器(`view controllers`)，可以考虑将生命周期(`lifecycle`)相关、自定义访问器(`custom accessors`)、`IBAction`独立不同的到类扩展中。

#### 无用的代码 (`Unused Code`)

无用的代码包括Xcode产生的模板代码、占位的注释等、方法的默认实现仅仅是调用`super`等，这些都应当移除掉。

**推荐：**

```swift
override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return Database.contacts.count
}
```

**不推荐：**

```swift
override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
}

override func numberOfSections(in tableView: UITableView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    return 1
}

override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    return Database.contacts.count
}
```

#### 减小引入 (Minimal Imports)

保存最小的引入(`imports`)。例如, 当只使用`Foundation`时，不要引入`UIKit`。



### 空格 (Spacing)

* 代码折行使用4个空格(`spaces`)
* 方法的大括号和其他大括号(`if`/`else`/`switch`/`while`等)，其左括号必须要和语句在同一行，并且右括号要换行；
* 变量类型和冒号（:）之间保留一个空格；
* 返回值标记`->`两侧各保留一个空格；

**推荐：**

```swift
if user.isHappy {
    // Do something
} else {
    // Do something else
}
```

**不推荐：**

```swift
if user.isHappy
{
    // Do something
}
else {
    // Do something else
}
```

* 各个方法之间必须有一个空行，这使得代码视觉上更清晰。

* 方法的实现中，应当适当的添加空行来划分功能。过多的空行意味着你应该拆分这些功能到不同的方法中，通过这样来避免一个巨大的方法。

* 通常冒号(Colons)的左边应当没有空格，而在右边有一个空格。

	例外：

	1. 三目运算符(`ternary operator`) `? :`

		```swift
		let foo = isEnable ? "A" : "B"
		```

	2. 空字典(`empty dictionary `) `[:]`

		```swift
		let bar: [String: Int] = [:]
		```

	3. `#selector`语法的无参方法`(_:)`

		```swift
		let sel = #selector((_:))
		```

**推荐：**

```swift
/// 注意使用空格的位置
class TestDatabase: Database {
    var data: [String: CGFloat] = ["A": 1.2, "B": 3.2]
}
```

**不推荐：**

```swift
class TestDatabase : Database {
    var data :[String:CGFloat] = ["A" : 1.2, "B":3.2]
}
```



### 注释 (Comments)

* 给方法或属性添加注释，使用`option + command + /`来让Xcode自动生成
* 给关键逻辑添加一些局部注释
* 注释要保持最新状态



### 类和结构体 (Classes and Structures)

**用哪个呢？**

要知道结构体(`struct`)是值类型，当事物不具有唯一性时，使用结构体。比如，一个数组`[a, b, c]`，那么另一个数组`[a, b, c]`就跟它是一样的，他们之间可以互为替换，这时应当使用结构体来表示。

类(`class`)是引用类型，当事物具有唯一性或有明确的生命周期时，使用类。比如，一个电话簿列表，它的每一条记录都是唯一的，这时就要用类来表示。

以下是一个类的定义：

```swift
class Circle: Shape {
    var x: Int
    var y: Int
    var radius: Double
    var diameter: Double {
        get {
            return radius * 2
        }
        set {
            radius = newValue / 2
        }
    }
    
    init(x: Int, y: Int, radius: Double) {
        self.x = x
        self.y = y
        self.radius = radius
    }

    convenience init(x: Int, y: Int, diameter: Double) {
        self.init(x: x, y: y, radius: diameter / 2)
    }

    override func area() -> Double {
        return Double.pi * radius * radius
    }
}

extension Circle: CustomStringConvertible {
    var description: String {
        return "center = \(_centerString) area = \(area())"
    }
    private var _centerString: String {
        return "(\(x),\(y))"
    }
}
```

上面的代码遵循了以下规范：

* 属性、变量、常量、参数等语句的定义，都是在冒号后添加一个空格。如：`x: Int`、 `Circle: Shape`
* 方法之间保留一个空行
* 有默认的修饰符(如：`internal`)时不用重新添加。同样的，重载(`override`)方法时，不用重新添加访问修饰符`access modifier `
* 将功能组织整理到扩展中(`extensions`)
* 隐藏一些不必公开的实现细节，如`_centerString`属性用`private`来修饰。

#### 使用`self` (`Use of Self`)

在Swift中，可以省略`self`来访问一个对象的属性或方法。但为了消除使用的歧义，建议使用`self`来访问其属性或方法。

#### 计算属性 (Computed Properties)

为了简洁性，如果一个计算属性是只读(`read-only`)的，那么应省略`get { ... }`语句。`get { ... }`语句只在计算属性是读写(`read-write`)时，才要求使用。

**推荐：**

```swift
var diameter: Double {
    return radius * 2
}
```

**不推荐：**

```swift
var diameter: Double {
    get {
        return radius * 2
    }
}
```

#### 使用final标记 (Final)

出于某些原因，你可能不希望一个类被继承，这时你可以将其标记为`final`来表示它不能被继承。例如：一个单例，可能就不希望被继承。



### 函数声明 (Function Declarations)

将简短的函数声明保留在一行中，包括左括号。

```swift
func reticulateSplines(spline: [Double]) -> Bool {
    /* code goes here */
}
```

无返回值的函数可以省略`-> Void`返回值

```swift
func foo(arg: Int) {
    /* code goes here */
}
```

参数较多的函数可以像`Objective-C`中一样进行折行处理

```swift
func foo(arg1: Int, 
         arg2: Double, 
         arg3: String, 
         arg4: [Bool],
         arg5: () -> Void) {
    /* code goes here */
}
```



### 闭包表达式 (Closure Expressions)

当参数列表末尾只有一个闭包参数时，才应使用尾随闭包(`trailing closure`)语法。

**推荐：**

```swift
// 参数列表尾部只有一个闭包参数
UIView.animate(withDuration: 1.0) {
    self.myView.alpha = 0
}

// 参数列表尾部有多个闭包参数
UIView.animate(withDuration: 1.0, animations: {
    self.myView.alpha = 0
}, completion: { finished in
    self.myView.removeFromSuperview()
})
```

**不推荐：**

```swift
UIView.animate(withDuration: 1.0, animations: {
    self.myView.alpha = 0
})

UIView.animate(withDuration: 1.0, animations: {
    self.myView.alpha = 0
}) { finished in
    self.myView.removeFromSuperview()
}
```

对于单行的闭包，可以利用隐式返回(`implicit returns`)的特性:

```swift
list.sort { a, b in
    a > b
}
```

对于使用闭包的链式调用，应当让代码更清晰、更易读。可以借助空格(`spacing`)、换行(`line breaks`)和匿名参数(`anonymous arguments`)等方法来让代码更清晰、更易读，但这都依赖于你的选择。

```swift
let value = numbers.map { $0 * 2 }.filter { $0 % 3 == 0 }.index(of: 90)

let value = numbers
    .map {$0 * 2}
    .filter {$0 > 50}
    .map {$0 + 10}
```



### 类型 (Types)

应尽量使用`Swift`的原生类型，当然`Swift`提供了对`Objective-C`类型的桥接方法，你可以使用`Objective-C的所有方法。

**推荐：**

```swift
let width = 120.0                                    // Double
let widthString = (width as NSNumber).stringValue    // String
```

**不推荐：**

```swift
let width: NSNumber = 120.0                          // NSNumber
let widthString: NSString = width.stringValue        // NSString
```

#### 常量 (Constants)

常量使用关键字`let`定义，变量使用关键字`var`定义。除非值可变，否则都应使用关键字`let`定义。

在一个类型的内部，通过关键字`static let`来定义静态常量，这样可以更好的组织这些静态常量。

**推荐：**

```swift
/// 将所有的接口都定义在一个类型内部，方便外部使用
struct API {
    static let homeAPI: String = "https://www.example.com/home/"
    static let mineAPI: String = "https://www.example.com/mine/"
}

enum Math {
    static let e = 2.718281828459045235360287
    static let pi = 3.14159265358979323846264
}

let l = 2 * Math.pi * r
```

**不推荐：**

```swift
let homeAPI: String = "https://www.example.com/home/"
let mineAPI: String = "https://www.example.com/mine/"

let e = 2.718281828459045235360287
let pi = 3.14159265358979323846264

let l = 2 * Math.pi * r
```

类内部的静态方法和属性，有点类似于全局方法和属性。但应尽量避免使用全局方法和属性。有一些例外情况，比如当使用到`runtime`的`objc_getAssociatedObject()`函数时，需要定义个全局的key来作为参数：

```swift
extension UIView {
    var foo: Int? {
        return objc_getAssociatedObject(self, &_fooKey) as? Int
    }
}

private var _fooKey: Void?
```

#### 可选类型 (Optionals)

当使用`?`来定义可选类型时，表明它可以接受为`nil`的值。

当使用`!`来定义可选类型时，表明它可以接受为`nil`的值，但必须保证在使用它时，值不为`nil`。就像`ViewController`中的`view`在`viewDidLoad`被调用时就已经创建完成。

使用可选绑定(`optional binding`)来一次性解包单个或多个可选类型值。

**推荐：**

```swift
var foo: Int?
var bar: Bool?

if let foo = foo, let bar = bar {
    // 同时解包foo和bar后才会执行这里
}
```

**不推荐：**

```swift
var foo: Int?
var bar: Bool?

if let foo = foo {
    if let bar = bar {
       // 同时解包foo和bar后才会执行这里
    }   
}
```

#### 懒加载 (Lazy Initialization)

使用懒加载(`lazy initialization`)来延迟初始化，这是一个很好的特性。如：

```swift
// 对象不需要进行配置
lazy var foo: SomeBigType = SomeBigType()

// 对象需要进行配置时，使用{ ... }()这种形式
lazy var bar: OtherBigType = { [unowned self] in
    let obt = OtherBigType()
    obt.delegate = self
    return obt
}()
```

**注意：**

> 上面代码中使用到了`self`，所以需要使用`[unowned self]`来避免产生循环引用(`retain cycle`)

#### 类型推导 (Type Inference)

对于局部变量，尽量使用类型推导来让代码更紧凑。而对于成员变量来说，应尽量不要使用类型推导来让类的定义更清晰。

**推荐：**

```swift
struct Box: Shape {
    var width: Int = 10
    var height: Int = 10
    var foo: [Int] = []
    var bar: [String: Int] = [:]
    
    func scale(rate: Int) {
        let width = self.width * rate
        let height = self.height * rate
        self.width = width
        self.height = height
    }
}
```

**不推荐：**

```swift
struct Box: Shape {
    var width = 10
    var height = 10
    var foo = [Int]()
    var bar = [String: Int]()
    
    func scale(rate: CGFloat) {
        let width: Int = self.width * rate
        let height: Int = self.height * rate
        self.width = width
        self.height = height
    }
}
```

#### 语法糖 (Syntactic Sugar)

利用语法糖，使用更简短的声明方式：

**推荐：**

```swift
var deviceModels: [String]
var employees: [Int: String]
var faxNumber: Int?
```

**不推荐：**

```swift
var deviceModels: Array<String>
var employees: Dictionary<Int, String>
var faxNumber: Optional<Int>
```



### 内存管理 (Memory Management)

可以通过使用`weak` 和 `unowned`来避免循环引用，但也可以直接使用值类型(`struct`, `enum`)来避免循环引用。

通过`guard let`的形式来产生`strongSelf`:

**推荐：**

```swift
resource.request().onComplete { [weak self] response in
    guard let strongSelf = self else {
    	return
    }
    let model = strongSelf.updateModel(response)
  	strongSelf.updateUI(model)
}
```

**不推荐：**

```swift
// 当self的释放先于onComplete回调时，可能引起崩溃
resource.request().onComplete { [unowned self] response in
  	let model = self.updateModel(response)
  	self.updateUI(model)
}
```

**不推荐：**

```swift
// 当self的释放介于updateModel()和updateUI()方法之间时，可能会出现意想不到的情况
resource.request().onComplete { [weak self] response in
    let model = self?.updateModel(response)
    self?.updateUI(model)
}
```



### 访问控制 (Access Control)

一般来说，被标记为`private`、`fileprivate`的属性或方法都应以下划线(`_`)开头。

**推荐：**

```swift
private var _isEnabled: Bool
fileprivate var _isClosed: Bool

private func _foo() {
    // code goes here
}

fileprivate func _bar() {
    // code goes here
}
```

**不推荐：**

```swift
private var isEnabled: Bool
fileprivate var isClosed: Bool

private func foo() {
    // code goes here
}

fileprivate func bar() {
    // code goes here
}
```

但例外情况是，当标记被修饰为`private(set)`、`fileprivate(set)`时，不需要下划线(`_`)开头，因为他们都是可访问的属性，只是他们都是只读属性而已，如：

```swift
private(set) var isEnabled: Bool
fileprivate(set) var isClosed: Bool
```

一般将访问控制标记(`access control annotation`)放在声明的最前面，但例外情况是，当有属性标记`@IBAction`、`@IBOutlet`、`@discardableResult`、`@objc`时，需要将属性标记放在最前面。

```swift
private let _message = "Great Scott!"

class TimeMachine {  
    
    @IBOutlet private var _lbTitle: UILabel!
    
    @objc private func _foo() -> Bool {
        // code goes here
    }
}
```



### 控制流 (Control Flow)

优先使用 `for-in` 的方式而不用`while`。

**推荐：**

```swift
for _ in 0..<3 {
    print("Hello three times")
}

for (index, person) in attendeeList.enumerated() {
    print("\(person) is at position #\(index)")
}

for index in stride(from: 0, to: items.count, by: 2) {
    print(index)
}

for index in (0...3).reversed() {
    print(index)
}
```

**不推荐：**

```swift
var i = 0
while i < 3 {
    print("Hello three times")
    i += 1
}

var i = 0
while i < attendeeList.count {
    let person = attendeeList[i]
    print("\(person) is at position #\(i)")
    i += 1
}
```



### 使用Guard语句

通过使用`guard`来避免使用`if`时代码块嵌套过深的问题。

**推荐：**

```swift
func check(phone: String?, name: String?, age: Int) -> Bool {
    guard let ph = phone, ph.count > 0 else {
        return false
    }
    
    guard let nm = name, nm.count > 0 else {
        return false
    }
    
    guard age > 0 else {
        return false
    }
    
    return true
}
```

**推荐：**

```swift
func check(phone: String?, name: String?, age: Int) -> Bool {
    // 把对phone、name、age的判断放到一个guard里，更简洁
    guard 
        let ph = phone, ph.count > 0,
        let nm = name, nm.count > 0,
        age > 0 else {
        return false
    }
    
    return true
}
```



**不推荐：**

```swift
func check(phone: String?, name: String?, age: Int) -> Bool {
    if let ph = phone, ph.count > 0 {
        if let nm = name, nm.count > 0 {
            if age > 0 {
                return true
            } else {
                return false
            }
        } else {
            return false
        }
    } else {
        return false
    }
}
```



### 分号 (Semicolons)

在Swift中不要求必须加分号，一般情况下你不需要使用分号。只有当你希望将多行代码写在一行时，才需要加分号来断句。



### 圆括号 (Parentheses)

一般情况下，在类似`if`条件、`for`循环等控制语句中不需要加圆括号。只有当你在进行数学运算时，希望代码可读性更高时才需要适当的添加圆括号。

**推荐：**

```swift
let result = ((x * y) + 2) / h
```

**不推荐：**

```swift
let result = (x * y + 2) / h
```



### 引用

* [swift-style-guide](https://github.com/raywenderlich/swift-style-guide/blob/master/README.markdown)
* [The Swift Programming Language](https://developer.apple.com/library/prerelease/ios/documentation/swift/conceptual/swift_programming_language/index.html)





> 
> 1. 2019年 4 月 10 日  V1.0

---


