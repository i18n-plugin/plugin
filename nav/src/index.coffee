> ./route.js:@ > nowUrl

export FUNC = new Map

< (callback) =>
  route (url)=>
    args = FUNC.get url
    if args
      callback url, ...args
    return

  (url, args...)=>
    FUNC.set url, args
    console.log nowUrl(), url
    if nowUrl() == url
      callback url, ...args
    return
