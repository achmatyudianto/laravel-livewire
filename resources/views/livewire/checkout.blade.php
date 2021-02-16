<div class="container">
    <div class="row mt-3">
        <div class="col">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="{{ route('home') }}" class="text-dark">Home</a></li>
                    <li class="breadcrumb-item"><a href="{{ route('keranjang') }}" class="text-dark">Keranjang</a>
                    </li>
                    <li class="breadcrumb-item active" aria-current="page">Checkout</li>
                </ol>
            </nav>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            @if (session()->has('message'))
                <div class="alert alert-danger">
                    {{ session('message') }}
                </div>
            @endif
        </div>
    </div>

    <div class="row">
        <div class="col">
            <a href="{{ route('keranjang') }}" class="btn btn-dark btn-sm"><i class="fas fa-arrow-left"></i>
                Kembali</a>
        </div>
    </div>

    <div class="row mt-4">
        <div class="col">
            <h5>Informasi Pembayaran</h5>
            <hr />
            <p>Untuk pembayaran silakan transfer ke nomor rekening dibawah ini sebesar : <strong> Rp.
                    {{ number_format($total_harga) }}</strong></p>
            <div class="media">
                <img src="{{ url('assets/bri.png') }}" class="mr-3" alt="BANK BRI" width="60">
                <div class="media-body">
                    <h5 class="mt-0">Bank BRI</h5>
                    <p>No. Rekening 012345-098-0989876 atas nama <strong>xxxx xxxx xx</strong></p>
                </div>
            </div>
        </div>
        <div class="col">
            <h5>Informasi Pengiriman</h5>
            <hr />
            <form wire:submit.prevent="checkout">
                <div class="form-group">
                    <label for="">No. HP</label>
                    <input id="nohp" type="text" class="form-control @error('nohp') is-invalid @enderror"
                        wire:model="nohp" value="{{ old('nohp') }}" autocomplete="nohp" autofocus>
                    @error('nohp')
                        <span class="invalid-feedback" role="alert">
                            <strong>{{ $message }}</strong>
                        </span>
                    @enderror
                </div>
                <div class="form-group">
                    <label for="">Alamat</label>
                    <textarea class="form-control @error('alamat') is-invalid @enderror" wire:model="alamat"
                        value="{{ old('alamat') }}" autocomplete="alamat"></textarea>
                    @error('alamat')
                        <span class="invalid-feedback" role="alert">
                            <strong>{{ $message }}</strong>
                        </span>
                    @enderror
                </div>
                <button type="submit" class="btn btn-success btn-block"><i class="fas fa-arrow-right"></i>
                    Checkout</button>
            </form>
        </div>
    </div>
</div>
