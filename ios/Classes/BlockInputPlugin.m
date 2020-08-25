#import "BlockInputPlugin.h"
#if __has_include(<block_input/block_input-Swift.h>)
#import <block_input/block_input-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "block_input-Swift.h"
#endif

@implementation BlockInputPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftBlockInputPlugin registerWithRegistrar:registrar];
}
@end
