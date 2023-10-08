> ./route.js:@ > nowUrl
  @w5/split

export FUNC = new Map

split_slash = (url)=>
  split(url,'/')[0]

< (callback) =>


  notFound = =>

  route (url)=>
    args = FUNC.get split_slash(url)
    if args
      callback url, ...args
      return
    notFound()
    return

  [
    # set route
    (url, args...)=>
      FUNC.set url, args
      if split_slash(nowUrl()) == url
        callback url, ...args
        notFound = 0
      return

    # clear route
    =>
      FUNC.clear()
      notFound = 1
      return

    # set no found
    (func)=>
      if notFound
        func()
      notFound = func
      return
  ]
