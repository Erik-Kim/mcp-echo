# 빌드 스테이지
FROM node:20-slim AS builder

WORKDIR /app

# 패키지 파일 복사 및 의존성 설치
COPY package*.json ./
RUN npm install

# 소스 코드 복사 및 빌드
COPY tsconfig.json ./
COPY src ./src
RUN npm run build

# 실행 스테이지
FROM node:20-slim

WORKDIR /app

# 프로덕션 의존성만 설치
COPY package*.json ./
RUN npm install --production

# 빌드된 파일 복사
COPY --from=builder /app/dist ./dist

# 실행 권한 설정
RUN chmod 755 ./dist/index.js

# 실행
CMD ["node", "dist/index.js"]
