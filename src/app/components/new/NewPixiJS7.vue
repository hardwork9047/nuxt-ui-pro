<script setup lang="ts">
import * as PIXI from 'pixi.js'
import { onMounted, ref } from 'vue'
const cv = ref()
const createPixiApp = (_canvas: HTMLCanvasElement) => {
  const canvas = _canvas
  canvas.getContext('webgl', {
    preserveDrawingBuffer: true,
    stencil: true
  })
  return new PIXI.Application({
    antialias: true,
    autoDensity: true,
    resizeTo: window,
    view: canvas,
    backgroundColor: 0x000000
  })
}
onMounted(() => {
  const pixiApp = createPixiApp(cv.value)
  const sprite = PIXI.Sprite.from('./src/assets/icon.png')
  sprite.anchor.set(0.5)
  pixiApp.stage.addChild(sprite)
  pixiApp.ticker.add((delta: number) => {
    sprite.rotation += delta * 0.01
    sprite.x = pixiApp.screen.width / 2
    sprite.y = pixiApp.screen.height / 2
  })
})
</script>
<template>
  <div id="pixi-wrapper">
    <canvas id="pixi-container" ref="cv"></canvas>
  </div>
</template>

<style scoped lang="less">
#pixi-wrapper,
#pixi-container {
  width: 100%;
  height: 100%;
}
</style>
