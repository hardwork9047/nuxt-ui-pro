<template>
  <canvas ref="myCanvas" width="400" height="300"></canvas>
</template>

<script setup>
import { onMounted, ref } from "vue";

const myCanvas = ref(null);

onMounted(() => {
  const canvas = myCanvas.value;
  if (!canvas) return;

  const ctx = canvas.getContext("2d");

  // 例: 赤い四角形を描画
  ctx.fillStyle = "red";
  ctx.fillRect(50, 50, 100, 100);
});
</script>

<style scoped>
canvas {
  border: 1px solid black;
}
</style>
