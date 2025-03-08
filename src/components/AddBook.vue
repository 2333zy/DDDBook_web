<template>
  <!-- 添加新书的弹窗 -->
  <el-dialog v-model="dialogVisible" title="添加新书" width="30%">
    <el-form :model="bookForm" label-width="80px">
      <el-form-item label="书名">
        <el-input v-model="bookForm.name" placeholder="请输入书名"/>
      </el-form-item>
      <el-form-item label="作者">
        <el-input v-model="bookForm.author" placeholder="请输入作者"/>
      </el-form-item>
      <el-form-item label="日期">
        <el-date-picker
            v-model="bookForm.date"
            type="date"
            placeholder="选择日期"
            value-format="YYYY-MM-DD"
        />
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
  name: '',
  author: '',
  date: '',
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
    name: '',
    author: '',
    date: '',
  };
};

const submitForm = async () => {
  if (!bookForm.value.name || !bookForm.value.author || !bookForm.value.date) {
    ElMessage.warning('请填写完整信息');
    return;
  }

  console.log('添加的新书信息：', bookForm.value);
  try {
    const response = await axios.post('/book', bookForm.value);
    console.log('响应数据:', response.data);
    closeDialog();
    ElMessage.success('添加成功');
  } catch (error) {
    ElMessage.error('请求失败');
    console.error('请求失败:', error);
  }
};

defineExpose({
  openDialog,
});
</script>