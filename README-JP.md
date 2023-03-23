# syntplot
BLASTのアラインメントを元にしたゲノムのシンテニープロット図を簡単に描画するためのスクリプト。

## 使用法
`syntplot <ゲノム1の名前> <ゲノム2の名前> <ゲノム1の配列(.fasta)> <ゲノム2の配列(.fasta)>`
- 引数にスペースや特殊文字を含んでいるとエラーになります。

## 依存ソフト等
- NCBI blast+
- seqkit
- Python 3
- R および以下のパッケージ
  - ggplot2
  - scales

## 出力形式
"<ゲノム1の名前>vs<ゲノム2の名前>.png"という名前の画像ファイルが出力されます。

## examples
- 配列ファイルの少なくとも一方がマルチfastaの場合（目盛がコンティグ名になる）

`syntplot S.cerevisiae_S288C S.paradoxus_CBS432 Scer_GCF_000146045.2_nuc.fasta Spar_GCF_002079055.1_nuc.fasta`
<img src="https://github.com/yk-kobayashi/images/blob/syntplot/S.cerevisiae_S288CvsS.paradoxus_CBS432.png" width="600">

- 配列ファイルが共に単一配列のfastaの場合（目盛が長さになる）

`syntplot S.cerevisiae_S288C_mit S.paradoxus_CNS432_mit Scer_GCF_000146045.2_mit.fasta Spar_GCF_002079055.1_mit.fasta`
<img src="https://github.com/yk-kobayashi/images/blob/syntplot/S.cerevisiae_S288C_mitvsS.paradoxus_CNS432_mit.png" width="600">

## 描画オプション
出力画像の文字や全体のサイズについては、いくつかの点については変えられるようにしてあります。(下記の[]項目)

`syntplot <ゲノム1の名前> <ゲノム2の名前> <ゲノム1の配列(.fasta)> <ゲノム2の配列(.fasta)> [軸の文字サイズ(デフォルト:8)] [画像横幅(インチ、デフォルト:8)] [画像縦幅(インチ、デフォルト:8)] [解像度(dpi,デフォルト:600)]`

## 謝辞
ドットプロット風の図を描画するにあたってblastからgeom_pathに繋げるというアイディアは基生研の頼本くんの発案です。ここに謝辞を述べておきます。
