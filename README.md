**403**
Tool to bypass 403/401. This script contain all the possible techniques to do the same. 

**NOTE** : If you see multiple [200 Ok]/bypasses as output, you must check the Content-Length. If the content-length is same for multiple [200 Ok]/bypasses means false positive. reason of false positive may be 301/302 or ../ DON'T PANIC.
**NOTE** : If you see multiple [200 Ok]/bypasses as output, you must check the Content-Length. If the content-length is same for multiple [200 Ok]/bypasses means false positive. Reason can be "301/302" or "../" [Payload] DON'T PANIC.

## Usage
```
root@dksoni27:$ bash 403.sh https://target.com/secret
```
