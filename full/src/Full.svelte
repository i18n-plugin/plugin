<script lang="coffee">
> @8n/on:On

+ f

click = =>
  if document.fullscreenElement
    document.exitFullscreen()
  else
    document.body.requestFullscreen navigationUI:'hide'
  return

onMount =>
  On document,{
    fullscreenchange:=>
      f = document.fullscreenElement
      return
  }
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

