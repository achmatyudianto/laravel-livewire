<div class="container">
    <div class="row mb-4">
        <div class="col">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="{{ route('home') }}" class="text-dark">Home</a></li>
                    <li class="breadcrumb-item active" aria-current="page">List Product</li>
                </ol>
            </nav>
        </div>
    </div>

    <div class="row">
        <div class="col-md-9">
            <h5><strong>{{ $title }}</strong></h5>
        </div>
        <div class="col-md-3">
            <div class="input-group mb-3">
                <input wire:model="search" type="text" class="form-control" placeholder="Search. . ."
                    aria-label="Search" aria-describedby="basic-addon1">
                <div class="input-group-prepend">
                    <span class="input-group-text" id="basic-addon1">
                        <i class="fas fa-search"></i>
                    </span>
                </div>
            </div>
        </div>
    </div>

    <section class="products mb-3">
        <div class="row mt-2">
            @foreach ($products as $product)
                <div class="col-md-3 mb-3">
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
                                    <a href="{{ route('product.detail', $product->id) }}"
                                        class="btn btn-block btn-dark">Detail</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            @endforeach
        </div>
    </section>

    <div class="row">
        <div class="col">
            {{ $products->links() }}
        </div>
    </div>
</div>
