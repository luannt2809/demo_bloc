// class GetTaskResponse{
//   List<CongViec>? listTasks;
//   int? statusCode;
//   String? messages;
//
//   GetTaskResponse({this.listTasks, this.statusCode,this.messages});
//
//   GetTaskResponse.fromJson(Map<String,dynamic> json){
//     if(json['data'] != null){
//       listTasks = <CongViec>[];
//       json['data'].forEach((v){
//         listTasks!.add(CongViec.fromJson(v));
//       });
//     }
//     statusCode = json['statusCode'];
//     messages = json['message'];
//   }
//
//   Map<String,dynamic> toJson(){
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if(listTasks != null){
//       data['data'] = listTasks!.map((v) => v.toJson()).toList();
//     }
//     data['statusCode'] = statusCode;
//     data['message'] = messages;
//     return data;
//   }
// }

class CongViec {
  int? maCV;
  String? tieuDe;
  String? noiDung;
  String? gioBatDau;
  String? gioKetThuc;
  String? ngayBatDau;
  String? ngayKetThuc;
  String? trangThai;
  int? tienDo;
  String? ghiChu;
  int? maNguoiLam;
  int? maNguoiGiao;
  int? kieu;

  CongViec(
      {this.maCV,
        this.tieuDe,
        this.noiDung,
        this.gioBatDau,
        this.gioKetThuc,
        this.ngayBatDau,
        this.ngayKetThuc,
        this.trangThai,
        this.tienDo,
        this.ghiChu,
        this.maNguoiLam,
        this.maNguoiGiao,
        this.kieu});

  CongViec.fromJson(Map<String, dynamic> json) {
    maCV = json['MaCV'];
    tieuDe = json['TieuDe'];
    noiDung = json['NoiDung'];
    gioBatDau = json['GioBatDau'];
    gioKetThuc = json['GioKetThuc'];
    ngayBatDau = json['NgayBatDau'];
    ngayKetThuc = json['NgayKetThuc'];
    trangThai = json['TrangThai'];
    tienDo = json['TienDo'];
    ghiChu = json['GhiChu'];
    maNguoiLam = json['MaNguoiLam'];
    maNguoiGiao = json['MaNguoiGiao'];
    kieu = json['Kieu'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['MaCV'] = maCV;
    data['TieuDe'] = tieuDe;
    data['NoiDung'] = noiDung;
    data['GioBatDau'] = gioBatDau;
    data['GioKetThuc'] = gioKetThuc;
    data['NgayBatDau'] = ngayBatDau;
    data['NgayKetThuc'] = ngayKetThuc;
    data['TrangThai'] = trangThai;
    data['TienDo'] = tienDo;
    data['GhiChu'] = ghiChu;
    data['MaNguoiLam'] = maNguoiLam;
    data['MaNguoiGiao'] = maNguoiGiao;
    data['Kieu'] = kieu;
    return data;
  }
}
