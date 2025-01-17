<script setup>
import { onMounted, ref, nextTick, onUnmounted } from 'vue'
import * as PIXI from 'pixi.js'

const pixiContainer = ref(null)
let app = null

onMounted(async () => {
  await nextTick() // Vueのレンダリング完了を待つ

  console.log("Pixiコンテナ:", pixiContainer.value)

  if (!pixiContainer.value) {
    console.error("Pixi container is not available")
    return
  }

  try {
    // Pixi アプリケーションの作成（背景を緑色に設定）
    app = new PIXI.Application({
      width: 800,
      height: 600,
      backgroundColor: 0x00FF00, // 背景を緑色 (0x00FF00)
      antialias: true, // アンチエイリアスを有効化
      autoDensity: true, // 高解像度対応
      resizeTo: window, // ウィンドウサイズに自動調整
    })

    console.log("PixiJSのCanvas要素:", app.view)

    if (!app.view) {
      throw new Error("PixiJS の `canvas` 要素が正しく作成されませんでした")
    }

    // PixiJSのキャンバスをDOMに追加
    pixiContainer.value.appendChild(app.view)

    // **白色の円を描画**
    const whiteCircle = new PIXI.Graphics()
    whiteCircle.beginFill(0xFFFFFF) // 白色 (0xFFFFFF)
    whiteCircle.drawCircle(200, 200, 50) // (x, y, 半径)
    whiteCircle.endFill()
    app.stage.addChild(whiteCircle)

    // **白色の四角形を描画**
    const whiteRectangle = new PIXI.Graphics()
    whiteRectangle.beginFill(0xFFFFFF) // 白色 (0xFFFFFF)
    whiteRectangle.drawRect(400, 200, 100, 100) // (x, y, 幅, 高さ)
    whiteRectangle.endFill()
    app.stage.addChild(whiteRectangle)

    console.log("白色の図形が追加されました:", app.stage.children.length)

  } catch (error) {
    console.error("PixiJS 初期化中にエラーが発生:", error)
  }
})

// コンポーネントが破棄されたときに PixiJS のリソースを解放
onUnmounted(() => {
  if (app) {
    app.destroy(true, { children: true, texture: true, baseTexture: true })
    app = null
    console.log("PixiJS アプリケーションをクリーンアップしました")
  }
})
</script>

<template>
  <client-only>
    <div class="flex items-center justify-center h-screen">
      <div ref="pixiContainer" class="w-[800px] h-[600px] border border-red-500"></div>
    </div>
  </client-only>
</template>
