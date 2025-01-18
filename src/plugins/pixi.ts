import * as PIXI from 'pixi.js'
import { defineNuxtPlugin } from '#app'

export default defineNuxtPlugin((nuxtApp) => {
  console.log("PixiJS プラグインがロードされました:", PIXI)
  
  return {
    provide: {
      pixi: PIXI
    }
  }
})
