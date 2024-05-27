#!/bin/bash

# Fungsi untuk menampilkan menu
show_menu() {
    echo "========================"
    echo "   File Management"
    echo "========================"
    echo "1. Buat Direktori"
    echo "2. Pindahkan File"
    echo "3. Ganti Nama File"
    echo "4. Hapus File"
    echo "5. Hapus Direktori"
    echo "6. Salin File"
    echo "7. Salin Direktori"
    echo "8. Tampilkan Isi File"
    echo "9. Buat File"
    echo "10. Buat Isi File"
    echo "11. Tampilkan Isi File yang Telah Diisi"
    echo "12. Lihat Direktori"
    echo "13. Lihat Jam"
    echo "14. Lihat Penggunaan CPU"
    echo "15. Lihat Penggunaan RAM"
    echo "16. Keluar"
    echo "========================"
}

# Fungsi untuk membuat direktori
create_directory() {
    read -p "Masukkan nama direktori: " dir_name
    if [ -d "$dir_name" ]; then
        echo "Direktori '$dir_name' sudah ada."
    else
        mkdir -p "$dir_name"
        echo "Direktori '$dir_name' telah dibuat."
    fi
}

# Fungsi untuk memindahkan file
move_file() {
    read -p "Masukkan path file yang akan dipindahkan: " source
    read -p "Masukkan direktori tujuan: " destination
    if [ -f "$source" ]; then
        if [ -d "$destination" ]; then
            mv "$source" "$destination"
            echo "File telah dipindahkan ke $destination."
        else
            echo "Direktori tujuan tidak ada."
        fi
    else
        echo "File sumber tidak ada."
    fi
}

# Fungsi untuk mengganti nama file
rename_file() {
    read -p "Masukkan path file yang akan diganti namanya: " old_name
    read -p "Masukkan nama baru: " new_name
    if [ -f "$old_name" ]; then
        mv "$old_name" "$new_name"
        echo "File '$old_name' telah diganti nama menjadi '$new_name'."
    else
        echo "File '$old_name' tidak ada."
    fi
}

# Fungsi untuk menghapus file
delete_file() {
    read -p "Masukkan path file yang akan dihapus: " file_name
    if [ -f "$file_name" ]; then
        rm -f "$file_name"
        echo "File '$file_name' telah dihapus."
    else
        echo "File '$file_name' tidak ada."
    fi
}

# Fungsi untuk menghapus direktori
delete_directory() {
    read -p "Masukkan path direktori yang akan dihapus: " dir_name
    if [ -d "$dir_name" ]; then
        rm -rf "$dir_name"
        echo "Direktori '$dir_name' telah dihapus."
    else
        echo "Direktori '$dir_name' tidak ada."
    fi
}

# Fungsi untuk menyalin file
copy_file() {
    read -p "Masukkan path file yang akan disalin: " source
    read -p "Masukkan path tujuan: " destination
    if [ -f "$source" ]; then
        cp "$source" "$destination"
        echo "File telah disalin ke $destination."
    else
        echo "File sumber tidak ada."
    fi
}

# Fungsi untuk menyalin direktori
copy_directory() {
    read -p "Masukkan path direktori yang akan disalin: " source
    read -p "Masukkan path tujuan: " destination
    if [ -d "$source" ]; then
        cp -r "$source" "$destination"
        echo "Direktori telah disalin ke $destination."
    else
        echo "Direktori sumber tidak ada."
    fi
}

# Fungsi untuk menampilkan isi file
view_file() {
    read -p "Masukkan path file yang akan ditampilkan: " file_name
    if [ -f "$file_name" ]; then
        cat "$file_name"
    else
        echo "File '$file_name' tidak ada."
    fi
}

# Fungsi untuk membuat file teks
create_text_file() {
    read -p "Masukkan nama file teks: " file_name
    if [ -f "$file_name" ]; then
        echo "File '$file_name' sudah ada."
    else
        touch "$file_name"
        echo "File '$file_name' telah dibuat."
    fi
}

# Fungsi untuk mengisi konten ke dalam file teks
fill_text_file() {
    read -p "Masukkan path file yang akan diisi: " file_name
    if [ -f "$file_name" ]; then
        read -p "Masukkan teks yang ingin ditambahkan ke file (gunakan EOF untuk selesai):
" content
        echo "$content" >> "$file_name"
        echo "Konten telah ditambahkan ke file."
    else
        echo "File '$file_name' tidak ada."
    fi
}

# Fungsi untuk menampilkan isi file yang telah diisi sebelumnya
show_file_content() {
    read -p "Masukkan path file yang akan ditampilkan: " file_name
    if [ -f "$file_name" ]; then
        echo "Isi dari file '$file_name':"
        cat "$file_name"
    else
        echo "File '$file_name' tidak ada."
    fi
}

# Fungsi untuk menampilkan semua direktori yang ada di dalam suatu direktori
show_all_directories() {
    read -p "Masukkan path direktori: " dir_name
    if [ -d "$dir_name" ]; then
        echo "Semua direktori di dalam '$dir_name' adalah:"
        find "$dir_name" -type d
    else
        echo "Direktori '$dir_name' tidak ada."
    fi
}

# Fungsi untuk menampilkan jam saat ini
show_current_time() {
    current_time=$(date +"%T")
    echo "Jam saat ini: $current_time"
}

# Fungsi untuk menampilkan penggunaan CPU
show_cpu_usage() {
    echo "Penggunaan CPU saat ini:"
    top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1"%"}'
}

# Fungsi untuk menampilkan penggunaan RAM
show_ram_usage() {
    echo "Penggunaan RAM saat ini:"
    free -h | awk '/^Mem:/ {print $3 "/" $2}'
}

# Fungsi untuk keluar dari program
exit_program() {
    echo "Terima kasih telah menggunakan program File Management."
    exit 0
}

# Loop utama
while true; do
    show_menu
    read -p "Pilih opsi (1-17): " choice
    case $choice in
        1) create_directory ;;
        2) move_file ;;
        3) rename_file ;;
        4) delete_file ;;
        5) delete_directory ;;
        6) copy_file ;;
        7) copy_directory ;;
        8) view_file ;;
        9) create_text_file ;;
        10) fill_text_file ;;
        11) show_file_content ;;
        12) show_all_directories ;;
        13) show_current_time ;;
        14) show_cpu_usage ;;
        15) show_ram_usage ;;
        16) exit_program ;;
        *) echo "Pilihan tidak valid";;
    esac
done
