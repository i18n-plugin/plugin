<script lang="coffee">
+ f

nowFull = =>
  f = document.fullscreenElement
  return

click = =>
  if document.fullscreenElement
    p = document.exitFullscreen()
  else
    p = document.body.requestFullscreen navigationUI:'hide'
  try
    await p
  finally
    nowFull()
  return
</script>

<template lang="pug">
m-c(@click class:f=f title:>full)
</template>

<style lang="stylus">
m-c
  background-image var(--svgFull)

  &.f
    background-image var(--svgUnfull)
</style>

