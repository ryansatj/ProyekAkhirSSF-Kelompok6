# ProyekAkhirSSF-Kelompok6 | SECURITY SYSTEM SENSOR

## Introduction to the problem and the solution
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


## Hardware design and implementation details
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
    
## Software implementation details
## Test results and performance evaluation
## Conclusion and future work



