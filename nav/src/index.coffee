> ./route.js

export FUNC = new Map

< (callback) =>
  + now
  route (url)=>
    now = url
    args = FUNC.get url
    if args
      callback url, ...args
    return

  (url, args...)=>
    FUNC.set url, args
    if now == url
      callback url, ...args
    return
