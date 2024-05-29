 <?php
  $koneksi = new mysqli('localhost','root','','jurusan');
  $id = $_POST['id'];
  $NIS = $_POST['nis'];
  $NAMASIWA = $_POST['namaSiswa'];
  $JENISKELAMIN = $_POST['jenisKelamin'];
  $ALAMAT = $_POST['alamat'];
  $NOHP = $_POST['noHp'];
  $data = mysqli_query($koneksi, "update siswa set nis ='$NIS',namaSiswa = '$NAMASIWA', jenisKelamin = '$JENISKELAMIN', alamat = '$ALAMAT', noHp = '$NOHP' where id ='$id'");

  if ($data) {
    echo json_encode([
      'pesan' => 'Update sukses'
    ]);
  }else{
    echo json_encode([
      'pesan' => 'Update gagal'
    ]);
  }

?>