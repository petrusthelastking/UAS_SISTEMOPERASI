## TUGAS PROGRES UAS SISOP PROGRAM SELL
Nama: Petrus Tyang Agung Rosario
Absen: 21
Kelas: TI 1B
NIM: 2341720227


## TUGAS SC PROGRES FITUR

![code](https://github.com/petrusthelastking/UAS_SISTEMOPERASI/assets/143620112/442086e5-f197-4137-9086-6a56fde7a090)

- current_time=$(date +"%T"):<br>
perintah date untuk mendapatkan waktu saat ini dalam format tertentu. Di sini, %T adalah format untuk menampilkan waktu dalam format jam:menit (HH:MM). Hasilnya disimpan dalam variabel current_time.<br>

- echo "Jam saat ini: $current_time":<br>
Ini adalah perintah echo yang mencetak string "Jam saat ini: " diikuti oleh nilai variabel current_time, yang merupakan waktu saat ini yang telah didapatkan sebelumnya.<br>


![code2](https://github.com/petrusthelastking/UAS_SISTEMOPERASI/assets/143620112/5e523c6c-e108-453c-aecd-2be17dfe4782)


- echo "Penggunaan CPU saat ini:":<br>
Ini adalah perintah echo yang mencetak string "Penggunaan CPU saat ini:", memberikan tanda bahwa output yang akan ditampilkan adalah mengenai penggunaan CPU.<br>


- top -bn1:<br>
Ini adalah perintah yang digunakan untuk memeriksa penggunaan sumber daya sistem, di sini CPU. Opsi -bn1 menginstruksikan top untuk mengeksekusi hanya satu iterasi (-n1) dan keluar langsung (-b untuk batch mode, tanpa antarmuka interaktif). Ini berarti top akan memberikan output sekali dan kemudian keluar.<br>

- grep "Cpu(s)":<br>
Output dari top kemudian di-pipe ke perintah grep, yang digunakan untuk mencari baris yang mengandung string "Cpu(s)". Ini akan mengambil baris yang berisi informasi tentang penggunaan CPU.<br>

- sed "s/.*, *\([0-9.]*\)%* id.*/\1/":<br>
Output dari grep di-pipe ke perintah sed, yang digunakan untuk menghilangkan teks yang tidak diperlukan dan hanya mempertahankan angka yang mewakili persentase penggunaan CPU. Ekspresi reguler s/.*, *\([0-9.]*\)%* id.*/\1/ akan mencocokkan bagian yang berisi persentase penggunaan CPU dan mengambilnya.


![code3](https://github.com/petrusthelastking/UAS_SISTEMOPERASI/assets/143620112/1ba0e244-298d-47be-9b9e-55143891248c)


- echo "Penggunaan RAM saat ini:<br>
Ini adalah perintah echo yang mencetak string "Penggunaan RAM saat ini:", memberikan tanda bahwa output yang akan ditampilkan adalah mengenai penggunaan RAM.<br>

- awk '/^Mem:/ {print $3 "/" $2}':<br>
Output dari perintah free -h di-pipe ke perintah awk. Dalam awk, /^Mem:/ digunakan sebagai pola pencarian yang akan mencocokkan baris yang dimulai dengan "Mem:". Setelah baris tersebut ditemukan, perintah awk akan mencetak dua kolom dari baris tersebut, yaitu kolom ketiga (yang berisi jumlah RAM yang sedang digunakan) dan kolom kedua (yang berisi total jumlah RAM), dipisahkan oleh tanda "/" untuk menunjukkan penggunaan RAM dibandingkan dengan total kapasitasnya.<br>

## CONTOH OUTPUT DARI CODE DIATAS

![image](https://github.com/petrusthelastking/UAS_SISTEMOPERASI/assets/143620112/2d2954c1-d827-445b-820b-46eaaabda199)

![image](https://github.com/petrusthelastking/UAS_SISTEMOPERASI/assets/143620112/f5232a11-bbc2-4455-b7dc-0bf09c94f244)

![image](https://github.com/petrusthelastking/UAS_SISTEMOPERASI/assets/143620112/90e9897b-7697-45e1-be66-b0c51ede1e84)


