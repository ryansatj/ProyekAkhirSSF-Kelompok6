# ProyekAkhirSSF-Kelompok6 | SECURITY SYSTEM SENSOR

## Anggota Kelompok:
1. Muhammad Daffa Rizkyandri (2206829194)
2. Raja Yonandro Ruslito     (2206059553)
3. Ryan Safa Tjendana        (2206826835)
4. Yasmin Devina Sinuraya    (2206817244)

## Introduction To The Problem and The Solution
Keamanan rumah dan properti merupakan aspek penting dalam kehidupan sehari-hari.
Banyak orang mencari cara efektif untuk melindungi rumah mereka dari pencurian atau intrusi,
dan salah satu solusi yang banyak digunakan adalah sistem keamanan berbasis sensor yang dapat
mendeteksi pergerakan mencurigakan dan memberikan peringatan dini kepada pemilik rumah.
Keamanan rumah sering kali terganggu oleh pencurian dan intrusi yang tidak terdeteksi serta
keterbatasan sistem keamanan konvensional yang seringkali mahal dan rumit untuk dipasang serta
dioperasikan. Berdasarkan latar belakang dan identifikasi masalah tersebut, permasalahan yang
akan dipecahkan dalam program Arduino "Security System Sensor" adalah bagaimana merancang
dan mengimplementasikan sistem keamanan yang sederhana dan efektif menggunakan sensor PIR
untuk mendeteksi pergerakan, bagaimana memprogram Arduino untuk memproses sinyal dari
sensor PIR dan mengaktifkan buzzer sebagai alarm ketika mendeteksi pergerakan mencurigakan,
dan bagaimana memastikan bahwa sistem ini dapat berfungsi dengan baik dalam kondisi
lingkungan yang berbeda serta meminimalkan kesalahan deteksi (false alarm).

Tujuan dari program Arduino "Security System Sensor" ini adalah mengembangkan sistem
keamanan rumah yang menggunakan sensor PIR untuk mendeteksi pergerakan, meningkatkan
keamanan dengan memberikan peringatan dini melalui bunyi buzzer ketika mendeteksi pergerakan
yang mencurigakan, dan menyediakan solusi keamanan yang mudah diimplementasikan dan
terjangkau bagi pemilik rumah.

Implementasi dari program ini diharapkan dapat memberikan beberapa manfaat, antara lain
meningkatkan rasa aman dan nyaman bagi pemilik rumah, menyediakan sistem keamanan yang
efisien dan terjangkau, serta memudahkan pemantauan dan deteksi dini terhadap potensi ancaman
keamanan. Proyek ini akan mencakup pemilihan dan konfigurasi hardware seperti Arduino, sensor
PIR, dan buzzer, pengembangan kode program untuk Arduino yang mampu mengintegrasikan
sensor PIR dan buzzer, serta pengujian dan evaluasi sistem dalam berbagai kondisi untuk
memastikan keandalannya. Dengan demikian, proposal solusi ini diharapkan dapat memberikan
gambaran yang jelas mengenai tujuan dan langkah-langkah yang akan diambil dalam
pengembangan sistem keamanan berbasis sensor PIR menggunakan Arduino.


## Hardware Design and Implementation Details
Komponen yang dibutuhkan dalam mendesain dan merangkai skema alat serta fungsinya dalam rangkaian antara lain adalah :
1) Dua buah Arduino UNO

   • Arduino UNO (Master)
   Berfungsi sebagai pengendali utama yang memproses sinyal dari sensor PIR. Ketika sensor PIR mendeteksi pergerakan, Arduino Master akan mengirimkan sinyal ke Arduino Slave.

   • Arduino UNO (Slave)
   Berfungsi untuk menerima sinyal dari Arduino Master dan mengendalikan perangkat output seperti LED dan buzzer. Arduino Slave mengaktifkan LED merah dan buzzer ketika pergerakan terdeteksi dan mengaktifkan LED hijau
   ketika tidak ada pergerakan.
   
3) Satu buah Sensor PIR
   Sensor PIR (Passive Infrared Sensor) digunakan untuk mendeteksi pergerakan di sekitarnya. Sensor ini mengirimkan sinyal ke Arduino Master ketika mendeteksi adanya pergerakan. Sensor PIR biasanya memiliki tiga pin: Vcc
   (power supply), GND (ground), dan OUT (output signal).
   
5) Satu buah Relay
   Relay digunakan sebagai saklar elektronik yang diaktifkan oleh sinyal dari Arduino Slave. Relay ini mengendalikan perangkat eksternal yang memerlukan arus lebih besar daripada yang bisa disediakan langsung oleh pin
   Arduino. Dalam konteks ini, relay dapat digunakan untuk mengendalikan sistem keamanan yang lebih besar atau perangkat lainnya yang terhubung.
   
7) Satu buah Buzzer
   Buzzer digunakan sebagai alarm untuk memberikan peringatan suara ketika sensor PIR mendeteksi pergerakan. Buzzer diaktifkan oleh sinyal dari Arduino Slave setelah menerima sinyal dari Arduino Master.
   
9) Satu buah LED Hijau
    LED hijau digunakan sebagai indikator bahwa tidak ada pergerakan yang terdeteksi oleh sensor PIR. LED ini diaktifkan oleh Arduino Slave sebagai bagian dari umpan balik visual untuk menunjukkan kondisi aman.
   
