FROM node:16.15.1 as build

# 设置工作目录
WORKDIR /usr/src/app

# 将本地的 Vite 项目文件复制到工作目录
COPY . .

ENV NODE_OPTIONS=--max-old-space-size=4096
# 安装依赖
RUN yarn install

# 执行 Vite 构建命令，生成 dist 目录
RUN yarn build

# ---------------------
FROM nginx:latest

# 将 Vite 项目的 dist 目录复制到 Nginx 的默认静态文件目录
COPY --from=build /usr/src/app/dist /usr/share/nginx/html

# 暴露容器的 80 端口
EXPOSE 80
