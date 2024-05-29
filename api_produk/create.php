<?php
  $koneksi = new mysqli('localhost','root','','jurusan');
  $NIS = $_POST['nis'];
  $NAMASISWA = $_POST['namaSiswa'];
  $JENISKELAMIN = $_POST['jenisKelamin'];
  $ALAMAT = $_POST['alamat'];
  $NOHP = $_POST['noHp'];
  $data = mysqli_query($koneksi, "insert into siswa set 
  nis ='$NIS',
  namaSiswa='$NAMASISWA',
  jenisKelamin = '$JENISKELAMIN',
  alamat = '$ALAMAT',
  noHp = '$NOHP'");

  if ($data) {
    echo json_encode([
      'pesan' => 'sukses'
    ]);
  }else{
    echo json_encode([
      'pesan' => 'gagal'
    ]);
  }

?>