#import <Foundation/Foundation.h>
#import <Foundation/NSAttributedString.h>
#import <CoreFoundation/CoreFoundation.h>
#import <CoreFoundation/CFString.h>
#import <CoreFoundation/CFAttributedString.h>



void *CFIndexRetain1(CFAllocatorRef allocator, const void *ptr) {
    CFIndex *newPtr = (CFIndex*)CFAllocatorAllocate(allocator, sizeof(CFIndex), 0);
    *newPtr = *((CFIndex*)ptr);
    NSLog(@"Da5aaaaaal Retain");
    return newPtr;
}

CFHashCode CFIndexHash1(const void *ptr) {
    return (CFHashCode)*((CFIndex*)ptr);
}

void CFIndexRelease1(CFAllocatorRef allocator, const void *ptr) {
    NSLog(@"Da5aaaaaal Release");
    CFAllocatorDeallocate(allocator, (CFIndex *)ptr);
}



Boolean CFIndexEqual1(const void *ptr1, const void *ptr2) {
    CFIndex *p1 = (CFIndex *)ptr1;
    CFIndex *p2 = (CFIndex *)ptr2;
    NSLog(@"Da5aaaaaal Equal");
    return (*p1 == *p2);
}


CFDictionaryKeyCallBacks CFIndexDictionaryKeyCallbacks1 = {0, CFIndexRetain1, CFIndexRelease1, NULL, CFIndexEqual1, CFIndexHash1};


