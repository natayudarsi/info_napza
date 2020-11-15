class Kuis{
  final String nomor;
  final String soal;
  final String jawabanA;
  final String jawabanB;
  final String jawabanC;
  final String jawabanD;
  final String jawabanBenar;
  final String penjelasan;

  const Kuis({
    this.nomor,
    this.soal,
    this.jawabanA,
    this.jawabanB,
    this.jawabanC,
    this.jawabanD,
    this.jawabanBenar,
    this.penjelasan
  });
}

List<Kuis> kuis =[
  const Kuis(
    nomor: '1',
    soal : 'Zat adiktif adalah zat yang dapat menimbulkan?',
    jawabanA : 'Kesenangan',
    jawabanB : 'Kesedihan',
    jawabanC : 'Ketergantungan',
    jawabanBenar: 'C',
  ),
  const Kuis(
    nomor: '2',
    soal : 'Mengapa air rebusan pembalut dapat meyebapkan halusinasi?',
    jawabanA : 'Terdapat kandungan klorin',
    jawabanB : 'Terdapat kandungan nikotin',
    jawabanC : 'Terdapat kandungan kafein',
    jawabanBenar: 'A',
  ),
  const Kuis(
    nomor: '3',
    soal : 'Mengapa narkotika di Indonesia terus meningkat?',
    jawabanA : 'Karena adanya pembuat narkotika',
    jawabanB : 'Karena permintaan narkotika masih tinggi',
    jawabanC : 'Karena adanya ketersediaan narkotika',
    jawabanBenar: 'B',
  ),
  const Kuis(
    nomor: '4',
    soal : 'Bagaimana narkotika bisa menimbulkan efek haluisnasi?',
    jawabanA : 'Karena narkotika meyerang sel saraf otak',
    jawabanB : 'Karena narkotika meyerang sel darah putih',
    jawabanC : 'Karena narkotika meyerang sel darah merah',
    jawabanBenar: 'A'
  ),
  const Kuis(
    nomor: '5',
    soal : 'Bagaimana pemakai narkoba bisa jadi ketergantungan?',
    jawabanA : 'Karna ada rasa kecanduan seolah olah orang itu memerlukan sebagai kebutuhan pokok',
    jawabanB : 'Karna ia menikmati narkoba itu',
    jawabanC : 'Timbul nya rasa nikmat setelah mengkonsumsi narkoba',
    jawabanBenar: 'A',
  ),
  const Kuis(
    nomor: '6',
    soal : 'Mengapa ganja di larang di Indonesia?',
    jawabanA : 'Termasuk Obat-obatan',
    jawabanB : 'Termasuk Narkotika',
    jawabanC : 'Termasuk Vitamin',
    jawabanBenar: 'B',
  ),
  const Kuis(
    nomor: '7',
    soal : 'Mengapa remaja rentan kecanduan narkoba?',
    jawabanA : 'Karena kurang percaya diri',
    jawabanB : 'Karena lingkungan keluarga',
    jawabanC : 'Karena lingkungan pergaulan',
    jawabanBenar: 'C',
  ),
  const Kuis(
    nomor: '8',
    soal : 'Mengapa asap rokok bersifat racun?',
    jawabanA : 'Dapat menyebabkan penggumpalan darah',
    jawabanB : 'Membuat darah susah beku',
    jawabanC : 'Mengurangi kemampuan darah mengangkut oksigen',
    jawabanBenar: 'C',
  ),
  const Kuis(
    nomor: '9',
    soal : 'Bagaimana cara menghilangakan obat dari pecandu narkoba?',
    jawabanA : 'Operasi',
    jawabanB : 'Otopsi',
    jawabanC : 'Detoksifikasi',
    jawabanBenar: 'C',
  ),
  const Kuis(
    nomor: '10',
    soal : 'Mengapa penggunaan  narkoba jika dihentikan maka pecandu akan mengalami rasa nyeri, berkeringat, gemetar dan demam hal ini disebut?',
    jawabanA : 'Fly',
    jawabanB : 'Sakau',
    jawabanC : 'Over dosis',
    jawabanBenar: 'B',
  ),
  
];