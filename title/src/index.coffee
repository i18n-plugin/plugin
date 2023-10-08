+ HOST, SLOGAN

split = ' · '

export default setTitle = (title)=>
  document.title = title or (
    if title
    then title + split +  HOST
    else if SLOGAN then HOST + split + SLOGAN else HOST
  )
  return

< setHostSlogan = (host, slogan)=>
  HOST = host or location.host
  SLOGAN = slogan
  setTitle()
  return

