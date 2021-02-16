<div class="container">
    <div class="row mt-3">
        <div class="col">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="{{ route('home') }}" class="text-dark">Home</a></li>
                    <li class="breadcrumb-item active" aria-current="page">History</li>
                </ol>
            </nav>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            @if (session()->has('message'))
                <div class="alert alert-success">
                    {{ session('message') }}
                </div>
            @endif
        </div>
    </div>

    <div class="row mt-4">
        <div class="col">
            <div class="table-responsive">
                <table class="table text-center">
                    <thead>
                        <tr>
                            <td>No.</td>
                            <td>Tanggal Pesanan</td>
                            <td>Kode Pemesanan</td>
                            <td>Pesanan</td>
                            <td>Status</td>
                            <td align="right"><strong>Total Harga<strong></td>
                        </tr>
                    </thead>
                    <tbody>
                        <?php $no = 1; ?>
                        @forelse ($pesanans as $pesanan)
                            <tr>
                                <td>{{ $no++ }}</td>
                                <td>{{ $pesanan->created_at }}</td>
                                <td>{{ $pesanan->kode_pemesanan }}</td>
                                <td align="left">
                                    <?php $pesanan_details = \App\PesananDetail::where('pesanan_id',
                                    $pesanan->id)->get(); ?>
                                    @foreach ($pesanan_details as $pesanan_detail)
                                        <img src="{{ url('assets/jersey') }}/{{ $pesanan_detail->product->gambar }}"
                                            class="img-fluid" width="50">
                                        {{ $pesanan_detail->product->nama }} <br/>
                                    @endforeach
                                </td>
                                <td>
                                    @if ($pesanan->status == 1)
                                        Belum Dikirim
                                    @else
                                        Dikirim
                                    @endif
                                </td>
                                <td align="right">
                                    <strong> Rp. {{ number_format($pesanan->total_harga + $pesanan->kode_unik) }}</strong>
                                </td>
                            </tr>
                        @empty
                            <tr>
                                <td colspan="7">Data kosong</td>
                            </tr>
                        @endforelse

                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col">
            <div class="card shadow">
                <div class="card-body">
                    <p>Untuk pembayaran silakan transfer ke nomor rekening dibawah ini :
                    <div class="media">
                        <img src="{{ url('assets/bri.png') }}" class="mr-3" alt="BANK BRI" width="60">
                        <div class="media-body">
                            <h5 class="mt-0">Bank BRI</h5>
                            <p>No. Rekening 012345-098-0989876 atas nama <strong>xxxx xxxx xx</strong></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
