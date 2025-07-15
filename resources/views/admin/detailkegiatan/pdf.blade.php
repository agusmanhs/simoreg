<!DOCTYPE html>
<html>
<head>
    <title>Daftar Pengguna</title>
    <style>
        body {
            font-family: sans-serif;
            font-size: 10px; /* ukuran default */
        }
        .table1 {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        .table1 th td {
            border: 1px solid black;
        }
        th, td {
            /* padding: 8px 10px; */
            text-align: left;
        }   
        .tengah td {
            text-align: center;
            vertical-align: middle;
            font-size: 6px;
            padding: 0;
        }
        .tengah tr:last-child td {
            border-bottom: 0.8px solid black;
        }
    </style>
</head>
<body>
    <?php $i = 0;
?>

@foreach ($program as $a)
<table class="tengah">
    <tr >
        <td>KEPOLISIAN NEGARA REPUBLIK INDONESIA</td>
    </tr>
    <tr >
        <td>DAERAH SULAWESI SELATAN</td>
    </tr>
    <tr>
        <td>BIRO OPERASI</td>
    </tr>
</table>

<div style="text-align: center;font-size: 10px; ">
    <p style="margin: 0px">RENCANA PELAKSANAAN KEGIATAN T.A 2025</p>
    <u style="margin: 0px">SATKER BIRO OPERASI POLDA SULSEL</u>
</div>

<table border="0" style="font-size: 10px;">
    <tr >
        <td >Kementerian Negara / Lembaga</td>
        <td >: Kepolisian Negara Republik Indonesian</td>
    </tr>
    <tr>
        <td >Unit Eselon 1 / Program</td>
        <td >: Polda Sulsel / {{ $a->nama }}</td>
    </tr>
    <tr>
        <td>Satker</td>
        <td >: Biro Operasi Polda Sulsel</td>
    </tr>
    <tr>
        <td>Total pagu</td>
        <td >: Rp. {{ number_format($a->total) }}</td>
    </tr>
</table>
<table class="table1" border="1" cellspacing="0">
    <thead>
        <tr >
            <th rowspan="2" style="text-align: center">Kode</th>
            <th rowspan="2" style="text-align: center">Nama Uraian</th>
            <th rowspan="2" style="text-align: center">Pagu</th>
            <th colspan="12" style="text-align: center">Bulan T.A 2025</th>
            <th rowspan="2" style="text-align: center">Target</th>
            <th rowspan="2" style="text-align: center">Pelaksana Kegiatan</th>
            <th rowspan="2" style="text-align: center">Ket</th>
        </tr>
        <tr>
            <th style="text-align: center">I</th>
            <th style="text-align: center">II</th>
            <th style="text-align: center">III</th>
            <th style="text-align: center">IV</th>
            <th style="text-align: center">V</th>
            <th style="text-align: center">VI</th>
            <th style="text-align: center">VII</th>
            <th style="text-align: center">VIII</th>
            <th style="text-align: center">IX</th>
            <th style="text-align: center">X</th>
            <th style="text-align: center">XI</th>
            <th style="text-align: center">XII</th>
        </tr>
    </thead>
    <tbody>
            <tr style="background-color: rgb(88, 125, 211)">
                <td>{{ $a->kode }}</td>
                <td>{{ strtoupper($a->nama) }}</td>
                <td style="font-weight: bold;">{{ number_format($a->total) }}</td>
                <td>------</td>
                <td>------</td>
                <td>------</td>
                <td>------</td>
                <td>------</td>
                <td>------</td>
                <td>------</td>
                <td>------</td>
                <td>------</td>
                <td>------</td>
                <td>------</td>
                <td>------</td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            @foreach ($kegiatan as $b)
                @if ($b->program_id == $a->id)
                    <tr style="background-color: rgb(144, 171, 233)">
                        <td>{{ $b->kode }}</td>
                        <td style="padding-left: 10px">{{ $b->nama }}</td>
                        <td style="font-weight: bold;">{{ number_format($b->total) }}</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    @foreach ($kro as $c)
                        @if ($c->kegiatan_id == $b->id)
                            <tr style="background-color: rgb(200, 117, 142)">
                                <td>{{ $c->kode }}</td>
                                <td style="padding-left: 20px">{{ $c->nama }}</td>
                                <td style="font-weight: bold;">{{ number_format($c->total) }}</td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            @foreach ($ro as $d)
                                @if ($d->kro_id == $c->id)
                                    <tr>
                                        <td>{{ $d->kode }}</td>
                                        <td style="padding-left: 30px">{{ $d->nama }}</td>
                                        <td style="font-weight: bold;">{{ number_format($d->total) }}</td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    @foreach ($komponen as $e)
                                        @if ($e->ro_id == $d->id)
                                            <tr>
                                                <td>{{ $e->kode }}</td>
                                                <td style="padding-left: 40px">{{ $e->nama }}</td>
                                                <td style="font-weight: bold;">{{ number_format($e->total) }}</td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                            @foreach ($subkomponen as $f)
                                                @if ($f->komponen_id == $e->id)
                                                    <tr>
                                                        <td>{{ $f->kode }}</td>
                                                        <td style="padding-left: 50px">{{ $f->nama }}</td>
                                                        <td style="font-weight: bold;">{{ number_format($f->total) }}</td>
                                                        <td></td>
                                                        <td></td>
                                                        <td></td>
                                                        <td></td>
                                                        <td></td>
                                                        <td></td>
                                                        <td></td>
                                                        <td></td>
                                                        <td></td>
                                                        <td></td>
                                                        <td></td>
                                                        <td></td>
                                                        <td></td>
                                                        <td></td>
                                                        <td></td>
                                                    </tr>
                                                    @foreach ($kodeakun as $g)
                                                        @if ($g->subkomponen_id == $f->id)
                                                            <tr>
                                                                <td>{{ $g->kode }}</td>
                                                                <td style="padding-left: 60px">{{ $g->nama }}</td>
                                                                <td style="font-weight: bold;">{{ number_format($g->total) }}</td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            @foreach ($rencana as $h)
                                                                @if ($h->kodeakun_id == $g->id)
                                                                    <tr>
                                                                        <td>{{ $h->kode }}</td>
                                                                        <td style="padding-left: 70px">{{ $h->nama }}</td>
                                                                        <td style="text-align: right">{{number_format( $h->pagu )}}</td>
                                                                        <td style="text-align: center">{{ $h->januari }}</td>
                                                                        <td style="text-align: center">{{ $h->februari }}</td>
                                                                        <td style="text-align: center">{{ $h->maret }}</td>
                                                                        <td style="text-align: center">{{ $h->april }}</td>
                                                                        <td style="text-align: center">{{ $h->mei }}</td>
                                                                        <td style="text-align: center">{{ $h->juni }}</td>
                                                                        <td style="text-align: center">{{ $h->juli }}</td>
                                                                        <td style="text-align: center">{{ $h->agustus }}</td>
                                                                        <td style="text-align: center">{{ $h->september }}</td>
                                                                        <td style="text-align: center">{{ $h->oktober }}</td>
                                                                        <td style="text-align: center">{{ $h->november }}</td>
                                                                        <td style="text-align: center">{{ $h->desember }}</td>
                                                                        <td style="text-align: center">{{ $h->jumkeg }}</td>
                                                                        <td style="text-align: center; font-size:6pt">{{ $h->bag }}</td>
                                                                        <td style="text-align: center"></td>
                                                                    </tr>
                                                                @endif
                                                            @endforeach
                                                        @endif
                                                    @endforeach
                                                @endif
                                            @endforeach
                                        @endif
                                    @endforeach
                                @endif
                            @endforeach
                        @endif
                    @endforeach
                @endif
            @endforeach
        </tbody>
    </table>
    <table style="width: 100%;">
        <tr>
            <td style="width: 60%;"></td>
            <td style="text-align: left;">
                <p style="text-align: center; font-size: 8px;">Makassar, januari 2025</p>
                <div style="font-size: 10px;">
                    <p style="text-align: center;">KEPALA BIRO OPERASI POLDA SULSEL</p>
                    <p style="margin: 10px; text-align: center;">ttd</p>
                    <u style="display: block; text-align: center;">BAMBANG WIDJANARKO, S.I.K., M.Si</u>
                    <p style="margin: 0px; text-align: center;">KOMISARIS BESAR POLISI NRP 72050518</p>
                </div>
            </td>
        </tr>
    </table>
    <div style="page-break-after: always;"></div>
    @endforeach




</body>
</html>