11) Satu buah LED Merah
    LED merah digunakan sebagai indikator bahwa pergerakan telah terdeteksi oleh sensor PIR. LED ini diaktifkan oleh Arduino Slave ketika menerima sinyal dari Arduino Master setelah sensor PIR mendeteksi pergerakan,
    memberikan umpan balik visual bahwa ada pergerakan yang terdeteksi.
    
13) Satu buah Button
    Button digunakan sebagai indikator apabila situasi sudah aman dan bertujuan untuk mematikan Buzzer yang sebelumnya dijadikan sebagai alarm dan melakukan reset agar rangkaian dapat melakukan tugasnya kembali.

Sehingga pada rangkaian fisik, Arduino Master akan terhubung oleh sensor PIR dan Arduino Slave terhubung dengan Buzzer, LED merah, LED hijau, dan Relay Module. Dan pastinya Ardunio Master dan Arduino Slave juga saling terhubung satu sama lain.
    
## Software Implementation Details
Pertama-tama, Arduino Master akan menerima data yang diterima dari sensor PIR (sensor gerak). Jika sensor PIR tidak mendeteksi pergerakan (not triggered), maka hanya data low (0) akan dikirimkan dari Arduino Master ke Arduino Slave agar LED hijau menyala dan Arduino Master akan terus membaca data dari sensor PIR. Tetapi jika sensor PIR  mendeteksi pergerakan (triggered), maka data high (1) akan dikirimkan dari Arduino Master ke Arduino Slave, di mana data high ini akan meng-trigger LED merah, Buzzer, dan Door Lock.  
Selanjutnya program akan mengecek apakah Button Reset ditekan atau tidak. Jika ditekan maka proses konfigurasi Master dan Slave akan dilakukan kembali. Tetapi jika Button Reset tidak ditekan, maka LED merah, Buzzer, dan Door Lock akan terus menyala. 

Secara singkat, program akan menyalakan LED hijau jika tidak ada pergerakan, dan akan menyalakan LED merah, Buzzer, serta Door Lock jika PIR mendeteksi adanya pergerakan. 

Karena terdapat 2 Arduino yang akan dijadikan Master dan Slave, maka terdapat code Assembly masing-masing untuk Arduino Master dan Arduino Slave. Kami menggunakan Proteus untuk membuat rangkaian digital dan untuk melakukan test pada code Assembly yang dibuat. 

## Test results and performance evaluation
1) Pengujian Rangkaian Pada Proteus
   Pada saat code Assembly untuk Master dan Slave dijalankan di Proteus, program berjalan seperti tujuan dari program ini. Di mana LED hijau akan menyala jika PIR tidak mendeteksi adanya pergerakan, dan LED merah serta Buzzer akan menyala jika PIR mendeteksi adanya pergerakan.
   
2) Pengujian Pada Rangkaian Fisik
   Pada saat melakukan pengujian di rangkaian fisik, terdapat beberapa hal yang terjadi:
   a. Sensor PIR tidak bisa mendeteksi perubahan radiasi dengan sensitivitas dan delay time yang dapat diatur secara langsung dan dinamis.
   b. Arduino Master mengalami sedikit kerusakan, yang mengakibatkan Arduino Slave tidak bisa menerima data yang dikirim oleh Arduino Master.
   c. LED dan Buzzer dapat menyala, tetapi keduanya harus terisolasi dari Arduino Master.
   d. Buzzer sepertinya mengalami korslet yang membuat suara Buzzer menjadi kecil. 

   Karena keempat hal tersebut, hasil uji pada rangkaian fisik tidak sesuai tujuan program ini. 

## Conclusion and Future Work
Kesimpulan yang dapat ditarik dari proyek “Security Sensor System” yang dibuat
menggunakan mikrokontroler ATmega328P, sensor PIR, Buzzer, Relay, dan LED ini adalah
program ini memberikan solusi yang sederhana untuk menjadi sebuah alat untuk mendeteksi
adanya kejanggalan yang terdapat pada suatu ruangan. Program ini dapat beroperasi secara kontinu
untuk memeriksa status inframerah dari sensor PIR. Ketika terdapat gerakan yang tidak biasa
terdeteksi, Buzzer dan LED akan menyala memberikan indikasi audio dan visual. Namun, apabila
tidak terdapat gerakan yang terdeteksi, Buzzer dan LED akan tetap berada dalam kondisi non-
aktif.

Integrasi sensor PIR memberikan deteksi gerakan yang andal, membuat sistem ini sangat
tanggap terhadap setiap gerakan di dalam area yang dipantau. Buzzer dan LED berfungsi sebagai
mekanisme peringatan yang efisien, dengan cepat menginformasikan pengguna tentang potensi
pelanggaran keamanan atau perubahan kondisi ruangan. Fleksibilitas komponen perangkat keras
seperti breadboard, kabel jumper, dan konektor daya memudahkan perakitan, modifikasi, dan
pengujian sistem keamanan. Hal ini menjadikannya cocok untuk pembuatan prototipe dan
implementasi dalam skenario nyata. Secara keseluruhan, Room Security System menawarkan
solusi yang ekonomis dan mudah diakses untuk meningkatkan keamanan ruangan.



