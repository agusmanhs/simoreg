<?php $i = 0;
?>
<table border="1" cellspacing="0">
    <tr>
        <th>No</th>
        <th>Kode</th>
        <th>Nama Uraian</th>
        <th>Pagu</th>
        <th>I</th>
        <th>II</th>
        <th>III</th>
        <th>IV</th>
        <th>V</th>
        <th>VI</th>
        <th>VII</th>
        <th>VIII</th>
        <th>IX</th>
        <th>X</th>
        <th>XI</th>
        <th>XII</th>
        <th>Ket</th>
    </tr>
    @foreach ($program as $a)
        <tr>
            <td>{{ ++$i }}</td>
            <td>{{ $a->kode }}</td>
            <td>{{ $a->nama }}</td>
            <td></td>
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
            <td>Ket</td>
        </tr>
        @foreach ($kegiatan as $b)
            @if ($b->program_id == $a->id)
                <tr>
                    <td>{{ ++$i }}</td>
                    <td>{{ $b->kode }}</td>
                    <td style="padding-left: 20px">{{ $b->nama }}</td>
                    <td></td>
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
                    <td>Ket</td>
                </tr>
                @foreach ($kro as $c)
                    @if ($c->kegiatan_id == $b->id)
                        <tr>
                            <td>{{ ++$i }}</td>
                            <td>{{ $c->kode }}</td>
                            <td style="padding-left: 40px">{{ $c->nama }}</td>
                            <td></td>
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
                            <td>Ket</td>
                        </tr>
                        @foreach ($ro as $d)
                            @if ($d->kro_id == $c->id)
                                <tr>
                                    <td>{{ ++$i }}</td>
                                    <td>{{ $d->kode }}</td>
                                    <td style="padding-left: 60px">{{ $d->nama }}</td>
                                    <td></td>
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
                                    <td>Ket</td>
                                </tr>
                                @foreach ($komponen as $e)
                                    @if ($e->ro_id == $d->id)
                                        <tr>
                                            <td>{{ ++$i }}</td>
                                            <td>{{ $e->kode }}</td>
                                            <td style="padding-left: 80px">{{ $e->nama }}</td>
                                            <td></td>
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
                                            <td>Ket</td>
                                        </tr>
                                        @foreach ($subkomponen as $f)
                                            @if ($f->komponen_id == $e->id)
                                                <tr>
                                                    <td>{{ ++$i }}</td>
                                                    <td>{{ $f->kode }}</td>
                                                    <td style="padding-left: 100px">{{ $f->nama }}</td>
                                                    <td></td>
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
                                                    <td>Ket</td>
                                                </tr>
                                                @foreach ($kodeakun as $g)
                                                    @if ($g->subkomponen_id == $f->id)
                                                        <tr>
                                                            <td>{{ ++$i }}</td>
                                                            <td>{{ $g->kode }}</td>
                                                            <td style="padding-left: 120px">{{ $g->nama }}</td>
                                                            <td></td>
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
                                                            <td>Ket</td>
                                                        </tr>
                                                        @foreach ($rencana as $h)
                                                            @if ($h->kodeakun_id == $g->id)
                                                                <tr>
                                                                    <td>{{ ++$i }}</td>
                                                                    <td style="text-align: right;">{{ $h->kode }}
                                                                    </td>
                                                                    <td style="padding-left: 140px">{{ $h->nama }}
                                                                    </td>
                                                                    <td>{{ $h->pagu }}</td>
                                                                    <td style="text-align: center;">{{ $h->januari }}
                                                                    </td>
                                                                    <td style="text-align: center;">{{ $h->februari }}
                                                                    </td>
                                                                    <td style="text-align: center;">{{ $h->maret }}
                                                                    </td>
                                                                    <td style="text-align: center;">{{ $h->april }}
                                                                    </td>
                                                                    <td style="text-align: center;">{{ $h->mei }}
                                                                    </td>
                                                                    <td style="text-align: center;">{{ $h->juni }}
                                                                    </td>
                                                                    <td style="text-align: center;">{{ $h->juli }}
                                                                    </td>
                                                                    <td style="text-align: center;">{{ $h->agustus }}
                                                                    </td>
                                                                    <td style="text-align: center;">{{ $h->september }}
                                                                    </td>
                                                                    <td style="text-align: center;">{{ $h->oktober }}
                                                                    </td>
                                                                    <td style="text-align: center;">{{ $h->november }}
                                                                    </td>
                                                                    <td style="text-align: center;">{{ $h->desember }}
                                                                    </td>
                                                                    <td>Ket</td>
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
    @endforeach

</table>
