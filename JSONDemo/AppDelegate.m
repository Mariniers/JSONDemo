//
//  AppDelegate.m
//  JSONDemo
//
//  Created by Vivien Cormier on 01/09/12.
//  Copyright (c) 2012 IUT. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"

#import "SBJson.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.viewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    SBJsonParser *parser = [[SBJsonParser alloc] init];
    
    // Construction de l'url à récupérer
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://fr.etapes.com/logo-en-tete.json"]];
    
    // execution de la requête et récupération du JSON via un objet NSData
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    // On récupère le JSON en NSString depuis la réponse
    NSString *json_string = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];
    
    // on parse la reponse JSON
    NSDictionary *status = [parser objectWithString:json_string error:nil];
    NSDictionary *post = [status objectForKey:@"post"];
    NSString *title = [post objectForKey:@"content"];
    NSLog(@"%@", title);
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
