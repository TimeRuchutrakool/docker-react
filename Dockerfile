# เราจะ สร้าง dockerfile ที่มี multi-step build process
# Build Phase                   Run Phase
# use node:alpine               use nginx
# copy package.json file        copy over the result of 'npm run build' (just build folder)
# install depts                 start nginx
# run 'npm run build' 

FROM alpine