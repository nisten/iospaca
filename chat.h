//
//  chat.h
//  alpaca
//
//  Created by onexip / Matthias Hänel on 25.03.23.
//

#ifndef chat_h
#define chat_h

typedef void (*ResponseCallback)(const void* target, const char * response);

#ifdef __cplusplus
extern "C" {
#endif
int run_cmain(int argc, char ** argv);

void setResponseCallback(const void* target, ResponseCallback callback);
#ifdef __cplusplus
}
#endif
#endif /* chat_h */
