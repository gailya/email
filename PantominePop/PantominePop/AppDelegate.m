//
//  AppDelegate.m
//  PantominePop
//
//  Created by Wang Lihui on 12-12-18.
//  Copyright (c) 2012年 Wang Lihui. All rights reserved.
//

#import "AppDelegate.h"

/*#define FROM_ADDRESS @"Ludovic Marcotte <ludovic@Sophos.ca>"
#define TO_ADDRESS   @"lwang@avos.com"

#define SERVER_NAME  @"smtp.gmail.com"
#define SERVER_PORT  587
#define USE_SECURE   2         // 0 -> NO, 1 -> SSL (usually port 465), 2 -> TLS (usually port 25 or 587)
#define USERNAME     @"youraccount"
#define PASSWORD     @"yourpasswd"
#define MECHANISM    @"PLAIN"  // use "none" for no SMTP authentication
// "PLAIN", "LOGIN" and "CRAM-MD5" are supported.

//
// How many messages would you like to send over the same connection?
//
static int number_of_messages = 3;

@implementation AppDelegate

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    CWInternetAddress *address;
    CWMessage *message;
    
    // We create a simple message object.
    message = [[CWMessage alloc] init];
    [message setSubject: @"Pantomime Test!"];
    
    // We set the "From:" header
    address = [[CWInternetAddress alloc] initWithString: FROM_ADDRESS];
    [message setFrom: address];
    RELEASE(address);
    
    // We set the "To: header
    address = [[CWInternetAddress alloc] initWithString: TO_ADDRESS];
    [address setType: PantomimeToRecipient];
    [message addRecipient: address];
    RELEASE(address);
    
    // We set the Message's Content-Type, encoding and charset
    [message setContentType: @"text/plain"];
    [message setContentTransferEncoding: PantomimeEncodingNone];
    [message setCharset: @"us-ascii"];
    
    // We set the Message's content
    [message setContent: [@"This is a simple content." dataUsingEncoding: NSASCIIStringEncoding]];
    
    // We initialize our SMTP instance
    _smtp = [[CWSMTP alloc] initWithName: SERVER_NAME  port: SERVER_PORT];
    [_smtp setDelegate: self];
    [_smtp setMessage: message];
    RELEASE(message);
    
    // We connect to the server _in background_. That means, this call
    // is non-blocking and methods will be invoked on the delegate
    // (or notifications will be posted) for further dialog with
    // the remote SMTP server.
    NSLog(@"Connecting to the %@ server...", SERVER_NAME);
    [_smtp connectInBackgroundAndNotify];
    
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}


//
// This method is automatically called once the SMTP authentication
// has completed. If it has failed, -authenticationFailed: will
// be invoked.
//
- (void) authenticationCompleted: (NSNotification *) theNotification
{
    NSLog(@"Authentication completed! Sending the message...");
    [_smtp sendMessage];
}


//
// This method is automatically called once the SMTP authentication
// has failed. If it has succeeded, -authenticationCompleted: will
// be invoked.
//
- (void) authenticationFailed: (NSNotification *) theNotification
{
    NSLog(@"Authentication failed! Closing the connection...");
    [_smtp close];
}


//
// This method is automatically called when the connection to
// the SMTP server was established.
//
- (void) connectionEstablished: (NSNotification *) theNotification
{
    NSLog(@"Connected!");
    
    if (USE_SECURE == 1)
    {
        NSLog(@"Now starting SSL...");
        [(CWTCPConnection *)[_smtp connection] startSSL];
    }
}


//
// This method is automatically called when the connection to the
// server is abruptly closed by the server. GMail does that for example
// when you call close. You should make sure your message is sent
// in this delegate and not assume it only happens when after you
// invoke -close.
//
- (void) connectionLost: (NSNotification *) theNotification
{
    NSLog(@"Connection lost to the server!");
    RELEASE(_smtp);
}


//
// This method is automatically called when the connection to
// the SMTP server was terminated avec invoking -close on the
// SMTP instance.
//
- (void) connectionTerminated: (NSNotification *) theNotification
{
    NSLog(@"Connection closed.");
    RELEASE(_smtp);
}


//
// This method is automatically called when the message has been
// successfully sent.
//
- (void) messageSent: (NSNotification *) theNotification
{
    NSLog(@"Sent!\nClosing the connection.");
    
    number_of_messages--;
    
    if (number_of_messages == 0)
    {
        [_smtp close];
    }
    else
    {
        // If you wish to either change the recipients, message or
        // the message data, you should do so in -transactionResetCompleted:
        // before calling again -sendMessage. The -reset method will NOT
        // change either the previously used recipients, message or
        // message data.
        [_smtp reset];
    }
}

//
// This method is automatically invoked once the SMTP service
// is fully initialized. One can send a message directly (if no
// SMTP authentication is required to relay the mail) or proceed
// with the authentication if needed.
//
- (void) serviceInitialized: (NSNotification *) theNotification
{
    if (![(CWTCPConnection *)[[theNotification object] connection] isSSL] && USE_SECURE == 2)
    {
        [[theNotification object] startTLS];
        return;
    }
    
    if (USE_SECURE == 1)
    {
        NSLog(@"SSL handshaking completed.");
    }
    
    if ([MECHANISM isEqualToString: @"none"])
    {
        NSLog(@"Sending the message...");
        [_smtp sendMessage];
    }
    else
    {
        NSLog(@"Available authentication mechanisms: %@", [_smtp supportedMechanisms]);
        [_smtp authenticate: USERNAME  password: PASSWORD  mechanism: MECHANISM];
    }
}

//
// This method is invoked once the transaction has been reset. This
// can be useful if one when to send more than one message over
// the same SMTP connection.
//
- (void) transactionResetCompleted: (NSNotification *) theNotification
{
    NSLog(@"Sending the message over the same connection...");
    [_smtp sendMessage];
}
*/



