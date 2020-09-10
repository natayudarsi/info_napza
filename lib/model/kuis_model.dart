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
    soal : 'Zat adiktif adalah zat yang dapat menimbulkan',
    jawabanA : 'Kesenangan',
    jawabanB : 'Kesedihan',
    jawabanC : 'Ketergantungan',
    jawabanD: 'Kesembuhan',
    jawabanBenar: 'C',
    penjelasan: 'Zat adiktif adalah obat serta bahan-bahan aktif yang apabila dikonsumsi oleh organisme hidup, maka dapat menyebabkan kerja biologi serta menimbulkan ketergantungan atau adiksi yang sulit dihentikan dan berefek ingin menggunakannya secara terus-menerus.'
  ),
  const Kuis(
    nomor: '2',
    soal : 'Berikut ini yang bukan merupakan zat adiktif dan psikotropika adalah',
    jawabanA : 'Alkohol',
    jawabanB : 'PCP',
    jawabanC : 'MSG',
    jawabanD: 'Opium',
    jawabanBenar: 'C',
    penjelasan: 'Mononatrium glutamat, monosodium glutamat (MSG), atau natrium/sodium glutamat merupakan garam natrium dari asam glutamat yang merupakan salah satu asam amino non-esensial paling berlimpah yang terbentuk secara alami.'
  ),
  const Kuis(
    nomor: '3',
    soal : 'Zat-zat berikut ini tergolong dalam narkotika, kecuali',
    jawabanA : 'Morfin',
    jawabanB : 'Kokain',
    jawabanC : 'Heroin',
    jawabanD: 'Amifetamin',
    jawabanBenar: 'D',
    penjelasan: 'Amfetamin adalah obat stimulan sistem saraf pusat yang digunakan untuk menangani narkolepsi dan attention deficit hyperactivity disorder.'
  ),
  const Kuis(
    nomor: '4',
    soal : 'Zat psikotropika yang terdapat pada tembakau adalah',
    jawabanA : 'Karbon Monoksida',
    jawabanB : 'Nikotin',
    jawabanC : 'Tar',
    jawabanD: 'Cafein',
    jawabanBenar: 'B',
    penjelasan: 'Nikotin adalah senyawa kimia organik kelompok alkaloid yang dihasilkan secara alami oleh berbagai macam tumbuhan.'
  ),
  const Kuis(
    nomor: '5',
    soal : 'Di bawah ini merupakan zat racun yang terdapat dalam rokok, kecuali',
    jawabanA : 'Tar',
    jawabanB : 'Karbon Dioksida',
    jawabanC : 'Nikotin',
    jawabanD: 'Kafein',
    jawabanBenar: 'D',
    penjelasan: 'Caffeine atau kafein adalah zat kimia yang ditemukan pada kopi, teh, cola, guarana, mate, dan produk-produk lain. Kafein umumnya digunakan untuk meningkatkan kewaspadaan mental, namun kafein memiliki banyak kegunaan lain.'
  ),
  const Kuis(
    nomor: '6',
    soal : 'Berikut ini zat yang termasuk semisintesis adalah ',
    jawabanA : 'Ekstasy',
    jawabanB : 'Heroin',
    jawabanC : 'Canabis',
    jawabanD: 'Morfin',
    jawabanBenar: 'B',
    penjelasan: 'Heroin adalah derivatif 3.6-diasetil dari morfin (karena itulah namanya adalah diasetilmorfin) dan disintesiskan darinya melalui asetilasi dan semisintesis. Bentuk kristal putihnya.'
  ),
  const Kuis(
    nomor: '7',
    soal : 'Salah satu fungsi dari morfin di bidang medis adalah untuk',
    jawabanA : 'Mengobati flu dan demam',
    jawabanB : 'Mengurangi rasa lapar',
    jawabanC : 'Mengobati rasa sakit berlebih',
    jawabanD: 'Mengurangi rasa kantuk',
    jawabanBenar: 'C',
    penjelasan: 'Morfin adalah obat dengan fungsi untuk meredakan sakit atau nyeri yang parah. Morfin masuk ke dalam kategori analgesik narkotika (opiate). Obat ini bekerja di dalam otak untuk mengubah cara tubuh dalam merespon dan merasakan rasa sakit. Dosis morfin dan efek samping morfin akan dijelaskan lebih lanjut di bawah ini.'
  ),
  const Kuis(
    nomor: '8',
    soal : 'Berikut ini cara kerja dari nikotin adalah',
    jawabanA : 'Mengusir oksigen dalam darah',
    jawabanB : 'Menaikkan tekanan darah',
    jawabanC : 'Memengaruhi pertumbuhan sel',
    jawabanD: 'Merusak fungsi dari organ tubuh',
    jawabanBenar: 'B',
    penjelasan: 'Layaknya zat additive lainnya, ada beberapa cara bagi Nikotin untuk terserap dalam tubuh manusia, yaitu melalui: Kulit; Paru-paru; Mucous membranes.'
  ),
  const Kuis(
    nomor: '9',
    soal : 'Alkohol tergolong dalam ',
    jawabanA : 'Depresan',
    jawabanB : 'Halus Inogen',
    jawabanC : 'Stimulan',
    jawabanD: 'Analgenik',
    jawabanBenar: 'A',
    penjelasan: 'Depresan adalah obat penenang yang tergolong pada kelompok obat yang disebut ‘benzodiazepine’ • Obat- obat depresan diresepkan oleh para dokter untuk mengurangi stres, kecemasan, untuk membantu orang tidur dan kegunaan kedokteran lainnya. Biasanya obat-obat ini berbentuk kapsul atau tablet.'
  ),
  const Kuis(
    nomor: '10',
    soal : 'Amfetamin adalah zat psikotropika yang tergolong',
    jawabanA : 'Stimulan',
    jawabanB : 'Halus Inogen',
    jawabanC : 'Inhalansia',
    jawabanD: 'Depresan',
    jawabanBenar: 'A',
    penjelasan: 'Stimulan adalah obat-obatan yang menaikkan tingkat kewaspadaan di dalam rentang waktu singkat. Stimulan biasanya menaikkan efek samping dengan menaikkan efektivitas, dan berbagai jenis yang lebih hebat seringkali disalahgunakan menjadi obat yang ilegal atau dipakai tanpa resep dokter.'
  ),
  const Kuis(
    nomor: '11',
    soal : 'Sabu-sabu adalah zat adiktif yang mengandung',
    jawabanA : 'Kokain',
    jawabanB : 'Amfetamin',
    jawabanC : 'Morfin',
    jawabanD: 'Barbiturat',
    jawabanBenar: 'B',
    penjelasan: 'Salah satu jenis narkotika dengan beberapa jenis turunan seperti metamfetamina (sabu) dan metilendioksimetamfetamina/ MDMA (ekstasi). “Secara farmakologi, amfetamin sejatinya termasuk psikotropika.'
  ),
  const Kuis(
    nomor: '12',
    soal : 'Karbon monoksida yang terdapat dalam asap rokok bersifat racun karena',
    jawabanA : 'Dapat menyebabkan karsinogen',
    jawabanB : 'Menyebabkan penggumpalan darah',
    jawabanC : 'Mengurangi kemampuan darah mengangkut oksigen',
    jawabanD: 'Membuat darah sukar membeku',
    jawabanBenar: 'C',
    penjelasan: 'Ketika CO (karbonn monosida) terhirup, hemoglobin akan mengikat CO. Sebagaimana yang kita ketahui, hemoglobin itu biasanya mengikat oksigen untuk diedarkan ke seluruh tubuh.ketika terdapat CO dalam darah, hemoglobin akan mengikat CO karena afinitas CO lebih tinggi thdp hemoglobin. jika hal tersebut terjadi, maka pengikatan oksigen oleh hemoglobin semakin berkurang dan jaringan tubuh akan kekurangan oksigen.'
  ),
  const Kuis(
    nomor: '13',
    soal : 'Opium alami dapat diperoleh dari tanaman',
    jawabanA : 'Kanabis sativa',
    jawabanB : 'Kanabis indica',
    jawabanC : 'Eritrosilon koka',
    jawabanD: 'Papaver somniverum',
    jawabanBenar: 'D',
    penjelasan: 'Opium, apiun, atau candu (slang Bahasa Inggris: poppy) adalah getah bahan baku narkotika yang diperoleh dari buah candu (Papaver somniferum L. atau P. paeoniflorum) yang belum matang. Opium merupakan tanaman semusim yang hanya bisa dibudidayakan di pegunungan kawasan subtropis.'
  ),
  const Kuis(
    nomor: '14',
    soal : 'Gejala fisik yang dialami oleh para pecandu zat adiktif jenis opium dan amfetamin adalah',
    jawabanA : 'Batuk, napas bau, dan sering berdahak',
    jawabanB : 'Badan kurus, muka pucat, dan mata cekung',
    jawabanC : 'Bicara cadel, sempoyongan, dan batuk',
    jawabanD: 'Pupil lebar, sukar tidur, dan lemas',
    jawabanBenar: 'B',
    penjelasan: ''
  ),
  const Kuis(
    nomor: '15',
    soal : 'Upaya untuk menghilangkan obat dari pecandu narkoba disebut',
    jawabanA : 'Operasi',
    jawabanB : 'Vertilisasi',
    jawabanC : 'Detoksifikasi',
    jawabanD: 'Otopsi',
    jawabanBenar: 'C',
    penjelasan: 'Detoksifikasi (bahasa Inggris: detoxification, detox) adalah lintasan metabolisme yang mengurangi kadar racun di dalam tubuh.'
  ),
  const Kuis(
    nomor: '16',
    soal : 'Apabila penggunaan narkoba dihentikan, maka pecandu akan mengalami rasa nyeri, berkeringat, gemetar, dan demam. Hal ini disebut',
    jawabanA : 'Fly',
    jawabanB : 'Overdosis',
    jawabanC : 'Sakau',
    jawabanD: 'Kumat',
    jawabanBenar: 'C',
    penjelasan: 'Sakau, atau sakaw, alias putus obat, adalah gejala tubuh yang terjadi akibat pemberhentian pemakaian obat secara mendadak, atau akibat penurunan dosis obat secara drastis sekaligus. '
  ),
  const Kuis(
    nomor: '17',
    soal : 'Wanita akan lebih cepat mengalami mabuk saat mengkonsumsi zat adiktif daripada pria, karena ',
    jawabanA : 'Tubuhnya lebih pendek',
    jawabanB : 'Perutnya lebih kecil',
    jawabanC : 'Volume darahnya lebih kecil',
    jawabanD: 'Volume otaknya lebih besar',
    jawabanBenar: 'C',
    penjelasan: 'Ternyata Wanita Lebih Cepat Mabuk Daripada Pria Saat Mengonsumsi Alkohol, Ini.  Pada tubuh pria terdapat 65 persen air, sedangkan wanita hanya 55 persen, sehingga wanita lebih mudah mabuk. '
  ),
  const Kuis(
    nomor: '18',
    soal : 'Depresan disebut juga sebagai obat ',
    jawabanA : 'Penenang',
    jawabanB : 'Pereda Nyeri',
    jawabanC : 'Hipetensi',
    jawabanD: 'Perangsang',
    jawabanBenar: 'A',
    penjelasan: 'Depresan adalah obat penenang yang tergolong pada kelompok obat yang disebut ‘benzodiazepine’ • Obat–obat depresan diresepkan oleh para dokter untuk mengurangi stres, kecemasan, untuk membantu orang tidur dan kegunaan kedokteran lainnya.'
  ),
  const Kuis(
    nomor: '19',
    soal : 'Stimulan disebut juga sebagai obat ',
    jawabanA : 'Pemati Rasa',
    jawabanB : 'Penenang',
    jawabanC : 'Perangsang',
    jawabanD: 'Hipertensi',
    jawabanBenar: 'C',
    penjelasan: ''
  ),
  const Kuis(
    nomor: '20',
    soal : 'Zat berikut ini sering digunakan dengan cara inhalansia, kecuali ',
    jawabanA : 'Parasetamol',
    jawabanB : 'Cat',
    jawabanC : 'Parfum',
    jawabanD: 'Spiritus',
    jawabanBenar: 'A',
    penjelasan: 'Parasetamol atau asetaminofen adalah obat analgesik dan antipiretik yang populer dan digunakan untuk melegakan sakit kepala, sengal-sengal.'
  ),
];