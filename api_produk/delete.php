<?php
  $koneksi = new mysqli('localhost','root','','jurusan');
  $id = $_POST['id'];
  $data = mysqli_query($koneksi, "delete from siswa where id ='$id'");

  if ($data) {
    echo json_encode([
      'pesan' => 'Delete  sukses'
    ]);
  }else{
    echo json_encode([
      'pesan' => 'Delete gagal'
    ]);
  }

?>