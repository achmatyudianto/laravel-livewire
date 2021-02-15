<div class="container">

    {{-- BANNER --}}
    <div class="banner">
        <img src="{{ url('assets/slider/slider1.png') }}" alt="">
    </div>

    {{-- PILIH LIGA --}}
    <section class="pilih-liga mt-3">
        <h5><strong>Pilih Liga</strong></h5>
        <div class="row">
            @foreach ($ligas as $liga)
                <div class="col mt-1">
                    <a href="{{ route('products.liga', $liga->id) }}">
                        <div class="card shadow">
                            <div class="card-body text-center">
                                <img src="{{ url('assets/liga') }}/{{ $liga->gambar }}" class="img-fluid">
                            </div>
                        </div>
                    </a>
                </div>
            @endforeach
        </div>
    </section>

    {{-- BEST PRODUCT --}}
    <section class="products mt-5">
        <h5>
            <strong>Best Products</strong>
            <a href="{{ route('products') }}" class="float-right text-dark"><small> Lihat Semua</small></a>
        </h5>
        <div class="row mt-2">
            @foreach ($products as $product)
                <div class="col-md-3">
                    <div class="card">
                        <div class="card-body text-center">
                            <img src="{{ url('assets/jersey') }}/{{ $product->gambar }}" class="img-fluid">
                            <div class="row mt-1">
                                <div class="col-md-12">
                                    <strong>{{ $product->nama }}</strong>
                                    <p>Rp. {{ number_format($product->harga) }}</p>
                                </div>
                            </div>
                            <div class="row mt-1">
                                <div class="col-md-12">
                                    <a href="#" class="btn btn-block btn-dark">Detail</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            @endforeach
        </div>
    </section>
</div>
