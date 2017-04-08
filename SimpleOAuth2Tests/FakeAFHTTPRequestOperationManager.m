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

#import "FakeAFHTTPRequestOperationManager.h"


@implementation FakeAFHTTPRequestOperationManager

#pragma mark - AFHTTPSessionManager

- (AFHTTPRequestOperation *)HTTPRequestOperationWithRequest:(NSURLRequest *)request
                                                    success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                                                    failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    self.httpRequestOperationRequest = request;
    self.httpRequestOperationSuccessBlock = success;
    self.httpRequestOperationFailureBlock = failure;

    return [[AFHTTPRequestOperation alloc] init];
}

- (AFHTTPRequestOperation *)GET:(NSString *)URLString
                     parameters:(id)parameters
                        success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                        failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    self.getURLString = URLString;
    self.getParameters = parameters;
    self.getSuccessBlock = success;
    self.getFailureBlock = failure;

    return [[AFHTTPRequestOperation alloc] init];
}

- (AFHTTPRequestOperation *)HEAD:(NSString *)URLString
                      parameters:(id)parameters
                         success:(void (^)(AFHTTPRequestOperation *operation))success
                         failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;
{
    self.headURLString = URLString;
    self.headParameters = parameters;
    self.headSuccessBlock = success;
    self.headFailureBlock = failure;

    return [[AFHTTPRequestOperation alloc] init];
}

- (AFHTTPRequestOperation *)POST:(NSString *)URLString
                      parameters:(id)parameters
                         success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                         failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    self.postURLString = URLString;
    self.postParameters = parameters;
    self.postSuccessBlock = success;
    self.postFailureBlock = failure;

    return [[AFHTTPRequestOperation alloc] init];
}

- (AFHTTPRequestOperation *)POST:(NSString *)URLString
                      parameters:(id)parameters
       constructingBodyWithBlock:(void (^)(id <AFMultipartFormData> formData))block
                         success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                         failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    self.postWithMultipartFormDataURLString = URLString;
    self.postWithMultipartFormDataParameters = parameters;
    self.postWithMultipartFormDataBlock = block;
    self.postWithMultipartFormDataSuccessBlock = success;
    self.postWithMultipartFormDataFailureBlock = failure;

    return [[AFHTTPRequestOperation alloc] init];
}

- (AFHTTPRequestOperation *)PUT:(NSString *)URLString
                     parameters:(id)parameters
                        success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                        failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    self.putURLString = URLString;
    self.putParameters = parameters;
    self.putSuccessBlock = success;
    self.putFailureBlock = failure;

    return [[AFHTTPRequestOperation alloc] init];
}

- (AFHTTPRequestOperation *)PATCH:(NSString *)URLString
                       parameters:(id)parameters
                          success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                          failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    self.patchURLString = URLString;
    self.patchParameters = parameters;
    self.patchSuccessBlock = success;
    self.patchFailureBlock = failure;

    return [[AFHTTPRequestOperation alloc] init];
}

- (AFHTTPRequestOperation *)DELETE:(NSString *)URLString
                        parameters:(id)parameters
                           success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                           failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    self.deleteURLString = URLString;
    self.deleteParameters = parameters;
    self.deleteSuccessBlock = success;
    self.deleteFailureBlock = failure;

    return [[AFHTTPRequestOperation alloc] init];
}

#pragma mark - Public Methods

- (void)reset
{
    self.httpRequestOperationRequest = nil;
    self.httpRequestOperationSuccessBlock = nil;
    self.httpRequestOperationFailureBlock = nil;

    self.getURLString = nil;
    self.getParameters = nil;
    self.getSuccessBlock = nil;
    self.getFailureBlock = nil;

    self.headURLString = nil;
    self.headParameters = nil;
    self.headSuccessBlock = nil;
    self.headFailureBlock = nil;

    self.postURLString = nil;
    self.postParameters = nil;
    self.postSuccessBlock = nil;
    self.postFailureBlock = nil;

    self.postWithMultipartFormDataURLString = nil;
    self.postWithMultipartFormDataParameters = nil;
    self.postWithMultipartFormDataBlock = nil;
    self.postWithMultipartFormDataSuccessBlock = nil;
    self.postWithMultipartFormDataFailureBlock = nil;

    self.putURLString = nil;
    self.putParameters = nil;
    self.putSuccessBlock = nil;
    self.putFailureBlock = nil;

    self.patchURLString = nil;
    self.patchParameters = nil;
    self.patchSuccessBlock = nil;
    self.patchFailureBlock = nil;

    self.deleteURLString = nil;
    self.deleteParameters = nil;
    self.deleteSuccessBlock = nil;
    self.deleteFailureBlock = nil;
}

@end
