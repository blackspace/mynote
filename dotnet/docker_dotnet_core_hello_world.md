Docker .net core Hello World
----------------------------------------------------------

下载dotnet


```
apple@apple-System:~$ docker pull microsoft/dotnet 
Using default tag: latest
latest: Pulling from microsoft/dotnet
386a066cd84a: Already exists 
75ea84187083: Already exists 
88b459c9f665: Already exists 
284c56fa54c0: Pull complete 
3459b6d26b62: Verifying Checksum 
bb628059646f: Download complete 
latest: Pulling from microsoft/dotnet
386a066cd84a: Already exists 
75ea84187083: Already exists 
88b459c9f665: Already exists 
284c56fa54c0: Pull complete 
3459b6d26b62: Pull complete 
bb628059646f: Pull complete 
Digest: sha256:781340e9a356ca6a5ccccce423e4d44fefab2df2badec703393f258bec6d8903
Status: Downloaded newer image for microsoft/dotnet:latest
apple@apple-System:~$
````

hello world 

```
apple@apple-System:~$ docker run -it --cap-add ALL --rm microsoft/dotnet
root@158afb8a0d7e:/# mkdir app
root@158afb8a0d7e:/# cd app
root@158afb8a0d7e:/app# dotnet net
No executable found matching command "dotnet-net"
root@158afb8a0d7e:/app# dotnet new
Created new C# project in /app.
root@158afb8a0d7e:/app# ls
Program.cs  project.json
root@158afb8a0d7e:/app# dotnet restore
log  : Restoring packages for /app/project.json...
log  : Writing lock file to disk. Path: /app/project.lock.json
log  : /app/project.json
log  : Restore completed in 2773ms.
root@158afb8a0d7e:/app# dotnet run
Project app (.NETCoreApp,Version=v1.1) will be compiled because expected outputs are missing
Compiling app for .NETCoreApp,Version=v1.1

Compilation succeeded.
    0 Warning(s)
    0 Error(s)

Time elapsed 00:00:04.2635138
 

Hello World!
root@158afb8a0d7e:/app# ls
Program.cs  bin  obj  project.json  project.lock.json
root@158afb8a0d7e:/app# cat Program.cs 
using System;

namespace ConsoleApplication
{
    public class Program
    {
        public static void Main(string[] args)
        {
            Console.WriteLine("Hello World!");
        }
    }
}
root@158afb8a0d7e:/app# 

```