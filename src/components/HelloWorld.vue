<script setup>
import {Check, Delete, Edit, Message, Search, Star} from "@element-plus/icons-vue";
import TestTable from "@/components/TestTable.vue";

defineProps({
  msg: {
    type: String,
    required: true,
  },
})
</script>

<template>
  <div class="greetings">
    <h1 class="green">{{ msg }}</h1>
  </div>
</template>

<style scoped>

</style>
