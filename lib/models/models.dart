// User Model
class User {
  final int idUser;
  final String username;
  final DateTime createdAt;
  final DateTime updatedAt;

  User({
    required this.idUser,
    required this.username,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      idUser: json['id_user'],
      username: json['username'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}

// Portofolio Model
class Portofolio {
  final int idPortofolio;
  final String nama;
  final String deskripsi;
  final String durasiPengerjaan;
  final String timestamp;
  final String linkPortofolio;
  final String gambar;
  final String gambarUrl;
  final int idSiswa;
  final DateTime createdAt;
  final DateTime updatedAt;

  Portofolio({
    required this.idPortofolio,
    required this.nama,
    required this.deskripsi,
    required this.durasiPengerjaan,
    required this.timestamp,
    required this.linkPortofolio,
    required this.gambar,
    required this.gambarUrl,
    required this.idSiswa,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Portofolio.fromJson(Map<String, dynamic> json) {
    return Portofolio(
      idPortofolio: json['id_portofolio'],
      nama: json['nama'],
      deskripsi: json['deskripsi'],
      durasiPengerjaan: json['durasiPengerjaan'],
      timestamp: json['timestamp'],
      linkPortofolio: json['linkPortofolio'],
      gambar: json['gambar'],
      gambarUrl: json['gambar_url'] ?? '',
      idSiswa: json['id_siswa'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}

// Sertifikat Model
class Sertifikat {
  final int idSertifikat;
  final String nama;
  final String deskripsi;
  final String file;
  final String fileUrl;
  final int idSiswa;
  final DateTime createdAt;
  final DateTime updatedAt;

  Sertifikat({
    required this.idSertifikat,
    required this.nama,
    required this.deskripsi,
    required this.file,
    required this.fileUrl,
    required this.idSiswa,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Sertifikat.fromJson(Map<String, dynamic> json) {
    return Sertifikat(
      idSertifikat: json['id_sertifikat'],
      nama: json['nama'],
      deskripsi: json['deskripsi'],
      file: json['file'],
      fileUrl: json['file_url'] ?? '',
      idSiswa: json['id_siswa'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}

// DataSiswa Model
class DataSiswa {
  final int id;
  final String namaSiswa;
  final int nis;
  final String rombel;
  final String rayon;
  final String? newColumn;
  final int idUser;
  final String pfp;
  final String pfpUrl;
  final DateTime createdAt;
  final DateTime updatedAt;
  final User user;
  final List<Portofolio> portofolio;
  final List<Sertifikat> sertifikat;

  DataSiswa({
    required this.id,
    required this.namaSiswa,
    required this.nis,
    required this.rombel,
    required this.rayon,
    this.newColumn,
    required this.idUser,
    required this.pfp,
    required this.pfpUrl,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
    required this.portofolio,
    required this.sertifikat,
  });

  factory DataSiswa.fromJson(Map<String, dynamic> json) {
    return DataSiswa(
      id: json['id'],
      namaSiswa: json['nama_siswa'],
      nis: json['NIS'],
      rombel: json['rombel'],
      rayon: json['Rayon'],
      newColumn: json['new_column'],
      idUser: json['id_user'],
      pfp: json['PFP'],
      pfpUrl: json['pfp_url'] ?? '',
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      user: User.fromJson(json['user']),
      portofolio: (json['portofolio'] as List)
          .map((p) => Portofolio.fromJson(p))
          .toList(),
      sertifikat: (json['sertifikat'] as List)
          .map((s) => Sertifikat.fromJson(s))
          .toList(),
    );
  }
}

// Login Response Model
class LoginResponse {
  final String token;
  final User user;

  LoginResponse({
    required this.token,
    required this.user,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      token: json['token'],
      user: User.fromJson(json['user']),
    );
  }
}