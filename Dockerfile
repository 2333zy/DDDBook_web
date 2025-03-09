# 使用官方的 nginx 镜像作为基础镜像
FROM nginx:latest

# 设置维护者信息（可选）
LABEL maintainer="your-email@example.com"

# 将本地的静态文件复制到容器中的 /usr/share/nginx/html 目录
COPY ./dist /usr/share/nginx/html

# 将本地的 Nginx 配置文件复制到容器中，替换默认配置
COPY ./nginx.conf /etc/nginx/nginx.conf

# 暴露 80 端口
EXPOSE 80

# 启动 Nginx
CMD ["nginx", "-g", "daemon off;"]