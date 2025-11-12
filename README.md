# browser_leaks.cr
Web-API for [browserleaks.com](https://browserleaks.com/) a suite of tools that offers a range of tests to evaluate the security and privacy of your web browser

## Example
```cr
require "./browser_leaks"

browser_leaks = BrowserLeaks.new
ip_info = browser_leaks.get_ip_info("192.168.1.1")
puts ip_info
```
