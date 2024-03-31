# Gunakan image node:18-alpine sebagai base image
FROM node:18-alpine

# Set direktori kerja di dalam container menjadi /src
WORKDIR /src

# Salin semua file dari direktori host ke dalam direktori kerja di dalam container
COPY . .

# Install dependensi dari package-lock.json
RUN npm ci

# Install dependensi dari package.json
RUN npm install

# Tambahkan bash ke dalam container untuk menjalankan skrip
RUN apk add --no-cache bash

# Unduh skrip wait-for-it.sh dari repositori GitHub
RUN wget -O /bin/wait-for-it.sh https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh

# Berikan izin eksekusi untuk skrip wait-for-it.sh
RUN chmod +x /bin/wait-for-it.sh

# Ekspos port 3000 untuk koneksi luar
EXPOSE 3000

# Perintah yang akan dijalankan ketika container dijalankan
CMD ["node", "index.js"]
