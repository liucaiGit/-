

//
//  HomeModel.m
//  ZIPImageDemo
//
//  Created by liucai on 2018/1/27.
//  Copyright © 2018年 liucai. All rights reserved.
//

#import "HomeModel.h"

@implementation HomeModel

//hash方法只是在对象被添加到NSSet和设置为NSDictionary的key时会被调用
/**
 *  step1:集成成员的hash值是否与目标的hash值相同 若相同进入step2若不相同直接返回NO
    step2:hash值相同的情况下 再进行对象判等 作为判等的结果
 即hash值是对象判等的必要不充分条件   对关键属性的hash值进行位或运算作为model的hash值
 */

- (NSUInteger)hash {
    return [self.ID hash] ^ [self.name hash];
}

- (BOOL)isEqual:(id)object {
    //1.==运算符判断是否是同一个对象(判断地址)  同一个对象必然完全相同
    if (self == object) {
        return YES;
    }
    
    //2.判断是否是同一类型(判断类型)  不仅提高了判等的效率 也可以避免隐式类型转换带来的潜在风险
    if (![object isKindOfClass:[self class]]) {
        return NO;
    }
    //3.判断数据是否完全相同(判断数据)
    return  [self isEqualToHomeModel:(HomeModel *)object];
}

- (BOOL)isEqualToHomeModel:(HomeModel *)model {
    //参数有效性检查
    if (!model) {
        return NO;
    }
    BOOL isEqualId = (!self.ID && !model.ID) || [self.ID isEqualToNumber:model.ID];
    BOOL isEqualName = (!self.name && !model.name) || [self.name isEqualToString:model.name];
    
    return isEqualId && isEqualName;
}

@end
