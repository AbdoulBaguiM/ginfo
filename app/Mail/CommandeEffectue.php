<?php

namespace App\Mail;

use App\Models\Commande;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class CommandeEffectue extends Mailable
{
    use Queueable, SerializesModels;

    public $commande;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct(Commande $commande)
    {
        $this->commande = $commande;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->to($this->commande->c_email,$this->commande->c_nom)
            ->bcc('another@another.com')
            ->subject('Commande effectuée')
            ->view('emailCommande');
    }
}
