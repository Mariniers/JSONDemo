//
//  ViewController.m
//  JSONDemo
//
//  Created by Vivien Cormier on 01/09/12.
//  Copyright (c) 2012 IUT. All rights reserved.
//

#import "ViewController.h"

#import "SBJson.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize labelTitle;
@synthesize labelContent;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    // Creation du parser
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
    //Récupération du titre
    NSString *title = [post objectForKey:@"title"];
    //Récupération du contenu
    NSString *content = [post objectForKey:@"content"];
    
    //On insére le NSString dans le lablel
    labelTitle.text = title;
    //On insére le NSString dans le lablel
    labelContent.text = content;

}

- (void)viewDidUnload
{
    [self setLabelTitle:nil];
    [self setLabelContent:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

@end
