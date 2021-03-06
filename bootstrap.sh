#!/bin/bash

if [ -z $1 ]; then
    DATA_DIR="data"
else
    DATA_DIR=$1
fi

mkdir -p $DATA_DIR

if [ ! -e $DATA_DIR/maccdc2012_00000.pcap ]; then
    curl https://download.netresec.com/pcap/maccdc-2012/maccdc2012_00000.pcap.gz \
	 -o $DATA_DIR/maccdc2012_00000.pcap.gz
    gunzip $DATA_DIR/maccdc2012_00000.pcap.gz
fi

if [ ! -e $DATA_DIR/maccdc2010_00000_20100310205651.pcap ]; then
    curl https://download.netresec.com/pcap/maccdc-2010/maccdc2010_00000_20100310205651.pcap.gz \
	 -o $DATA_DIR/maccdc2010_00000_20100310205651.pcap.gz
    gunzip $DATA_DIR/maccdc2010_00000_20100310205651.pcap.gz
fi

if [ ! -e $DATA_DIR/net-2009-11-17-10:32.pcap ]; then
		curl http://downloads.digitalcorpora.org/corpora/scenarios/2009-m57-patents/net/net-2009-11-17-10:32.pcap.gz \
				 -o $DATA_DIR/net-2009-11-17-10:32.pcap.gz
		gunzip $DATA_DIR/net-2009-11-17-10:32.pcap.gz
fi

rm -f test_data_path.txt 
echo $DATA_DIR/maccdc2012_00000.pcap                >> test_data_path.txt
echo $DATA_DIR/net-2009-11-17-10:32.pcap            >> test_data_path.txt
echo $DATA_DIR/maccdc2010_00000_20100310205651.pcap >> test_data_path.txt
