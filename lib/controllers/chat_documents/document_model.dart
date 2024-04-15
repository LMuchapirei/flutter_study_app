class PDFDocument {
  String? documentName;
  String? downloadUrl;
  String? uploadTime;

  PDFDocument({this.documentName, this.downloadUrl});

  PDFDocument.fromJson(Map<String, dynamic> json) {
    documentName = json['documentName'];
    downloadUrl = json['downloadUrl'];
    uploadTime = json['uploadTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['documentName'] = this.documentName;
    data['downloadUrl'] = this.downloadUrl;
    data['uploadTime'] = this.uploadTime;
    return data;
  }

  @override
  String toString() {
    // TODO: implement toString
    return {
          "documentName":this.documentName,
          "downloadUrl":this.downloadUrl,
          "uploadTime": this.uploadTime,
      }.toString();
  }
}