#!/bin/bash 

if [ "$#" -eq 0 ]
then
	directory=$(pwd)
else
	directory=$1
fi

echo "Dizindeki dosyalar, boyutları ve toplam boyutu :"
du -sch * $directory #dosyaların boyutunu gösterir
echo "Dizindeki dosya yapısını gösterir :"
ls -A  $directory #dosya yapısını gösterir
echo "Dizindeki en büyük boyutlu dosya :"
du -ah $directory | sort -nr | head -n 1 #en büyük dosyayı gösterir
#du -sh
echo "Dizindeki en küçük boyutlu dosya :"
du -ah  $directory |sort -h | head -n 1 #en küçük dosyayı gösterir
echo "Dizindeki dosya sayısı"
ls $directory | wc -l
echo "Dizindeki klasör sayısı :"
find . $directory -type f | wc -l
echo "Dizinin sahibi :"
stat -c %U $directory
echo "Dizinin sahibinin grubu :"
stat -c %G $directory
echo "Dizindeki dosyaların uzantı listesi :"
#dosya sayısı 10 ile sınırlandırıldı.
find . $directory -type f -name "*" | sort -r | head -n 10

