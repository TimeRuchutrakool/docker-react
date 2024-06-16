# เราจะ สร้าง dockerfile ที่มี multi-step build process
# Build Phase                   Run Phase
# use node:alpine               use nginx
# copy package.json file        copy over the result of 'npm run build' (just build folder)
# install depts                 start nginx
# run 'npm run build' 

FROM node:16-alpine as builder

WORKDIR /app

COPY package.json .

RUN npm run install

COPY . .

RUN npm run build

# /app/build -> all the stuff we need

FROM nginx
# saying that i want to copy something from the other phase that we hust working on [copy folder build จาก phase builder ไปวางใน /nginx/html]
COPY --from=builder /app/build /usr/share/nginx/html
# มัน start nginx auto ละไม่ต้องใส่ command