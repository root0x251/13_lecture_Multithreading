//
//  AppDelegate.m
//  13_lecture_ Multithreading
//
//  Created by Slava on 09.03.17.
//  Copyright © 2017 Slava. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (strong, nonatomic) NSMutableArray *array;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
        // загружаемся в background
//    [self performSelectorInBackground:@selector(testThreadInBackground) withObject:nil];
//    
//        // autoreleasePool
//    [self performSelectorInBackground:@selector(autoreleasePool) withObject:nil];
    
        // нить
//    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(autoreleasePool) object:nil];
//    [thread start];
    
    
//    for (int i = 0; i < 50; i++) {
//        NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(autoreleasePool) object:nil];
//        thread.name = [NSString stringWithFormat:@"Thread #%d", i];
//        [thread start];
//    }
//    NSLog(@"с помощью @autoreleasepool");
    self.array = [NSMutableArray array];
//    NSThread *threadOne = [[NSThread alloc] initWithTarget:self selector:@selector(addStringToMutableArray:) object:@"x"];
//    threadOne.name = @"threadOne";
//    [threadOne start];
//    
//    NSThread *threadTwo = [[NSThread alloc] initWithTarget:self selector:@selector(addStringToMutableArray:) object:@"y"];
//    threadTwo.name = @"threadTwo";
//    [threadTwo start];
//
//    [self performSelector:@selector(printArray) withObject:nil afterDelay:2];

    
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        mmmm
//    });
    
    
//    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    
//    dispatch_async(queue, ^{
//        double startTime = CACurrentMediaTime();
//        NSLog(@"%@ was started", [[NSThread currentThread] name]); // возвращает имя текущего потока
//        for (int i = 0; i < 20000000; i++) {
//            //            NSLog(@"%d", i);
//        }
//        dispatch_async(dispatch_get_main_queue(), ^{
//            NSLog(@"%@ was finished %f", [[NSThread currentThread] name], CACurrentMediaTime() - startTime);
//        });
//    });
    
    
    
    
    
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        [self addStringToMutableArray:@"x"];
//    });
//    
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        [self addStringToMutableArray:@"y"];
//    });
//    [self performSelector:@selector(printArray) withObject:nil afterDelay:3];
    
    
    
    
    
        // выполняется последлвательно
//    dispatch_async(dispatch_queue_create("com.Multithreading.lecture", DISPATCH_QUEUE_SERIAL), ^{
//        [self addStringToMutableArray:@"x"];
//    });
//    dispatch_async(dispatch_queue_create("com.Multithreading.lecture", DISPATCH_QUEUE_SERIAL), ^{
//        [self addStringToMutableArray:@"y"];
//    });
    
                // или так
    
    dispatch_queue_t queue = dispatch_queue_create("qweqweqwe.com", DISPATCH_QUEUE_SERIAL);
    dispatch_async(queue, ^{
        [self addStringToMutableArray:@"x"];
    });
    dispatch_async(queue, ^{
        [self addStringToMutableArray:@"0"];
    });
    
    
     
    [self performSelector:@selector(printArray) withObject:nil afterDelay:3];

    
    
    return YES;
}
    // вызов метода в бекнраунде
- (void) testThreadInBackground {
    for (int i = 0; i < 2000; i++) {
        NSLog(@"%d", i);
    }
}

    // autoreleasePool
- (void) autoreleasePool {
    @autoreleasepool {  // это вроде как в новых версиях не важно
        double startTime = CACurrentMediaTime();
        NSLog(@"%@ was started", [[NSThread currentThread] name]); // возвращает имя текущего потока
        for (int i = 0; i < 20000000; i++) {
//            NSLog(@"%d", i);
        }
        NSLog(@"%@ was finished %f", [[NSThread currentThread] name], CACurrentMediaTime() - startTime);
    }
}


    // добавляем строки в массив
- (void) addStringToMutableArray: (NSString *) string {
    @autoreleasepool {  // это вроде как в новых версиях не важно
        double startTime = CACurrentMediaTime();
        NSLog(@"%@ was started", [[NSThread currentThread] name]);
//        @synchronized (self) {  // тот поток который первый зайдет в @synchronized будет выполнятся первым, остальные будут вставать в очередь за ним
            for (int i = 0; i < 100000; i++) {
                [self.array addObject:string];
            }
//        }
        NSLog(@"%@ was finished %f", [[NSThread currentThread] name], CACurrentMediaTime() - startTime);
    }
}
    // выводим массив
- (void) printArray {
    NSLog(@"%@", self.array);
}

- (void)applicationWillResignActive:(UIApplication *)application {
    
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    
}


- (void)applicationWillEnterForeground:(UIApplication *)application {

}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    
}


- (void)applicationWillTerminate:(UIApplication *)application {
    
}


@end
