<template>
    <el-carousel :interval="4000" type="card" height="100vh">
      <el-carousel-item v-for="item in tableData">
        <h3 class="medium"> 
          <a :href="item.uri" target="_blank">
            <img :src="`/imgs/${item.image}`" :alt="item.name" :title="item.name" style="font-family: 'Courier New', Courier, monospace;">
          </a>
        </h3>
      </el-carousel-item>
    </el-carousel>
</template>

<style>
    .el-carousel__item h3 {
      color: #475669;
      font-size: 14px;
      opacity: 0.75;
      line-height: 200px;
      margin: 0;
      width: 100%;
      height: 100%;
    }

    .el-carousel__item h3 img {
      object-fit: cover;
      width: 100%;
      height: 100%;
    }
  
    .el-carousel__item:nth-child(2n) {
      background-color: #99a9bf;
    }
  
    .el-carousel__item:nth-child(2n+1) {
      background-color: #d3dce6;
    }
</style>

<script lang="ts" setup>

import { ref } from 'vue';

// 使用 ref 来创建响应式变量
const ChatGPT = ref(import.meta.env.VITE_APP_CHATGPT_URI);
const ComfyUI = ref(import.meta.env.VITE_APP_ComfyUI_URI);

// 定义items数据, 为一个数组，包含6张图片的链接
const tableData = [
    {
        name: "ChatGPT",
        image: "jinx.png",
        uri: ChatGPT.value,
    },
    {
        name: "ComfyUI",
        image: "black_girl.png",
        uri: ComfyUI.value,
    },
    {
        name: "ComfyUI",
        image: "pink_hear.jpg",
        uri: ComfyUI.value,
    },
]
</script>