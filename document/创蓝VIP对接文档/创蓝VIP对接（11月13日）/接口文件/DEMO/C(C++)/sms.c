//
//  sms.cpp
//  短信http接口的c/c++代码调用示例
//  本DEMO仅作参考
//
#include <arpa/inet.h>
#include <assert.h>
#include <errno.h>
#include <netinet/in.h>
#include <signal.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <sys/wait.h>
#include <netdb.h>
#include <unistd.h>

#define SA struct sockaddr
#define MAXLINE 4096
#define MAXSUB  2000
#define MAXPARAM 2048

#define LISTENQ         1024

extern int h_errno;

int basefd;
char *hostname = "222.73.117.158";
char *send_sms_uri = "/msg/HttpBatchSendSM";
char *query_balance_uri = "/msg/QueryBalance";

/**
* 发http post请求
*/
ssize_t http_post(char *page, char *poststr)
{
    char sendline[MAXLINE + 1], recvline[MAXLINE + 1];
    ssize_t n;
    snprintf(sendline, MAXSUB,
        "POST %s HTTP/1.0\r\n"
        "Host: %s\r\n"
        "Content-type: application/x-www-form-urlencoded\r\n"
        "Content-length: %zu\r\n\r\n"
        "%s", page, hostname, strlen(poststr), poststr);

    write(basefd, sendline, strlen(sendline));
    while ((n = read(basefd, recvline, MAXLINE)) > 0) {
        recvline[n] = '\0';
        printf("%s", recvline);
    }
    return n;
}

/**
* 查账户余额
*/
ssize_t get_balance(char *account, char *password)
{
    char params[MAXPARAM + 1];
    char *cp = params;
    sprintf(cp,"account=%s&pswd=%s", account, password);
    return http_post(query_balance_uri, cp);
}

/**
* 发送短信
*/
ssize_t send_sms(char *account, char *password, char *mobile, char *msg)
{
    char params[MAXPARAM + 1];
    char *cp = params;
    sprintf(cp,"account=%s&pswd=%s&mobile=%s&msg=%s&needstatus=true&product=&extno=", account, password, mobile, msg);
    return http_post(send_sms_uri, cp);
}

int  socked_connect(char *arg)
{
    struct sockaddr_in their_addr = {0};  
    char buf[1024] = {0};  
    char rbuf[1024] = {0};  
    char pass[128] = {0};  
    struct hostent *host = NULL;   
    
    int sockfd = socket(AF_INET, SOCK_STREAM, 0);
    if(sockfd<0)
    {
        printf ("create the sockfd is failed\n");
        return -1;
    }
    
    if((host = gethostbyname(arg))==NULL)  
    {  
        printf("Gethostname error, %s\n");  
        return -1; 
    }  
 
    memset(&their_addr, 0, sizeof(their_addr));  
    their_addr.sin_family = AF_INET;  
    their_addr.sin_port = htons(80);  
    their_addr.sin_addr = *((struct in_addr *)host->h_addr);
    if(connect(sockfd,(struct sockaddr *)&their_addr, sizeof(struct sockaddr)) < 0)  
    {  
        close(sockfd);
        return  -1;
    }  
    printf ("connect is success\n");
    return sockfd;
    
}

int main(void)
{
    struct sockaddr_in servaddr;
    char str[50];
    
    #if 0
    //建立socket连接
    sockfd = socket(AF_INET, SOCK_STREAM, 0);
    bzero(&servaddr, sizeof(servaddr));
    servaddr.sin_addr =*(hostname);
    servaddr.sin_family = AF_INET;
    servaddr.sin_port = htons(80);
    inet_pton(AF_INET, str, &servaddr.sin_addr);
    connect(sockfd, (SA *) & servaddr, sizeof(servaddr));
    #endif
    
    if((basefd= socked_connect(hostname))==-1)
    {
        printf("connect is failed\n");
        return -1;
    }
    printf("basefd is =%d\n",basefd);
    //修改为您的创蓝账号
    char *account = "xxx";

    //修改为您的创蓝密码
    char *pswd = "xxx";

    //修改为您要发送的手机号
    char *mobile = "18000000000";

    //设置您要发送的内容
    char *message = "您好，您的验证码是123456";

    /**************** 查询余额 *****************/
   // get_balance(account, pswd);

    /**************** 发送短信 *****************/
    send_sms(account, pswd, mobile, message);
    printf("send the message is success\n");
    close(basefd);
    exit(0);
}