#define SERVER_NAME  @"pop3.sohu.com"
#define SERVER_PORT  110
#define USE_SSL      NO
#define USERNAME     @"youraccount"
#define PASSWORD     @"yourpassword"
#define MECHANISM    @"none"  // use "none" for normal POP3 authentication

@implementation AppDelegate

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // We initialize our POP3Store instance
    _pop3 = [[CWPOP3Store alloc] initWithName: SERVER_NAME  port: SERVER_PORT];
    [_pop3 setDelegate: self];
    
    // We connect to the server _in background_. That means, this call
    // is non-blocking and methods will be invoked on the delegate
    // (or notifications will be posted) for further dialog with
    // the remote POP3server.
    NSLog(@"Connecting to the %@ server...", SERVER_NAME);
    [_pop3 connectInBackgroundAndNotify];
    
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
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

//
// This method is automatically called once the POP3 authentication
// has completed. If it has failed, -authenticationFailed: will
// be invoked.
//
- (void) authenticationCompleted: (NSNotification *) theNotification
{
    NSLog(@"Authentication completed! Checking for messages..");
    [[_pop3 defaultFolder] prefetch];
}


//
// This method is automatically called once the POP3 authentication
// has failed. If it has succeeded, -authenticationCompleted: will
// be invoked.
//
- (void) authenticationFailed: (NSNotification *) theNotification
{
    NSLog(@"Authentication failed! Closing the connection...");
    [_pop3 close];
}


//
// This method is automatically called when the connection to
// the POP3 server was established.
//
- (void) connectionEstablished: (NSNotification *) theNotification
{
    NSLog(@"Connected!");
    
    if (USE_SSL)
    {
        NSLog(@"Now starting SSL...");
        [(CWTCPConnection *)[_pop3 connection] startSSL];
    }
}


//
// This method is automatically called when the connection to
// the POP3 server was terminated avec invoking -close on the
// POP3Store instance.
//
- (void) connectionTerminated: (NSNotification *) theNotification
{
    NSLog(@"Connection closed.");
    RELEASE(_pop3);
}


//
// This method is automatically invoked when the folder information
// was fully prefetched from the POP3 server. Once it has been
// prefetched, one can prefetch specific messages.
//
- (void) folderPrefetchCompleted: (NSNotification *) theNotification
{
    int count;
    
    count = [(CWPOP3Folder *)[_pop3 defaultFolder] count];
    
    NSLog(@"There are %d messages on the server.", count);
    
    if (count > 0)
    {
        NSLog(@"Prefetching and initializing the first one...");
        [[[[_pop3 defaultFolder] allMessages] objectAtIndex: 0] setInitialized: YES];
    }
    else
    {
        NSLog(@"Closing the connection...");
        [_pop3 close];
    }
}


//
// This method is automatically invoked when a message was
// fully prefetched from the POP3 server.
//
- (void) messagePrefetchCompleted: (NSNotification *) theNotification
{
    CWMessage *aMessage;
    
    aMessage = [[theNotification userInfo] objectForKey: @"Message"];
    
    NSLog(@"Got the message! The subject is: %@", [aMessage subject]);
    NSLog(@"The full content is:\n\n------------------------\n%s------------------------", [[aMessage rawSource] cString]);
    
    NSLog(@"Closing the connection...");
    [_pop3 close];
}


//
// This method is automatically invoked once the POP3Store service
// is fully initialized.
//
- (void) serviceInitialized: (NSNotification *) theNotification
{
    if (USE_SSL)
    {
        NSLog(@"SSL handshaking completed.");
    }
    
    NSLog(@"Available authentication mechanisms: %@", [_pop3 supportedMechanisms]);
    [_pop3 authenticate: USERNAME  password: PASSWORD  mechanism: MECHANISM];
}

@end
