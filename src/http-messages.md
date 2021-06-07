### Clients

* Always initiates requests to servers.
* Waits for replies.
* Receives replies.
* Usually connects to a small number of servers at one time.
* Usually interacts directly with end-users using any user interface such as graphical user interface.
### Server 
* Always wait for a request from one of the clients.
* Serves clients' requests then replies to the clients with the requested data.
* A server may communicate with other servers in order to serve a client request.
* If additional information is required to process a request (or security is implemented), a server may request additional data (passwords) from a client before processing a request.
*End users typically do not interact directly with a server, but use a client.

When you type in a www.facebook.com, your browser, called the **client**, fetches the address and sends a message to that computer. The computer we send it to is called the **server** and the message is a **request**. The **server** sends a **response** back to us. That **response** contains the **client app** which sends more **requests** to the **api** on the **server**.

This is what an Http Request message that wants the index.html file on server: 

```
GET /index.html HTTP/1.1
Host: www.facebook.com
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;
Accept-Language: en-US,en;q=0.9,en-GB;q=0.8
Accept-Encoding: gzip, deflate
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64)

```
(Note the blank line at the end.)

Http Message | Label | Explained
-------------|-------|-----------
`HTTP/1.1 200 OK` | `{Request Line}` | `f`
`Date: Sun, 18 Oct 2009 08:56:53 GMT` | `{Header}` | `f`


This is an Http Response message that represents the index.html file:

```


Server: Apache/2.2.14 (Win32)
Last-Modified: Sat, 20 Nov 2004 07:16:26 GMT
ETag: "10000000565a5-2c-3e94b66c2e680"
Accept-Ranges: bytes
Content-Length: 125
Connection: close
Content-Type: text/html
X-Pad: avoid browser bug
  
<html>
    <head>
        <title>Welcome</title>
    </head>
    <body>
        <h1>It works!</h1>
    </body>
</html>
```


Request message format:

```
{Request Line}
{Header}
{Header}
{Header}
{...}
 
{Body} 
```


Response message format:

```
{Status Line}
{Header}
{Header}
{Header}
{...}
 
{Body} 
```