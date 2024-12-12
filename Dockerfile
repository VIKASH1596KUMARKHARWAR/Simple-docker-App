# FROM node:20

# WORKDIR /app

# COPY . .

# RUN npm install
# RUN npx prisma generate
# RUN npm run build

# EXPOSE 3000

# CMD ["node", "dist/index.js"] 


# //optimising >> unless package.json/lock.json changes lets make all cached as npm install is an expensive step,.......so its cached down to the image build step Unless change in db/prisma or either the package.json/lockjson file, if , then we can run npm install and npx prisma generate



FROM node:20

WORKDIR /usr/src/app

COPY package* .
COPY ./prisma .

RUN npm install
RUN npx prisma generate

COPY . .
RUN npm run build


EXPOSE 3000

CMD ["node", "dist/index.js", ]
