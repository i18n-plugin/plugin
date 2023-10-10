> ./Body.svelte

< =>
  b = document.createElement 'b'
  new Body({
    target: b
  })
  document.body.appendChild(b)
  return