int main (int argc, const char * argv[])
{
    //NSLog(@"here");
    
    NSAutoreleasePool *pool;
    pool = [NSAutoreleasePool new];
    
    
    CFDictionaryRef attributes =  CFDictionaryCreateMutable ( NULL,16,&CFIndexDictionaryKeyCallbacks1,NULL);
    CFIndex *x =(CFIndex*)CFAllocatorAllocate(NULL, sizeof(CFIndex), 0);
    *x = 5;
    CFStringRef value =  @"value1";
    
    CFDictionaryAddValue(attributes,x,value);
    
    CFIndex xx = 5;
    
    if (CFDictionaryContainsKey(attributes,&xx)) {
        NSLog(@"YSSSSS");
    } else {
        NSLog(@"NOOOOOOOOOOOOOO");
    }
    /*
     xx = CFDictionaryGetCount(attributes);
     CFDictionaryRef cp  =CFDictionaryCreateCopy (NULL,attributes);
     NSLog(@"l = %d",xx);
     xx = CFDictionaryGetCount(cp);
     NSLog(@"copy = %d",xx);
     
     */
    CFAttributedStringRef aStr;
    CFMutableDictionaryRef attr = CFDictionaryCreateMutable(NULL, 16, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);//CFDictionaryCreateMutable (NULL,16,NULL,NULL);
    CFStringRef key1 =  CFStringCreateWithCString(NULL, "key1", NULL);
    CFStringRef value1 = CFStringCreateWithCString(NULL, "value1", NULL);
    CFDictionaryAddValue(attr, key1, value1);
    CFStringRef str =  CFStringCreateWithCString(NULL, "The attributed string", NULL);
    
    NSLog(@"-------Check Creation-------");
    
    aStr = CFAttributedStringCreate(NULL,str ,attr);
    if (aStr) {
        NSLog(@"Create successed");
    } else {

    }
    NSLog(@"-------Check Copy-------");
    
    CFAttributedStringRef aStrCopy = CFAttributedStringCreateCopy(NULL,aStr);
    
    if(aStrCopy)
        NSLog(@"Copy successed");
    else
        NSLog(@"Copy Failed");
    
    NSLog(@"----------- Check GetString and its Length--------");
    CFIndex length= CFAttributedStringGetLength(aStr);
    NSLog(@"original length = %d",length);
    
    
    length= CFAttributedStringGetLength(aStrCopy);
    NSLog(@"Copy length = %d",length);
    
    
    NSLog(@"-------Check getString-------");
    
    CFStringRef getString  = CFAttributedStringGetString(aStr);
    NSLog(@"output original = ");
    NSLog(getString);
    getString  = CFAttributedStringGetString(aStrCopy);
    NSLog(@"output Copy ");
    NSLog(getString);
    
    NSLog(@"-------Check getAttribute-------");
    
    
    CFRange r = CFRangeMake(0,0);
    getString = (CFStringRef) CFAttributedStringGetAttribute(aStr,1,key1,&r);
    
    
    NSLog(@"-------Check Effective Range-------");
    NSLog(@"effective range = %d ",r.length);
    
    NSLog(@"value original =  ");
    NSLog(getString);
    NSLog(@"copy effective range = %d ",r.length);
    getString = (CFStringRef) CFAttributedStringGetAttribute(aStrCopy,0,key1,&r);
    NSLog(@"value copy = %s ",getString);
    NSLog(@"copy effective range = %d ",r.length);
    NSLog(@"-------Check Equality-------");
    if(CFEqual(aStr,aStrCopy))
        NSLog(@"EQUAL");
    else
        NSLog(@"NOT EQUAL");
    
    NSLog(@"-------Check Create With subString-------");
    
    CFRange r2 = CFRangeMake(0,3);
    CFAttributedStringRef cfattr2 = CFAttributedStringCreateWithSubstring (NULL,aStr,r2);
    CFStringRef expectedSub =  CFStringCreateWithCString(NULL, "The", NULL);
    //NSLog(@"cfattr2: %@", cfattr2);
    if(CFEqual(CFAttributedStringGetString(cfattr2),expectedSub))
        NSLog(@"Created with right subString");
    else
        NSLog(@"Created with wrong subString");
    
    
    
    NSLog(@"-------Test Mutable AttributedString -------");
    
    NSLog(@"-------Test Create Mutable AttributedString -------");
    CFMutableAttributedStringRef maStr = CFAttributedStringCreateMutable(NULL, 0);
    NSLog(@"maStr: %@", maStr);
    CFMutableStringRef mutableString = CFAttributedStringGetMutableString(maStr);
    //NSLog(@"mutableString: %@", mutableString);
    NSLog(@"Created with length = %d", CFStringGetLength(mutableString));
    CFStringAppend(mutableString, key1); // appending on string
    //NSLog(@"key1: %@", key1);
    //NSLog(@"mutableString: %@", mutableString);
    CFMutableStringRef mutableString2 = CFAttributedStringGetMutableString(maStr);
    //NSLog(@"mutableString2: %@", mutableString2);
    NSLog(@"---------------------Edit String-------------------------");
    
    NSLog(@"String after editing with length = %d", CFStringGetLength(mutableString));
    
    r.location = 0;
    r.length = 0;
    NSLog(@"maStr: %@", maStr);
    NSLog(@"aStr: %@", aStr);
    CFAttributedStringReplaceAttributedString(maStr, r, aStr);
    NSLog(@"maStr: %@", maStr);
    
    NSLog(@"-------Check getAttribute After replacement-------");
    
    
    r = CFRangeMake(0,0);
    getString = (CFStringRef)CFAttributedStringGetAttribute(maStr, 1, key1, &r);
    
    NSLog(@"value = %@ ", getString);
    NSLog(@"String after replacement length = %d", CFStringGetLength(CFAttributedStringGetMutableString(maStr)));
    NSLog(@"-------Check Effective Range-------");
    NSLog(@"effective range = %d ", r.length);
    
    NSLog(@"-------Remove Attribute-------");
    r = CFRangeMake(0,1);
    CFAttributedStringRemoveAttribute(maStr, r, key1);
    NSLog(@"maStr: %@", maStr);
    r = CFRangeMake(0,0);
    CFTypeRef aValue = CFAttributedStringGetAttribute(maStr, 0, key1, &r);
    NSLog(@"value at 0 = %@ ", aValue);
    NSLog(@"effective range after remove Attribute = %d ", r.length);
    
    aValue = CFAttributedStringGetAttribute(maStr, 1, key1, &r);
    NSLog(@"value at 1= %@ ", aValue);
    NSLog(@"effective range of next character after remove Attribute = %d ", r.length);
    NSLog(@"******************************Finished Core Foundation Test*****************************");
    NSLog(@""); 
    NSLog(@""); 
    NSLog(@"*************************Begin Toll-Free-Bridging Foundation Test*****************************");
    NSAttributedString *nsaStr = (NSAttributedString *)aStr;
    NSLog(@"nsaStr: %@", nsaStr);
    NSDictionary *nsattr = [nsaStr attributesAtIndex:0 effectiveRange:NULL];
    NSLog(@"nsattr at 0: %@", nsattr);
    //NSLog(@"CFGetTypeID(nsattr): %d", CFGetTypeID(nsattr));
    NSLog(@"CFDictionaryGetValue(nsattr, key1): %@", CFDictionaryGetValue(nsattr, @"key1"));
    NSLog(@"[nsattr objectForKey:key1]: %@", [nsattr objectForKey:@"key1"]);
    NSLog(@"[nsaStr string]: %@", [nsaStr string]);
    NSLog(@"[nsaStr length] = %d", [nsaStr length]);
    
    
    NSRange nsrange = NSMakeRange(3,4);
    NSRange nsrangeRef = NSMakeRange(0,0);
    nsattr = [nsaStr attributesAtIndex:2 longestEffectiveRange:&nsrangeRef inRange:nsrange];
    NSLog(@"nsattr at 2: %@", nsattr);
    NSLog(@"[nsattr objectForKey:key1]: %@", [nsattr objectForKey:@"key1"]);
    NSLog(@"longestEffectiveRange in {3,4}= {%d,%d}", nsrangeRef.location, nsrangeRef.length);
    nsrangeRef = NSMakeRange(0,0);
    nsattr = [nsaStr attributesAtIndex:2 effectiveRange:&nsrangeRef];
    NSLog(@"effectiveRange at 2= {%d,%d}", nsrangeRef.location, nsrangeRef.length);
    
    NSAttributedString *subAttr = [nsaStr attributedSubstringFromRange:nsrange];
    NSLog([subAttr string]);
    NSLog(@"SUB Attributed length = %d",[subAttr length]);
    
    NSMutableAttributedString *mutable = (NSMutableAttributedString *)maStr;
    
    NSLog(@"mutable: %@", mutable);
    NSLog([mutable string]);
    NSLog(@"---- length = %d ----", [mutable length]);
    
    nsattr = [mutable attributesAtIndex:0 effectiveRange:nil];
    NSLog([nsattr objectForKey:@"key1"]);
    
    nsrange = NSMakeRange(3,4);
    nsrangeRef = NSMakeRange(0,0);
    nsattr = [mutable attributesAtIndex:2 longestEffectiveRange:&nsrangeRef inRange:nsrange];
    NSLog([nsattr objectForKey:@"key1"]);
    NSLog(@"effectiveRange in {3,4)= {%d,%d}", nsrangeRef.location, nsrangeRef.length);
    nsattr = [mutable attributesAtIndex:2 effectiveRange:&nsrangeRef];
    NSLog(@"effectiveRange at 2= {%d,%d}", nsrangeRef.location, nsrangeRef.length);
    
    nsrange = NSMakeRange(0,3);
    [mutable replaceCharactersInRange:nsrange withString:@"Mohamed"];
    NSLog(@"mutable: %@", mutable);
    NSLog([mutable string]);
    NSLog(@"replaced Attributed length = %d", [mutable length]);
    
    
    NSLog(@"^^^^^^^^^^^^^^set Attributes^^^^^^^^^^^^^^^^^^^^^^");
    
    nsattr = [[NSDictionary alloc] initWithObjectsAndKeys:@"val10", @"key10", nil]; //nil to signify end of objects and keys.
    
    nsrange = NSMakeRange(0,1);
    [mutable setAttributes:nsattr range:nsrange];
    NSLog(@"mutable: %@", mutable);
    
    nsattr = [mutable attributesAtIndex:0 longestEffectiveRange:&nsrangeRef inRange:nsrange];
    NSLog(@"[nsattr objectForKey:key10]: %@", [nsattr objectForKey:@"key10"]);
    NSLog(@"[nsattr objectForKey:key1]: %@", [nsattr objectForKey:@"key1"]);
    
    NSLog(@"-----check effective range-----------");
    NSLog(@"longestEffectiveRange in {0,1}= {%d,%d}", nsrangeRef.location, nsrangeRef.length);
    
    NSLog(@"^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");
    
    NSLog(@"^^^^^^^^^^^^^^^^ AttributedString from Range ^^^^^^^^^^^^^^^^^^");
    NSLog([mutable string]);
    nsrange = NSMakeRange(0,7);
    
    subAttr = [mutable attributedSubstringFromRange:nsrange];
    
    NSLog(@"subAttr: %@", subAttr);
    //NSLog([subAttr string]);
    
    NSLog(@"SUB Attributed length = %d", [subAttr length]);
    
    nsrange = NSMakeRange(0,1);
    nsattr = [subAttr attributesAtIndex:1 longestEffectiveRange:&nsrangeRef inRange:nsrange];
    NSLog(@"[nsattr count] = %d", [nsattr count]);
    
    NSLog([nsattr objectForKey:@"key1"]);
    NSLog([nsattr objectForKey:@"key10"]);
    NSLog(@"^^^^^^^^^^^^^^^^ ^^^^^^^^^^^^^^^^^^^^^^^ ^^^^^^^^^^^^^^^^^^");
    
    
    NSLog(@"^^^^^^^^^^^^^^^^  set Attributed String ^^^^^^^^^^^^^^^^^^^^^^^ ^^^^^^^^^^^^^^^^^^");
    
    NSLog(@"mutable: %@", mutable);
    NSLog(@"subAttr: %@", subAttr);
    nsattr = [mutable attributesAtIndex:3 effectiveRange:nil];
    NSLog([nsattr objectForKey:@"key1"]);
    nsattr = [mutable attributesAtIndex:0 effectiveRange:nil];
    NSLog([nsattr objectForKey:@"key10"]);
    
    [mutable setAttributedString:subAttr];
    NSLog(@"after set");
    NSLog(@"mutable: %@", mutable);
    NSLog([mutable string]);
    NSLog(@"*****SUB Attributed length = %d****", [mutable length]);
    
    nsattr = [mutable attributesAtIndex:3 effectiveRange:nil];
    NSLog([nsattr objectForKey:@"key1"]);
    nsattr = [mutable attributesAtIndex:0 effectiveRange:nil];
    NSLog([nsattr objectForKey:@"key10"]);
    NSLog(@"^^^^^^^^^^^^^^^^ ^^^^^^^^^^^^^^^^^^^^^^^ ^^^^^^^^^^^^^^^^^^");
    
    
    
    
    NSLog(@"^^^^^^^^^^^^^^^^ test remove attributes ^^^^^^^^^^^^^^^^^^");
    
    nsattr = [mutable attributesAtIndex:0 effectiveRange:nil];
    NSLog(@"count of attributes = %d",[nsattr count]);
    NSLog([nsattr objectForKey:@"key1"]);
    NSLog([nsattr objectForKey:@"key10"]);
    
    
    nsrange = NSMakeRange(0,2);
    [mutable removeAttribute:@"key10" range:nsrange];
    
    NSLog(@"After remove");
    nsattr = [mutable attributesAtIndex:0 effectiveRange:nil];
    NSLog(@"lenght of attributes = %d",[nsattr count]);
    NSLog([nsattr objectForKey:@"key1"]);
    NSLog(@"^^^^^^^^^^^^^^^^^^^^^^");
    
    
    NSLog(@"^^^^^^^ replaceCharactersInRange:withAttributedString: ^^^^^^^^");
    nsrange = NSMakeRange(0,3);
    NSLog(@"mutable: %@", mutable);
    NSLog(@"nsaStr: %@", nsaStr);
    [mutable  replaceCharactersInRange:nsrange withAttributedString:nsaStr];
    
    NSLog(@"mutable: %@", mutable);
    nsattr = [mutable attributesAtIndex:2 longestEffectiveRange:&nsrangeRef inRange:nsrange];
    NSLog([nsattr objectForKey:@"key1"]);
    NSLog([mutable string]);
    NSLog(@"^^^^^^^^^^^^^^^^ ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");		
    
    
    NSLog(@"^^^^^set attribute ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");		
    nsrange = NSMakeRange(4,3);
    [mutable addAttribute:@"key99" value:@"val99" range:nsrange];
    NSLog(@"mutable: %@", mutable);
    
    nsattr = [mutable attributesAtIndex:5 longestEffectiveRange:&nsrangeRef inRange:nsrange];
    NSLog(@"nsattr at 5: %@", nsattr);
    NSLog(@"[nsattr objectForKey:key99]: %@", [nsattr objectForKey:@"key99"]);
    NSLog(@"[nsattr objectForKey:key1]: %@", [nsattr objectForKey:@"key1"]);
    NSLog(@"[nsattr objectForKey:key10]: %@", [nsattr objectForKey:@"key10"]);
    NSLog(@"^^^^^^^^^^^^^^^^ ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");	
    
    [mutable appendAttributedString:subAttr];
    NSLog([mutable string]);
    NSLog(@"len = %d",[mutable length]);
    nsattr = [mutable attributesAtIndex:54 longestEffectiveRange:&nsrangeRef inRange:nsrange];
    NSLog([nsattr objectForKey:@"key1"]);
    
    NSLog(@"!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");		
    
    return 0;
}
