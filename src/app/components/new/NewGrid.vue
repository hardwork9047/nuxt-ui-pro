<template>
  <div class="p-4">
    <h1 class="text-2xl font-bold mb-4">等間隔に四角形のボタンを配置</h1>
    <div class="grid grid-cols-10 gap-4 p-4">
      <UButton 
        v-for="(item, index) in 100" 
        :key="index" 
        class="w-20 h-20 flex items-center justify-center border border-gray-300 shadow-md"
        color="gray"
        variant="solid"
        @click="handleClick(index)"
      >
        Box {{ index + 1 }}
      </UButton>
    </div>
  </div>
</template>

<script setup>
const handleClick = (index) => {
  alert(`Button ${index + 1} clicked!`);
};
</script>
