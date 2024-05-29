<?php
  $koneksi = new mysqli('localhost','root','','jurusan');
  $query = mysqli_query($koneksi, "select * from siswa");
  $data = mysqli_fetch_all($query, MYSQLI_ASSOC);
  echo json_encode($data);

?>