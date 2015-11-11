#import "ShareViewController.h"
#import <Cordova/CDV.h>
#import <Cordova/CDVPluginResult.h>
#import <Cordova/CDVViewController.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import <MobileCoreServices/UTCoreTypes.h>

@implementation ShareViewController
- (void)viewWillAppear:(BOOL)animated
{
  NSArray *outputItems = self.extensionContext.inputItems;
  NSExtensionItem *outputItem = outputItems[0];
  NSItemProvider *item = [outputItem.userInfo
    objectForKey:NSExtensionItemAttachmentsKey][0];
  [item loadItemForTypeIdentifier:kUTTypeImage options:nil
    completionHandler:^(id item, NSError *error)
    {
      self.imageExtensionUrl = item;
    }];
}
@end
