<?php

namespace App\Http\Livewire;

use App\Product;
use Livewire\Component;
use Livewire\WithPagination;

class ProductIndex extends Component
{
    use WithPagination;

    public $search;

    protected $updateQueryString = ['search'];

    public function updatingSearch()
    {
        $this->resetPage();
    }

    public function render()
    {
        if ($this->search) {
            $product = Product::where('nama', 'like', '%' . $this->search . '%')->paginate(8);
        } else {
            $product  = Product::paginate(8);
        }
        return view('livewire.product-index', [
            'products' => $product,
            'title' => 'Jersey List',
        ]);
    }
}
