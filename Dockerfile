# stage 1 build

FROM node:18-alpine AS builder

WORKDIR /app

COPY backend/package*.json ./backend/

RUN cd backend && npm install

COPY backend ./backend
COPY frontend ./frontend

WORKDIR /app/backend

RUN npm run lint
RUN npm run test
RUN npm run build


# stage 2 runtime image

FROM node:18-alpine

WORKDIR /app

COPY --from=builder /app/backend/node_modules ./backend/node_modules
COPY --from=builder /app/backend ./backend
COPY --from=builder /app/frontend ./frontend

WORKDIR /app/backend

EXPOSE 3000

CMD ["npm","start"]