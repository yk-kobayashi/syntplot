#!/usr/bin/python3

# あらかじめ各コンティグの長さを測ったファイルを以下のように作成しておく
# seqkit fx2tab contig.fa -n -l > contiglist.txt

from sys import argv
blast6 = argv[1]
scontiglist = argv[2]
qcontiglist = argv[3]
soutposition = argv[4]
qoutposition = argv[5]
plotdata = argv[6]

positionlist1 = open(qoutposition, mode="w")
qcontigpos = {}
qcurrentpos = 0
with open(qcontiglist) as qcontigs:
    for qcontig in qcontigs:
        qcontigcontent = qcontig.split("\t")
        qcontigSplitName = qcontigcontent[0].split(" ")
        print(qcontigSplitName[0] + "\t" + str(qcurrentpos), file=positionlist1)
        qcontigpos[qcontigSplitName[0]] = qcurrentpos
        qcurrentpos = qcurrentpos + int(qcontigcontent[1])
positionlist1.close()

positionlist2 = open(soutposition, mode="w")
scontigpos = {}
scurrentpos = 0
with open(scontiglist) as scontigs:
    for scontig in scontigs:
        scontigcontent = scontig.split("\t")
        scontigSplitName = scontigcontent[0].split(" ")
        print(scontigSplitName[0] + "\t" + str(scurrentpos), file=positionlist2)
        scontigpos[scontigSplitName[0]] = scurrentpos
        scurrentpos = scurrentpos + int(scontigcontent[1])
positionlist2.close()

dotplotdata = open(plotdata, mode="w")
print("query\tsubject\tidentity", file=dotplotdata)
with open(blast6) as blastresult:
    for line in blastresult:
        hitcont = line.split("\t")
        qname = hitcont[0]
        sname = hitcont[1]
        pident = hitcont[2]
        qstart = qcontigpos[qname] + int(hitcont[6])
        qend = qcontigpos[qname] + int(hitcont[7])
        sstart = scontigpos[sname] + int(hitcont[8])
        send = scontigpos[sname] + int(hitcont[9])
        print(qstart, sstart, pident, sep="\t", file=dotplotdata)
        print(qend, send, pident, sep="\t", file=dotplotdata)
        print("NA", "NA", "NA", sep="\t", file=dotplotdata)
dotplotdata.close()

