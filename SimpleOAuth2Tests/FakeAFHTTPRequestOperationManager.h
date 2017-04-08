//Copyright (c) 2016 Ryan Baumbach <rbaumbach.github@gmail.com>
//
//Permission is hereby granted, free of charge, to any person obtaining
//a copy of this software and associated documentation files (the "Software"),
//to deal in the Software without restriction, including
//without limitation the rights to use, copy, modify, merge, publish,
//distribute, sublicense, and/or sell copies of the Software, and to
//permit persons to whom the Software is furnished to do so, subject to
//the following conditions:
//
//The above copyright notice and this permission notice shall be
//included in all copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
//EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
//MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
//NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
//LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
//OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
//WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#import "AFHTTPRequestOperationManager.h"


@interface FakeAFHTTPRequestOperationManager : AFHTTPRequestOperationManager

@property (strong, nonatomic) NSURLRequest *httpRequestOperationRequest;
@property (copy, nonatomic) void (^httpRequestOperationSuccessBlock)(AFHTTPRequestOperation *operation, id responseObject);
@property (copy, nonatomic) void (^httpRequestOperationFailureBlock)(AFHTTPRequestOperation *operation, NSError *error);

@property (copy, nonatomic) NSString *getURLString;
@property (strong, nonatomic) id getParameters;
@property (copy, nonatomic) void (^getSuccessBlock)(AFHTTPRequestOperation *operation, id responseObject);
@property (copy, nonatomic) void (^getFailureBlock)(AFHTTPRequestOperation *operation, NSError *error);

@property (copy, nonatomic) NSString *headURLString;
@property (strong, nonatomic) id headParameters;
@property (copy, nonatomic) void (^headSuccessBlock)(AFHTTPRequestOperation *operation);
@property (copy, nonatomic) void (^headFailureBlock)(AFHTTPRequestOperation *operation, NSError *error);

@property (copy, nonatomic) NSString *postURLString;
@property (strong, nonatomic) id postParameters;
@property (copy, nonatomic) void (^postSuccessBlock)(AFHTTPRequestOperation *operation, id responseObject);
@property (copy, nonatomic) void (^postFailureBlock)(AFHTTPRequestOperation *operation, NSError *error);

@property (copy, nonatomic) NSString *postWithMultipartFormDataURLString;
@property (strong, nonatomic) id postWithMultipartFormDataParameters;
@property (copy, nonatomic) void (^postWithMultipartFormDataBlock)(id <AFMultipartFormData> formData);
@property (copy, nonatomic) void (^postWithMultipartFormDataSuccessBlock)(AFHTTPRequestOperation *operation, id responseObject);
@property (copy, nonatomic) void (^postWithMultipartFormDataFailureBlock)(AFHTTPRequestOperation *operation, NSError *error);

@property (copy, nonatomic) NSString *putURLString;
@property (strong, nonatomic) id putParameters;
@property (copy, nonatomic) void (^putSuccessBlock)(AFHTTPRequestOperation *operation, id responseObject);
@property (copy, nonatomic) void (^putFailureBlock)(AFHTTPRequestOperation *operation, NSError *error);

@property (copy, nonatomic) NSString *patchURLString;
@property (strong, nonatomic) id patchParameters;
@property (copy, nonatomic) void (^patchSuccessBlock)(AFHTTPRequestOperation *operation, id responseObject);
@property (copy, nonatomic) void (^patchFailureBlock)(AFHTTPRequestOperation *operation, NSError *error);

@property (copy, nonatomic) NSString *deleteURLString;
@property (strong, nonatomic) id deleteParameters;
@property (copy, nonatomic) void (^deleteSuccessBlock)(AFHTTPRequestOperation *operation, id responseObject);
@property (copy, nonatomic) void (^deleteFailureBlock)(AFHTTPRequestOperation *operation, NSError *error);

- (void)reset;

@end
