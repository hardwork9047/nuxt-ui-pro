<template>
  <canvas ref="myCanvas" width="400" height="300"></canvas>
</template>

<script setup>
import { onMounted, ref } from "vue";

const myCanvas = ref(null);
let ctx = null;
let x = 0;

onMounted(() => {
  if (myCanvas.value) {
    ctx = myCanvas.value.getContext("2d");
    animate();
  }
});

const animate = () => {
  if (!ctx) return;

  ctx.clearRect(0, 0, 400, 300); // キャンバスをクリア
  ctx.fillStyle = "green";
  ctx.fillRect(x, 100, 50, 50); // 四角形を描画

  x += 2; // 移動
  if (x > 400) x = 0; // 画面外に出たらリセット

  requestAnimationFrame(animate); // 次のフレームを予約
};
</script>

<style scoped>
canvas {
  border: 1px solid black;
}
</style>
