<template>
  <!-- 删除书的弹窗 -->
  <el-dialog v-model="dialogVisible" title="查找书" width="30%">
    <el-form :model="bookForm" label-width="80px">
      <el-form-item label="书id">
        <el-input v-model="bookForm.book_id" placeholder="请输入书id"/>
      </el-form-item>
    </el-form>
    <template #footer>
      <el-button @click="closeDialog">取消</el-button>
      <el-button type="primary" @click="submitForm">确认</el-button>
    </template>
  </el-dialog>
</template>

<script lang="ts" setup>
import {ref} from 'vue';
import {ElMessage} from 'element-plus';
import axios from "axios";

const dialogVisible = ref(false);
const bookForm = ref({
  book_id: '',
});

const openDialog = () => {
  dialogVisible.value = true;
};

const closeDialog = () => {
  dialogVisible.value = false;
  resetForm();
};

const resetForm = () => {
  bookForm.value = {
    book_id: '',
  };
};

const submitForm = async() => {
  if (!bookForm.value.book_id) {
    ElMessage.warning('请输入书id');
    return;
  }

  console.log('查找的书信息：', bookForm.value);
  try {
    const response = await axios.get('/book/' + bookForm.value.book_id)
    console.log('响应数据', response.data);
    closeDialog();
    ElMessage.success('查找成功')
  } catch (error) {
    ElMessage.error('请求失败');
    console.log('请求失败', error)
  }
};



defineExpose({
  openDialog,
});
</script>