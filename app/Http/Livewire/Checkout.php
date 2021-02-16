<?php

namespace App\Http\Livewire;

use App\Pesanan;
use App\User;
use Illuminate\Support\Facades\Auth;
use Livewire\Component;

class Checkout extends Component
{
    public $total_harga, $alamat, $nohp;

    public function mount()
    {
        if (!Auth::user()) {
            return redirect()->route('login');
        }

        $this->alamat = Auth::user()->alamat;
        $this->nohp = Auth::user()->nohp;

        $pesanan = Pesanan::where('user_id', Auth::user()->id)->where('status', 0)->first();

        if (!empty($pesanan)) {
            $this->total_harga = $pesanan->total_harga + $pesanan->kode_unik;
        } else {
            return redirect()->route('home');
        }
    }

    public function checkout()
    {
        $this->validate([
            'nohp' => 'required',
            'alamat' => 'required',
        ]);

        //update user
        $user = User::where('id', Auth::user()->id)->first();
        $user->nohp = $this->nohp;
        $user->alamat = $this->alamat;
        $user->update();

        //update pesanan
        $pesanan = Pesanan::where('user_id', Auth::user()->id)->where('status', 0)->first();
        $pesanan->status = 1;
        $pesanan->update();

        $this->emit('masukKeranjang');

        session()->flash('message', 'Sukses Checkout');

        return redirect()->route('history');
    }

    public function render()
    {
        return view('livewire.checkout');
    }
}
