<template>
  <div class="button-container">
    <el-button type="primary" round class="large-button" @click="openAddBookDialog">添加</el-button>
    <el-button type="success" round class="large-button" @click="openFindBookDialog">查找</el-button>
    <el-button type="warning" round class="large-button" @click="openUpdateBookDialog">更改</el-button>
    <el-button type="danger" round class="large-button" @click="openDeleteBookDialog">删除</el-button>
  </div>

  <!-- 使用 AddBook 组件 -->
  <AddBook ref="addBookDialog" />

  <!-- 使用 FindBook 组件 -->
  <FindBook ref="findBookDialog" />

  <!-- 使用 DeleteBook 组件 -->
  <DeleteBook ref="deleteBookDialog" />

  <!-- 使用 UpdateBook 组件 -->
  <updateBook ref="updateBookDialog" />
</template>

<script lang="ts" setup>
import { ref } from 'vue';
import AddBook from './AddBook.vue'; // 导入 AddBook 组件
import DeleteBook from './DeleteBook.vue'; // 导入 DeleteBook 组件
import FindBook from './FindBook.vue';      // 导入 FindBook 组件
import UpdateBook from "./UpdateBook.vue"; // 导入 UpdateBook 组件


// 获取 AddBook 和 DeleteBook 组件的引用
const addBookDialog = ref();
const deleteBookDialog = ref();
const findBookDialog = ref();
const updateBookDialog = ref();


// 打开添加新书的弹窗
const openAddBookDialog = () => {
  addBookDialog.value.openDialog();
};

const openFindBookDialog = () => {
  findBookDialog.value.openDialog();
}
// 打开删除书的弹窗
const openDeleteBookDialog = () => {
  deleteBookDialog.value.openDialog();
};

const openUpdateBookDialog = () => {
  updateBookDialog.value.openDialog();
}
</script>

<style scoped>
.button-container {
  display: flex;
  justify-content: center; /* 水平居中 */
  align-items: center; /* 垂直居中 */
  height: 10vh; /* 使容器占满整个视口高度 */
}

.large-button {
  font-size: 20px; /* 调整字体大小 */
  padding: 5px 15px; /* 调整内边距 */
  margin: 10px; /* 调整按钮之间的间距 */
}
</style>