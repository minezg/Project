#! /bin/bash

#Öğrenmiş olduğum temel Linux komutlarını kullanarak bilgisayardaki kullanıcı yönetimini sağlayan bir script yazmaya çalıştım. 
#Amacım kullanıcıların parola girdikten sonra yetkisi olan dosyalara erişimini sağlamak ancak henüz parola ve yetki kısımlarını scripte ekleyemedim.
#Zamanla scriptte güncellemeler yapacağım...

echo "Hello! Pls select your membership status (new member-1)/(created user-0)" 
read ms
#Burada switch-case işlemiyle kullanıcıdan üyelik durumunu parametre olarak alınıyor
case $ms in
"1" )
#Kullanıcı Yeni Üye...
echo "Welcome to The Company!" 
echo "There are a few steps for you to start working"
echo "Please create a new user..."
read -p 'New username is: ' nwusr
sudo useradd $nwusr 
#Burada kullanıcıdan bir kullanıcı adı belirlemesini isteniyor ve bilgisayara yeni kullanıcı olarak ekleniyor
#sudo su $nwusr 
#Bu kısımda kullanıcı değişikliği yapmak ve parola oluşturmak istedim ancak kullanıcı değişikliği durumunda kod çalışmayı kesti sonraki, adımlara geçmedi.
#O yüzden şimdilik bu işlemi yorum satırında bırakıp sorunu çözmeye çalışacağım.
echo $PWD
cd /home/kali/Desktop
#Burada kullanıcının bulunduğu dizini ekrana yazdırılıp sonrasında kullanıcı Desktop'a yönlendiriliyor
#Desktop burada kullanıcı dosyalarını toplamak için öylesine seçtiğim bir konum sonradan değiştirilebilir
mkdir $nwusr 
cd $nwusr
#Kullanıcı oluşturulduktan sonra aynı kullanıcı adıyla otomatik olarak bir kullanıcı klasörü oluşturuluyor
echo "Now you can create files"
echo "Enter the name of file"
read file
touch $file
#Oluşturulan kullanıcı klasörünün içinde kullanıcı çalışmak için kullanacağı dosyaları oluşturabiliyor
echo $PWD
ls ;;
#Şimdilik son olarak dosya oluşturma işleminden sonra da dizin ve dosya listesini ekrana yazdırılıyor

"0" )
#Kullanıcı Mevcut Kullanıcı...
echo "Welcome back to work!" 
echo "Who would be the current user?"
cut -d: -f1 /etc/passwd
read ctusr
#Burada mevcut kullanıcı için kullanıcı listesi ekrana yazdırılıp, devam edilecek kullanıcı parametre olarak alınıyor
#sudo su $ctusr 
#Aynı şekilde burada da kullanıcı değişikliği işlemini gerçekleştirme ve sonrasında planladığım işlemleri yapmada sorun yaşadığım için yorum satırında bıraktım.
echo $PWD
cd /home/kali/Desktop
cd $ctusr 
echo $PWD
ls ;;
#Yine burada da kullanıcının dosya klasörüne giriliyor. Mevcut kullanıcı olduğu için dosya klasörü daha önceden oluşturulmuş
echo "Enter the name of file"
read file
touch $file
#Mevcut kullanıcı da dosya oluşturma işlemine devam edebiliyor

* )
echo "Undefined choice!Pls try again..."
#Kullanıcının tanımlaan caselerden birini girmemesi durumunda hata mesajı veriliyor
esac


