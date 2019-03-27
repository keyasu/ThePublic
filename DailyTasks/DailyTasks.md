### 面试题总结吧(都是参考答案,或许个人理解不到位, 敬请指出, 谢谢)
1. BAD_ACCESS 在什么情况下出现?
> 在开发过程中经常碰到, 在开发时候经常碰到 BAD_ACCESS . 原因是访问了野指针, 比如访问已经释放的成员变量或者发消息、死循环等
>
2. 如何调试BAD_ACCESS错误？
> 出现BAD_ACCESS错误，通常是访问了野指针，比如访问了已经释放了的对象。快速定位问题的步骤有：
> 1. 重写对象的respondsToSelector方法，先找到出现EXECBADACCESS前访问的最后一个object
> 2. 设置Enable Zombie Objects
>  3. 设置全局断点快速定位问题代码所在行，接收所有的异常
>  4. Xcode7已经集成了BAD_ACCESS捕获功能：Address Sanitizer，与步骤2一样设置

 
2. 苹果是如何实现autoreleasepool的？
> autoreleasepool以一个队列数组的形式实现,主要通过下列三个函数完成.
 • objc_autoreleasepoolPush
 • objc_autoreleasepoolPop
 • objc_autorelease
看函数名就可以知道，对autorelease分别执行push、pop操作。销毁对象时执行release操作。
举例说明：我们都知道用类方法创建的对象都是 Autorelease 的，那么一旦 Person 出了作用域，当在 Person 的 dealloc 方法中打上断点，我们就可以看到这样的调用堆栈信息：








