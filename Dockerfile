#Docker akan mengunduh/mengambil base image bernama node dari Docker Hub
#dengan tag 4.21.3-alpine3.17, ini versi spesifik dari Node.js yang menggunakan Alpine Linux.
FROM node:14.21.3-alpine3.17

#membuat directory baru bernama app dan menjadikannya sebagai working directory.
#Dengan begitu, instruksi apa pun yang kita tulis di baris berikutnya, akan dieksekusi di dalam directory /app ini.
WORKDIR /app

#Menyalin semua source yang ada di working directory local ke working directory container yakni /app.
COPY . .

#mengeset envitorment yang dibutuhkan oleh aplikasi.
ENV NODE_ENV=production DB_HOST=item-db

#menjalankan perintah saat proses pembuatan image, npm install dijalankan untuk menginstal semua
#dependensi proyek yang terdaftar dalam file package.json. Kemudian, perintah npm run build dijalankan untuk
#membangun aplikasi sesuai dengan instruksi yang didefinisikan dalam skrip "build" di file package.json.
RUN npm install --production --unsafe-perm && npm run build

#intruksi untuk mengekspos port pada container
EXPOSE 8080

#mengeksekusi perintah saat Docker image telah dijalankan sebagai container.
CMD [ "npm", "run", "start" ]